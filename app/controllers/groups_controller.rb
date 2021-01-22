class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    def index
        @groups = Group.all
    end

    def show
    end

    def new
        @group = Group.new 
    end

    def edit
    end

    def update
        @group.update(group_params)
    end

    def create
        @group = Group.new(group_params)
        respond_to do |format|
            if @group.save
                format.html { redirect_to concerts_url, notice: 'Group was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def destroy
        @group.destroy
        respond_to do |format|
            format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
        @group = Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:members, :membersgender, :name)
    end
end


