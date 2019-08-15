require 'rails_helper'

RSpec.describe "Task", type: :model do
  describe "factory" do
    it "generates valid task" do
      task = FactoryBot.create(:task)

      expect(task).to be_valid
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = FactoryBot.create(:user)
      task = FactoryBot.create(:task, user: user)

      expect(task).to be_valid
      expect(task.user).to eql(user)
    end
  end
end