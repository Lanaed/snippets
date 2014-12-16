require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns questions properly to @questions" do
      get :index
      expect(assigns(:questions)).to eq Question.order(created_at: :desc)
    end
  end

  describe "GET show" do

    #since we need a question to test this, create one here
    let(:question) {Question.create(:title => "test", :body => "test", :view_count => 0)}
    let(:answer) {Answer.create(:body => "blah", :question_id => question.id)}

    it "returns http success" do
      get :show, :id => question.id #call show with paramters (id) from our created question
      expect(response).to have_http_status(:success)
    end

    it "assigns question properly to @question" do
      get :show, :id => question.id
      expect(assigns(:question)).to eq question
    end

    it "assigns answers properly to @answers" do
      get :show, :id => question.id
      expect(assigns(:answers)).to eq question.answers
    end
  end

  describe "POST create" do
    it "creates a question with valid params" do
      expect{
        post :create, :question => {title: "test", body: "bod"}
        expect(response).to be_redirect
      }.to change {Question.count}.by(1)
    end

    it "does not create a question when params are invalid - body blank" do
      expect {
        post :create, :question => {title: "test"}
        expect(response).not_to be_redirect
      }.not_to change {Question.count}
    end

    it "does not create a question when params are invalid - title blank" do
      expect {
        post :create, :question => {body: "test"}
        expect(response).not_to be_redirect
      }.not_to change {Question.count}
    end

    it "does not create a question when params are invalid - title dup" do
      q = Question.create(title: "test", body: "bod")
      expect {
        post :create, :question => {title: q.title, body: "bluh"}
        expect(response).not_to be_redirect
      }.not_to change {Question.count}
    end
  end

  describe "GET edit" do

    #since we need a question to test this, create one here
    let(:question) {Question.create(:title => "test", :body => "test", :view_count => 0)}
    let(:answer) {Answer.create(:body => "blah", :question_id => question.id)}

    it "returns http success" do
      get :edit, :id => question.id #call show with paramters (id) from our created question
      expect(response).to have_http_status(:success)
    end

    it "assigns question properly to @question" do
      get :edit, :id => question.id
      expect(assigns(:question)).to eq question
    end
  end

  describe "PUT Update" do
    before :each do
      @question = Question.create(title: "test", body: "bod")
    end

    it "finds the correct question" do
      @attr = { title: "new title", body: "new body"}
      put :update, :id => @question.id, :question => @attr
      @question.reload
      expect(@question.title).to eq("new title")
      expect(@question.body).to eq("new body")
      expect(response).to be_redirect
    end

    it "does not update a question when params are invalid - body blank" do
      @attr = { title: "new title", body: ""}
      put :update, :id => @question.id, :question => @attr
      @question.reload
      expect(@question.title).to eq("test")
      expect(@question.body).to eq("bod")
    end

    it "does not update a question when params are invalid - title blank" do
      @attr = { title: "", body: "new bahhdee"}
      put :update, :id => @question.id, :question => @attr
      @question.reload
      expect(@question.title).to eq("test")
      expect(@question.body).to eq("bod")
    end

    it "does not create a question when params are invalid - title dup" do
      q = Question.create(title: "test test", body: "bod")
      @attr = { title: "test test", body: "new bahhdee"}
      put :update, :id => @question.id, :question => @attr
      @question.reload
      expect(@question.title).to eq("test")
      expect(@question.body).to eq("bod")
    end
  end

  describe "DELETE Destroy" do
    before :each do
      @question = Question.create(title: "test", body: "bod")
    end

    it "deletes a question" do
      expect {
        delete :destroy, id: @question
      }.to change {Question.count}.by(-1)
    end

    it "redirects to questions#index" do
      delete :destroy, id: @question
      expect(response).to be_redirect
    end

  end

end
