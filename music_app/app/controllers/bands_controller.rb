class BandsController < ApplicationController

    def index 
        @bands = Band.all

        render :index
    end

    def create
        debugger
        @band = current_user.bands.new(band_params)
        if @band.save
            redirect_to bands_url(@band)
        else
            flash[:errors] = @cat.errors.full_messages
            render :new
        end
    end

    def new
        @band = Band.new

        render :new
    end

    def edit
        @band = current_user.bands.find(params[:id])

        render :edit
    end

    def show
        @band = Band.find(params[:id])

        render :show
    end

    def update
        @band = current_user.bands.find(params[:id])

        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            flash.new[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def destroy
        @band = current_user.bands.find(params[:id])

        if @band.delete
            redirect_to bands_url
        else
            redirect_to band_url(@band)
        end
    end

    private 

    def band_params
        params.require(:band).permit(:name)
    end
end