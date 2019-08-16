require "rails_helper"

RSpec.describe "User signup" do
  let(:query) {
    "
      mutation userSignupTest(
        $clientId: String!,
        $clientSecret: String!,
        $email: String!,
        $password: String!,
        $passwordConfirmation: String!
      ){
        userSignup(
          clientId: $clientId,  
          clientSecret: $clientSecret,
          email: $email,
          password: $password,
          passwordConfirmation: $passwordConfirmation
        ) {
          user {
            id
            email
          }
          token
          errors
        }
      }
    "
  }

  let(:app) {
    Doorkeeper::Application.find_or_create_by({
      name: "React Native App",
      redirect_uri: "urn:ietf:wg:oauth:2.0:oob",
    })
  }

  describe "happy path" do
    it "just works" do
      params = {
        "clientId": "#{app.uid}",  
        "clientSecret": "#{app.secret}",
        "email": "test@test.com",
        "password": "password",
        "passwordConfirmation": "password"
      }

      response = TodoSchema.execute(query, variables: params)

      expect(response["errors"]).to_not be_present
      expect(response["data"]).to be_present

      response = response.dig("data", "userSignup")

      expect(response["user"]).to be_present
      expect(response["user"]["id"]).to eql(User.last.id.to_s)

      expect(response["token"]).to be_present
    end
  end

  describe "show errors if" do
    xit "wrong client app uid or password" do
    end

    xit "problem creating user" do
    end
  end
end