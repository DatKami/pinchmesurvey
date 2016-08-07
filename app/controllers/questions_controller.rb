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
		@lowest = 0
		if @survey.questions.count > 0
			@lowest = @survey.questions.order("arbitrary_sort DESC").first.arbitrary_sort
		end
		@question_form = @survey.questions.new(question_params)
		@question_form.arbitrary_sort = (@lowest + 1)
		if @question_form.save
			redirect_to @question_form.survey
		else
			render :template => "surveys/show"
		end
	end
	
	def shift_up
		@question = Question.find(params[:id])
		if @question == @question.survey.questions.order("arbitrary_sort ASC").first
			#already the highest it can be
		else
			@swapped_question = @question.survey.questions.where(["arbitrary_sort < :arbitrary_id", {arbitrary_id: @question.arbitrary_sort}]).order("arbitrary_sort DESC").first
			#3 place swap
			@temp = @swapped_question.arbitrary_sort
			@swapped_question.arbitrary_sort = @question.arbitrary_sort
			@question.arbitrary_sort = @temp

			@question.save
			@swapped_question.save
		end
		redirect_to @question.survey
	end

	def shift_down
		@question = Question.find(params[:id])
		if @question == @question.survey.questions.order("arbitrary_sort DESC").first
			#already the lowest it can be
		else
			@swapped_question = @question.survey.questions.where(["arbitrary_sort > :arbitrary_id", {arbitrary_id: @question.arbitrary_sort}]).order("arbitrary_sort ASC").first
			#3 place swap
			@temp = @swapped_question.arbitrary_sort
			@swapped_question.arbitrary_sort = @question.arbitrary_sort
			@question.arbitrary_sort = @temp

			@question.save
			@swapped_question.save
		end
		redirect_to @question.survey
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
