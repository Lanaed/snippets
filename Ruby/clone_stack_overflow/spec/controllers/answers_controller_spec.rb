require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

  describe "POST create" do
    before :each do
      @question = Question.create(title: "test", body: "bod")
    end

    it "creates an answer with valid params" do
      expect{
        post :create, :question_id => @question.id, :answer => {body: "bod"}
        expect(response).to be_redirect
        }.to change {Answer.count}.by(1)
    end

    it "does not create an answer with invalid params" do
      expect{
        post :create, :question_id => @question.id, :answer => {body: ""}
        }.not_to change {Answer.count}
    end

    # it "does not create a answer when params are invalid - body blank" do
    #   expect {
    #     post :create, :answer => {title: "test"}
    #     expect(response).not_to be_redirect
    #   }.not_to change {Answer.count}
    # end

    # it "does not create a answer when params are invalid - title blank" do
    #   expect {
    #     post :create, :answer => {body: "test"}
    #     expect(response).not_to be_redirect
    #   }.not_to change {Answer.count}
    # end

    # it "does not create a answer when params are invalid - title dup" do
    #   q = answer.create(title: "test", body: "bod")
    #   expect {
    #     post :create, :answer => {title: q.title, body: "bluh"}
    #     expect(response).not_to be_redirect
    #   }.not_to change {Answer.count}
    # end
  end

end
