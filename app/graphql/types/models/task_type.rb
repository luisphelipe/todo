module Types::Models
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :done, Boolean, null: false

    field :user, Types::Models::UserType, null: false
  end
end
