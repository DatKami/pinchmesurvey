class AnswersController < ApplicationController

	def show
		@answer = Answer.find(params[:id])
	end
	
	def new
		@answer = Answer.new
	end
	
	def edit
		@answer = Answer.find(params[:id])
	end
	
	def create
		@question = Question.find(params[:question_id])
		@answer_form = @question.answers.new(answer_params)

		if @answer_form.save
			redirect_to @answer_form.question
		else
			render :template => "answer/show"
		end
	end
	
	def update
		@answer = Answer.find(params[:id])
		
		if @answer.update(answer_params)
			redirect_to @answer.question
		else
			render 'edit'
			#not done
		end
	end
	
	def destroy
		@answer = Answer.find(params[:id])
		@answer.destroy
		
		redirect_to @answer.question
	end
	
	private
		def answer_params
			params.require(:answer).permit(:answer)
		end
end
