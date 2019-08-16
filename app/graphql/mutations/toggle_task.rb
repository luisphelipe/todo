module Mutations
  class ToggleTask < BaseMutation
    argument :task_id, ID, required: true

    field :task, Types::Models::TaskType, null: true
    field :errors, [String], null: true


    def resolve(args)
      task = context[:current_user].tasks.find(args[:task_id])

      return { errors: ["tarefa nao encontrada"] } unless task

      task.update(done: !task.done)

      { task: task }
    end
  end
end