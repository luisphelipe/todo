module Types::Models
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    
    field :tasks, [TaskType], null: true
  end
end
