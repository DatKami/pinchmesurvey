class SubmissionsController < ApplicationController
	def index
		@surveys = Survey.all
		@submissions = Submission.all
	end
	
	def new
		@survey = Survey.find(params[:survey_id])
		@submission = Submission.new
		@submission.survey = @survey
		
		@submission.survey.questions.each do |question|
			
			@response = @submission.responses.new
			@response.question = question
			
			p @response
			p question
			
			if @response.save
			else
				p "Not sure what's happening."
				redirect_to 'surveys/index'
				return
			end
			
		end
		
		if @submission.save
			redirect_to @submission
		else
			redirect_to 'surveys/index'
		end
	end
	
=begin
	def create
		@question = Question.find(params[:question_id])
		@answer_form = @question.answers.new(answer_params)

		if @answer_form.save
			redirect_to @answer_form.question
		else
			render :template => "answer/show"
		end
	end
=end	
	
	def show
		@submission = Submission.find(params[:id])
	end

	def destroy
		@submission = Submission.find(params[:id])
		@submission.destroy
		
		redirect_to submissions_path
	end
	
	private
		def submission_params
			params.require(:submission).permit(:survey_id)
		end
	
end
