require "rails_helper"

RSpec.describe "Mutation toggle task" do
  let(:query) {"
      mutation ToggleTaskTest($taskId: ID!){
        toggleTask(taskId: $taskId) {
          task {
            id
            title
            done
          }
        }
      }
    "
  }

  it "create and return task type" do
    user = FactoryBot.create(:user, :with_tasks)
    task = user.tasks.first
    expect(task.done).to eql(false)

    response = TodoSchema.execute(query, context: { current_user: user }, variables: { taskId: task.id })

    expect(response['data']).to be_present
    expect(response['erros']).not_to be_present

    response = response.dig('data', 'toggleTask', 'task')

    expect(response['done']).to eql(true)
  end

  xit "returns error if task not found" do
  end
end