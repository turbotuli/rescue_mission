class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('created_at desc')
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

end
