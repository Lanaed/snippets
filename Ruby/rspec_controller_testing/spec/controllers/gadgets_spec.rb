require 'spec_helper'


describe 'GET /gadgets' do

  before do
    Gadget.delete_all
  end
  let!(:gadget){Gadget.create(name:"test_name", body: "test_body")}
  before :each do
    get '/gadgets'
  end

  #DONE
  it "should display all gadgets" do
    expect(last_response.status).to be(200)
    expect(last_response.body).to include gadget.name
    expect(Gadget.all.count).to be(1)
  end
end

describe 'POST /gadgets' do

  let(:postRoute){post '/gadgets', params}

  context "when the request has valid parameters" do
      before {Gadget.delete_all}

      let(:params){{name:"test_name", body: "test_body"}}

      #DONE
      it "creates a new gadget" do
        g = Gadget.new(params)
        expect{post '/gadgets', params}.to change(Gadget, :count).by(1)
      end

      #DONE
      it "redirects the user to the /gadgets route" do
        post '/gadgets', params
        expect(last_response).to be_redirect
      end
  end

  context "when the request does not include a body value" do
    let(:params){{name:"test_name"}}
    it "does not create a new gadget" do
      expect{postRoute}.to change(Gadget, :count).by(0)
    end
    it "returns a status code of 422" do
      postRoute
      expect(last_response.status).to eq(422)
    end
  end

  context "when the request does not include a unique name value" do
    let(:params){{name:"test_name"}}
    it "does not create a new gadget" do
      expect{postRoute}.to change(Gadget, :count).by(0)
    end
    it "returns a status code of 422" do
      postRoute
      expect(last_response.status).to eq(422)
    end
  end
end
