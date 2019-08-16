module Mutations
  class UserLogin < BaseMutation
    argument :client_id, String, required: true
    argument :client_secret, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::Models::UserType, null: true
    field :token, String, null: true
    field :errors, [String], null: true


    def resolve(args)
      app = find_doorkeeper_app(args[:client_id], args[:client_secret])

      return { errors: ["cliente app nao encontrado"] } unless app

      user = User.find_by_email(args[:email])

      return { errors: ["email ou senha invalidos"] } unless user and user.valid_password?(args[:password])
      
      token = create_access_token(app, user).token

      { user: user, token: token }
    end

    private

    def find_doorkeeper_app(client_id, client_secret) 
      Doorkeeper::Application::by_uid_and_secret(client_id, client_secret)
    end

    def create_access_token(app, user)
      Doorkeeper::AccessToken.create!(:application_id => app.id, :resource_owner_id => user.id)
    end
  end
end