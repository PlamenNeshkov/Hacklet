require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    it "authenticates the user" do
      user = User.create(first_name: "John", last_name: "Doe",
          email: "johndoe@example.com", password: "12345",
          password_confirmation: "12345")
      expect(user).to receive(:authenticate)
      post :create, email: user.email, password: user.password
    end
  end
end
