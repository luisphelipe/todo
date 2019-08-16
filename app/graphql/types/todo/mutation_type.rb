module Types
  module Todo
    class MutationType < Types::BaseObject
      field :create_task, mutation: Mutations::CreateTask
      field :toggle_task, mutation: Mutations::ToggleTask
    end
  end
end
