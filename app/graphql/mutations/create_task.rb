module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true

    field :task, Types::Models::TaskType, null: true
    field :errors, [String], null: true


    def resolve(args)
      task = context[:current_user].tasks.new(title: args[:title])

      return { errors: task.errors.full_messages } unless task.save

      { task: task }
    end
  end
end