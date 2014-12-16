require 'rails_helper'

describe "Questions" do
  let!(:question) {Question.create(title: "Test title", body: "Test body", view_count: 0)}
  let!(:questions) {[question, Question.create(title: "Test title 2", body: "Test body 2", view_count: 0)]}
  let!(:answer) {Answer.create(body: "test", question_id: question.id)}

  describe "can see all questions" do
    it "by visiting homepage" do
      visit ('/')
      questions.each do |quest|
        expect(page).to have_content quest.title
      end
    end
  end

  describe "user can see answers" do
    it "by clicking on question title" do
      visit ('/')
      click_link("#{question.title}")
      expect(current_path).to eq(question_path(question))
      expect(page).to have_content question.body
      expect(page).not_to have_content questions.last.body
    end
  end

end
