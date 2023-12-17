class Api::V1::ArchitecturesController < ApplicationController
  before_action :set_architecture, except: [:index, :create]
  def index
    architectures = Architecture.eager_load(:address, :category)
    render json: architectures, each_serializer: ArchitectureSerializer
  end

  def create
    category = Category.find(params[:category_id])
    architecture = category.architectures.create(architecture_params)
    if architecture
      render json: architecture, serializer: ArchitectureSerializer
    else 
      render json: {
        error: ['建造物作成: 失敗'],
        status: 400
      }
    end
  end

  def show
    render json: @architecture, serializer: ArchitectureSerializer
  end

  def update
    if @architecture.update(architecture_params)
      render json: @architecture, serializer: ArchitectureSerializer
    else
      render json: {
        error: ['建造物編集: 失敗'],
        status: 400
      }
    end
  end

  def destroy
    @architecture = Architecture.find(params[:id])
    if @architecture
      @architecture.destroy
      render json: {
        message: ['建造物削除: 成功'],
        status: 200,
        type: 'Success'
      }
    else
      render json: {
        error: ['建造物削除: 失敗'],
        status: 400
      }
    end
  end

  private

  def set_architecture
    @architecture = Architecture.find(params[:id])
  end

  def architecture_params
    params.require(:architecture).permit(:name, :imageUrl, :category_id)
  end
end
