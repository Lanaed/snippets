class QuestionsController < ApplicationController

  include QuestionsHelper

  before_action only: [:index, :create] do
    set_up_index
  end

  def index
    @question = Question.new #for error detection of any? to not fail
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question successfully created"}
        format.js { render :create }
      else
        format.html { render action: 'index'}
        format.js { render :error }
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path

  end

  def upvote
    @question = Question.find(params[:id])
    @question.votes.create(:direction => 1)
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js { render :change_votes }
    end
  end

  def downvote
   @question = Question.find(params[:id])
   @question.votes.create(:direction => -1)
   respond_to do |format|
      format.html { redirect_to questions_path }
      format.js { render :change_votes }
    end
 end

 private
   def question_params
    params.require(:question).permit(:title, :body)
   end

   def set_up_index
    @questions = Question.order(created_at: :desc)
    @o = QuestionsHelper::Octokit.new
   end


end
