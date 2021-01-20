class ConcertsController < ApplicationController
    

    def index
        @concerts = Concert.all
    end

    def show
        @concert = Concert.find_by(params[:id])
    end

    def new
        @concert = Concert.new
    end

    def edit
    end

    def create
        @concert = Concert.new(concert_params)
    end

    def destroy
        @concert.destroy
    end

    private
    def concert_params
        params.require(:concert).permit(:participants, :duration, :concert_date, :Group_id)
    end
end
