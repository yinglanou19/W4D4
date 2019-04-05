class AlbumsController < ApplicationController
    def index
        if params.has_key?(:band_id)
            @albums = Album.where(band_id: params[:band_id]  )
        else
            @albums = Album.all
        end
        render :index
    end

    def new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to albums_url
        else
            render json: @album.errors.full_messages
        end
    end

    def album_params
        params.require(:album).permit(:band_id, :title, :yr, :live)
    end
end
