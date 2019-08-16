module Types
  module Public
    class MutationType < Types::BaseObject
      field :user_signup, mutation: Mutations::UserSignup
      field :user_login, mutation: Mutations::UserLogin
    end
  end
end
