class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_admin, except: [:index, :show]
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  def index
    @links = Link.all
  end

  # GET /links/1
  def show
  end

  # GET /links/new
  def new
    @link = Link.new if @adm
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  def create
    @link = Link.new(link_params) if @adm

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /links/1
  def update
    if @adm
      if @link.update(link_params)
        redirect_to @link, notice: 'Link was successfully updated.'
      else
        render :edit if @adm
      end
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy if @adm
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

  def is_admin
    @adm=current_user.has_role? :admin
  end

    # Only allow a trusted parameter "white list" through.
    def link_params
      params.require(:link).permit(:rocket, :tinkoff, :name, :telegram, :weight)
    end
end
