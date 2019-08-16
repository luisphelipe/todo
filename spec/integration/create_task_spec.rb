require "rails_helper"

RSpec.describe "Mutation create task" do
  let(:query) {"
      mutation CreateTaskTest($title: String!){
        createTask(title: $title) {
          task {
            id
            title
            done

            user {
              email
            }
          }
        }
      }
    "
  }

  it "create and return task type" do
    user = FactoryBot.create(:user)
    expect(user.tasks.count).to eql(0)

    response = TodoSchema.execute(query, context: { current_user: user }, variables: { title: 'test_task' })

    expect(response['data']).to be_present
    expect(response['erros']).not_to be_present

    response = response.dig('data', 'createTask', 'task')

    expect(response['title']).to eql('test_task')
    expect(response['done']).to eql(false)
    expect(response['user']['email']).to eql(user.email)

    expect(user.tasks.count).to eql(1)
  end
end