class QuestionsController < ApplicationController
    before_action :set_quiz
    before_action :set_question, only: [:show, :edit, :update, :destroy]
  
    def show
    end
  
    def new
      @question = @quiz.questions.new
    end
  
    def create
      @question = @quiz.questions.new(question_params)
      if @question.save
        redirect_to quiz_path(@quiz), notice: 'Question was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end
  
    def set_question
      @question = @quiz.questions.find(params[:id])
    end
  
    def question_params
      params.require(:question).permit(:content)
    end
  end
  