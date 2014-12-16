class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.votes.create(:direction => 1)
    redirect_to question_path(Question.find(params[:question_id]))
  end

  def downvote
   @answer = Answer.find(params[:id])
   @answer.votes.create(:direction => -1)
   redirect_to question_path(Question.find(params[:question_id]))
 end

 private
 def answer_params
  params.require(:answer).permit(:body)
end
end
