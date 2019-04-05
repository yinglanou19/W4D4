class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url    # modify to show page later!!!
        else
            flash[:errors] = @band.errors.full_messages
            render :new
        end
    end

    
    def show
        @band = Band.find_by(id: params[:id])   
        render :show
    end

    def edit
        @band = Band.find_by(id: params[:id]) 
        render :edit
    end

    def update
        @band = Band.find_by(id: params[:id])
        @band.update(band_params)
        render :show
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        Band.destroy(@band.id) if @band
        redirect_to bands_url
    end


    def band_params
        params.require(:band).permit(:name)
    end

end
