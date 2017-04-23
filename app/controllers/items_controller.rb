class ItemsController < ApplicationController
	before_action :find_book, only: [:show, :edit, :update, :destroy]
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(param_list)
		if @item.save 
			redirect_to root_path
		else
			#redirect_to new_item_path
			render 'new'
		end

	end

	def show
	end

	def edit
	end

	def update
		if @item.update(param_list)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path
		
	end

	private 
	def param_list
		params.require(:item).permit(:title,:description)
	end

	def find_book
		@item= Item.find(params[:id])
	end
end
