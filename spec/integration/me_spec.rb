require "rails_helper"

RSpec.describe "Query Me" do
  let(:query) {"
      {
        me {
          id
          email
          tasks {
            id
            title
            done
          }
        }
      }
    "
  }

  it "return field and tasks" do
    user = FactoryBot.create(:user, :with_tasks)

    response = TodoSchema.execute(query)

    expect(response['data']).to be_present
    expect(response['erros']).not_to be_present

    response = response.dig('data', 'me')

    expect(response['id']).to eql(user.id.to_s)
    expect(response['email']).to eql(user.email)
    expect(response['tasks'].count).to eql(user.tasks.count)
  end
end