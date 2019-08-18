require "rails_helper"

RSpec.describe "Mutation toggle task" do
  let(:query) {"
      mutation DeleteTaskTest($taskId: ID!){
        deleteTask(taskId: $taskId) {
          task {
            id
            title
            done
          }
        }
      }
    "
  }

  it "delete and return task type" do
    user = FactoryBot.create(:user, :with_tasks)
    task = user.tasks.first
    expect(user.tasks.count).to eql(10)

    response = TodoSchema.execute(query, context: { current_user: user }, variables: { taskId: task.id })

    expect(response['data']).to be_present
    expect(response['erros']).not_to be_present

    expect(user.tasks.count).to eql(9)
  end

  xit "returns error if task not found" do
  end
end