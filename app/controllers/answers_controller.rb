class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to @question, notice: 'Your answer has been posted successfully.'
    else
      @question = Question.find_by(id: params[:question_id])
      @answers = Question.find_by(id: params[:question_id]).answers.order('created_at desc')
      render :'questions/show'
    end
  end


  def update
    if !Answer.find_by(best_answer: true).nil?
      false_attributes =
        {
          best_answer: false
        }
      Answer.find_by(best_answer: true).update_attributes(false_attributes)
    end
    true_attributes =
      {
        best_answer: true
      }
    Answer.find_by(id: params[:id]).update_attributes(true_attributes)
    redirect_to question_path(params[:question_id])
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :description)
    end

end
