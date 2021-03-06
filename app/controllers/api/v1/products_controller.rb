module Api
  module V1
    class ProductsController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        @products = Product.all
      end

      def new
        @product = Product.new
      end

      def create
        product = Product.new(product_params)
        if product.save
          render status: 201, json: product
        else
          render status: 422, json: { errors: product.errors }
        end
      end

      def edit
        @product = Product.find(params[:id])
      end

      def update
        @product = Product.update(params[:id], product_params)
      end

      private
      def product_params
        params.require(:product).permit(:name, :price)
      end
    end
  end
end
