class QuestionsController < ApplicationController


	#index, show, new, edit, create, update and destroy
	#place before private or protected methods

	def show
		@question = Question.find(params[:id])
	end

	def new
		@question = Question.new
	end
	
	def edit
		@question = Question.find(params[:id])
	end
	
	def create
		@survey = Survey.find(params[:survey_id])
		@question_form = @survey.questions.new(question_params)

		if @question_form.save
			redirect_to @question_form.survey
		else
			render :template => "surveys/show"
		end
	end
	
	def update
		@question = Question.find(params[:id])
		
		if @question.update(question_params)
			redirect_to @question.survey
		else
			render 'edit'
			#not done
		end
	end
	
	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		
		redirect_to @question.survey
	end
	
	private
		def question_params
			params.require(:question).permit(:title, :answer_type)
		end
		


end
