class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  # GET /cats
  # GET /cats.json
  def index
    @cats = if admin?
      Cat.all
    elsif current_user.cat_reading_wrangler?
      #current_user.cat_reading_wrangler.cats
    else
      show
    end
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
    redirect_to cats_path unless admin_user? || authorized_cat?
  end

  # GET /cats/new
  def new
    if admin_user? || current_user.new_cat_account?
      @cat = Cat.new
    else
      target = authorized_cat? ? edit_cat_path(@cat) : cats_path
    end
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  # POST /cats.json
  def create
    @cat = Cat.new(cat_params)

    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1
  # PATCH/PUT /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.html { redirect_to @cat, notice: 'Cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :edit }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url, notice: 'Cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    def authorized_cat?
      @cat == current_user.cat
    end

    def admin_user?
      current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_params
      params.fetch(:cat, {})
    end
end
