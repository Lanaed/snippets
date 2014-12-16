require 'spec_helper'

describe 'GET /widgets' do

  context "when a user is not logged in" do

    before do
      Widget.delete_all
    end
    let!(:widget){Widget.create(title:"test_title", content: "test_content")}
    before :each do
      get '/widgets'
    end

    it "displays all widgets" do
      expect(last_response.status).to be(200)
      expect(last_response.body).to include widget.title
      expect(Widget.all.count).to be(1)
    end
  end

  context "when a user is logged in" do

    let!(:first_widget){Widget.create(title: "test_title_first", content: "first_content")}
    let!(:second_widget){Widget.create(title: "test_title_second", content: "second_content")}
    let!(:user){User.create(username: "meg", password: "password")}

    before :each do
     user.widgets << first_widget
     authenticate_session = user
     get '/widgets', {}, {'rack.session' => {user_id: user.id}}
   end

   after do
     Widget.delete_all
     User.delete_all
   end

   it "displays all of the given user's widgets" do
    expect(last_response.body).to include first_widget.title
    expect(last_response.body).to include first_widget.content
  end
  it "does not display other users' widgets" do
    expect(last_response.body).not_to include second_widget.title
    expect(last_response.body).not_to include second_widget.content
  end

end
end
