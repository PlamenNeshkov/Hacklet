require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    {
      first_name: "John",
      last_name: "Doe",
      email: "johndoe@example.com",
      password: "password1234",
      password_confirmation: "password1234"
    }
  }

  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email case insensitive" do
      user.email = "JOHNDOE@EXAMPLE.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a valid email address" do
      user.email = "johndoe"
      expect(user).to_not be_valid
    end
  end

  context "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "JOHNDOE@EXAMPLE.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("JOHNDOE@EXAMPLE.COM").
        to("johndoe@example.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "JOHNDOE@EXAMPLE.COM"
      expect(user.save).to be true
      expect(user.email).to eq("johndoe@example.com")
    end
  end
end
