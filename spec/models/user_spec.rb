require 'rails_helper'

RSpec.describe "User", type: :model do
  describe "factory" do
    it "generates valid user" do
      user = FactoryBot.create(:user)

      expect(user).to be_valid
    end
  end

  describe "associations" do
    it "has many tasks" do
      user = FactoryBot.create(:user)
      tasks = FactoryBot.create_list(:task, 10, user: user)

      expect(user.tasks.count).to eql(10)
    end
  end
end