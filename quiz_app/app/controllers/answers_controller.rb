class AnswersController < ApplicationController
    before_action :set_quiz
    before_action :set_question
    before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
    def new
      @answer = @question.answers.new
    end
  
    def create
      @answer = @question.answers.new(answer_params)
      if @answer.save
        redirect_to quiz_question_path(@quiz, @question), notice: 'Answer was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end
  
    def set_question
      @question = @quiz.questions.find(params[:question_id])
    end
  
    def set_answer
      @answer = @question.answers.find(params[:id])
    end
  
    def answer_params
      params.require(:answer).permit(:content, :correct)
    end
  end
  