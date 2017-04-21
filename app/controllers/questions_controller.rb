class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('created_at desc')
  end

  def show
    @question = Question.find_by(id: params[:id])
    # why doesn't @question.answers work?
    @answers = Question.find_by(id: params[:id]).answers.order('created_at desc')
    @answer = Answer.new
    if !current_user.nil?
      @edit = true if current_user.id == @question.user_id
      @can_answer = true if !current_user.id.nil? && current_user.id != @question.user_id
    end
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])
    if current_user.id == @question.user_id
      @question.update_attributes(question_params)
      redirect_to @question, notice: "Your question has been updated."
    else
      redirect_to @question, notice: "You cannot update a question that is not yours."
    end
  end

  def create
    @question = Question.new(question_params)
    @question.update_attributes(
      {
        user_id: session[:user_id]
      }
    )
    if @question.save
      redirect_to @question, notice: 'Your question has been posted successfully.'
    else
      render :new
    end
  end

  def destroy
    Question.find_by(id: params[:id]).delete
    Answer.where(question_id: params[:id]).delete_all

    redirect_to questions_index_path, notice: 'Your question has been deleted.'
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end

end
