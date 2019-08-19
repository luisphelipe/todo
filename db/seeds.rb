# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

app = Doorkeeper::Application.find_or_create_by({
  name: "React Native App",
  redirect_uri: "urn:ietf:wg:oauth:2.0:oob",
})

puts "Created DoorkeeperApp"
puts "Client ID: #{app.uid}"
puts "Client Secret: #{app.secret}"

admin = User.create(:user, email: "admin@test.com")
admin.tasks.create(title: 'test_task1')
admin.tasks.create(title: 'test_task2')
admin.tasks.create(title: 'test_task3')
admin.tasks.create(title: 'test_task4')
admin.tasks.create(title: 'test_task5')

puts "Created admin test account"
puts "Admin Email: #{admin.email}"
puts "Admin Password: password"
