class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, except:[:index, :create]
  def index
    categories = Category.preload(:architectures)
    render json: categories, each_serializer: CategorySerializer
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, serializer: CategorySerializer
    else
      render json: {
        error: ['カテゴリ作成: 失敗'],
        status: 400
      }
    end
  end

  def show
    render json: @category, serializer: CategorySerializer
  end
  
  def update
    if @category.update(category_params)
      render json: {
        message: ['カテゴリ編集: 成功'],
        status: 200,
        type: 'Success'
      }
    else
      render json: {
        message: ['カテゴリ編集: 失敗'],
        status: 400,
      }
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    if @category
      @category.destroy
      render json: { 
        message: ['カテゴリ削除: 成功'],
        status: 200,
        type: 'Success' 
      }
    else 
      render json: {
        error: ['カテゴリ削除: 失敗'],
        status: 400
      }
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.permit(:name)
  end
end
