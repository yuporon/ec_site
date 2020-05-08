class Public::AddressesController < ApplicationController
    def index
        @address = Address.new
        @addresses = current_end_user.addresses
    end

    def create
        address = Address.new(address_params)
        address.end_user_id = current_end_user.id
        address.save
        redirect_to public_addresses_path
    end

    def update
        address = Address.find(params[:id])
        address.update(address_params)
        redirect_to public_addresses_path
    end

    def destroy
        address = Address.find(params[:id])
        address.destroy
        redirect_to public_addresses_path
    end

    def edit
        @address = Address.find(params[:id])
    end

    private
        def address_params
            params.require(:address).permit(:postal_code, :address, :address_name)
        end
end
