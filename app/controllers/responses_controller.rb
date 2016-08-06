class ResponsesController < ApplicationController
  def show
    @response = Response.find(params[:id])

    redirect_to edit_response_path
  end
    def edit 
    @response = Response.find(params[:id])
  end
    def update
    #we need to provide an empty array incase the post doesn't, to force an update
    params[:response][:answer_ids] ||= [] 
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
      params.require(:response).permit(:text_response, :answer_id, :answer_ids => [])
    end
end
