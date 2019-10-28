class UsrsController < ApplicationController
  before_action :set_usr, only: [:show, :edit, :update, :destroy]

  # GET /usrs
  def index
    @usrs = Usr.all
  end

  # GET /usrs/1
  def show
  end

  # GET /usrs/new
  def new
    @usr = Usr.new
  end

  # GET /usrs/1/edit
  def edit
  end

  # POST /usrs
  def create
    @usr = Usr.new(usr_params)

    if @usr.save
      redirect_to @usr, notice: 'Usr was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /usrs/1
  def update
    if @usr.update(usr_params)
      redirect_to @usr, notice: 'Usr was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /usrs/1
  def destroy
    @usr.destroy
    redirect_to usrs_url, notice: 'Usr was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usr
      @usr = Usr.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usr_params
      params.require(:usr).permit(:name, :email, :password, :role)
    end
end
