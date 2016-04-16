class ProductsController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.screenshots.new
  end

  # GET /products/1/edit
  def edit
    @product.screenshots.new
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
# https://u.osu.edu/hasnan.1/2014/03/30/rails-4-multiple-file-upload-with-carrierwave-nested-form-and-jquery-file-upload/
# http://stackoverflow.com/questions/13538297/carrierwave-file-uploda
    respond_to do |format|
      if @product.save
          if params[:screenshots_attributes]
            params[:screenshots_attributes].each do |screenshot|
              if screenshot[:image]
                @product.screenshots.create(image: screenshot[:image])
              end
            end
          end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:screenshots_attributes]
          params[:screenshots_attributes].each do |screenshot|
            @product.screenshots.create(image: screenshot[:image])
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.screenshots.each do |i|
      i.destroy
    end
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :stock, :screenshots_attributes => [:product_id, :image, :_destroy])
    end
end
