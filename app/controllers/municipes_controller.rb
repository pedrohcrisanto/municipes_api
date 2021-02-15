class MunicipesController < ApplicationController
    before_action :set_municipe, only: [:show, :update]

    def index
        @municipes = Municipe.all

        render json: @municipes
    end

    def show
        render json: @municipe
    end

    def create
        @municipe = Municipe.new(municipe_params)
        @municipe.address.build

        if @municipe.save
          render json: @municipe, status: :created, location: @municipe
        else
          render json: @municipe.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if @municipe.update(municipe_params)
            render json: @municipe
          else
            render json: @municipe.errors, status: :unprocessable_entity
        end
    end

    def fill
    end

private

    def set_municipe
        @municipe = Muncipe.find(params[:id])
    end

    def municipe_params
        params.require(:municipe).permit(
        :full_name, :cpf, :birthdate, :phone, :status, :email, 
        address_attributes: [
            :id, :zip, :street, :complement, :neighborhood, :city, :uf, :ibge_code
        ])
    end
end
