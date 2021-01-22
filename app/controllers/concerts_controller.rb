class ConcertsController < ApplicationController
    before_action :set_concert, only: [:show, :edit, :update, :destroy]

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
        @groups = Group.all
        respond_to do |format|
            if @concert.save
                format.html { redirect_to concerts_url, notice: 'Concert was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def destroy
        @concert.destroy
        respond_to do |format|
            format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
        @concert = Concert.find(params[:id])
    end

    def concert_params
        params.require(:concert).permit(:participants, :duration, :concert_date, :Group_id)
    end
end
