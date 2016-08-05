class ResponsesController < ApplicationController
	def show
		@response = Response.find(params[:id])
	end
	
	def edit 
		@response = Response.find(params[:id])
	end
	
	def update
		@response = Response.find(params[:id])
		
		if @response.update(response_params)
			redirect_to @response.submission
		else
			render 'edit'
			#not done
		end
	end
	
	private
		def response_params
			params.require(:response).permit(:text_response)
		end
end
