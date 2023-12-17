class Api::V1::AddressesController < ApplicationController
  before_action :set_address, except: [:index, :create]
  def index
    addresses = Address.eager_load(:architecture)
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(addresses, each_serializer: AddressSerializer),
      message: ['住所一覧取得: 成功'],
      status: 200,
      type: 'Success'
    }
  end

  def create
    architecture = Architecture.find(params[:architecture_id])
    address = architecture.create_address(address_params)
    if address
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(address, serializer: AddressSerializer),
        message: ['住所作成: 成功'],
        status: 200,
        type: 'Success'
      }
    else
      render json: {
        error: ['住所作成: 失敗'],
        status: 400
      }
    end
  end

  def show
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(@address, serializer: AddressSerializer),
      message: ['住所取得: 成功'],
      status: 200,
      type: 'Success'
    }
  end

  def update
    if @address.update(address_params)
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@address, serializer: AddressSerializer),
        message: ['住所編集: 成功'],
        status: 200,
        type: 'Success'
      }
    else 
      render json: {
        error: ['住所編集: 失敗'],
        status: 400
      }
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    if @address
      @address.destroy
      render json: {
        message: ['住所削除: 成功'],
        status: 200,
        type: 'Success'
      }
    else
      render json: {
        error: ['住所削除: 失敗'],
        status: 400
      }
    end
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end
  def address_params
    params.require(:address).permit(:prefecture, :city, :suite, :architecture_id)
  end
end
