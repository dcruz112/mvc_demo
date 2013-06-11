class MammalsController < ApplicationController
	before_action :set_mammal, only: [:show, :edit, :destroy]

	def index
		@mammals = Mammal.all
	end

	def show
	end

	def new
		@mammal = Mammal.new
	end

	def edit
	end

	def update

		respond_to do |format|
     		 if @mammal.save
        		format.html { redirect_to @mammal, notice: 'Mammal was successfully updated.' }
        		format.json { head :no_content }
      		else
        		format.html { render action: 'edit' }
	        	format.json { render json: @mammal.errors, status: :unprocessable_entity }
      		end
    	end
		
	end

	def create
		@mammal = Mammal.new(mammal_params)

		respond_to do |format|
     		 if @mammal.save
        		format.html { redirect_to @mammal, notice: 'Mammal was successfully created.' }
        		format.json { render action: 'show', status: :created, location: @mammal }
      		else
        		format.html { render action: 'new' }
	        	format.json { render json: @mammal.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def destroy
    	@mammal.destroy
    	respond_to do |format|
      		format.html { redirect_to mammals_url }
      		format.json { head :no_content }
    	end
  	end

	private

	def mammal_params
		params.require(:mammal).permit(:name, :netid, :class_year)
	end

	def set_mammal
		@mammal = Mammal.find(params[:id])
	end


end