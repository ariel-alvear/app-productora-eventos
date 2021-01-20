class ConcertsController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @concerts = Concert.all
    end

    def show
    end

    def new
        @concert = Concert.new 
        @groups = Group.all
    end

    def edit
        @groups = Group.all
    end

    def update
        @concert.update(concert_params)
    end

    def create
        @concert = Concert.new(concert_params)
        @concert.save
    end

    def destroy
        @concert.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
        @concert = Concert.find(params[:id])
    end

    def concert_params
        params.require(:concert).permit(:participants, :duration, :concert_date, :group_id)
    end
end
