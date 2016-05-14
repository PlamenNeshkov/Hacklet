# Seed events
Event.delete_all
Event.create!(title: "HackTUES",
             description: "The first student-driven hackathon in Bulgaria",
             image: "logo.png", start: DateTime.new(2015, 6, 27, 18, 00, 00),
             end: DateTime.new(2015, 6, 29, 15, 00, 00), max_participants: 100)

Event.create!(title: "HackTUES 2", description: "The second hackathon in TUES",
             image: "logo.png", start: DateTime.new(2015, 10, 13, 18, 00, 00),
             end: DateTime.new(2015, 10, 15, 15, 00, 00), max_participants: 80)

Event.create!(title: "HackTUES 3",
             description: "The third student-driven hackathon in Bulgaria",
             image: "logo.png", start: DateTime.new(2016, 6, 27, 18, 00, 00),
             end: DateTime.new(2016, 6, 29, 15, 00, 00), max_participants: 100,
             active: true)

# Seed users & roles

['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

Gender.delete_all
Gender.create(value: 'Male')
Gender.create(value: 'Female')
Gender.create(value: 'Other')

User.delete_all
User.create(email: "ivo@test.com", password: "testtest",
        first_name: "Ivaylo", last_name: "Arnaudov", confirmed_at: DateTime.now)
User.create(email: "fiki@test.com", password: "testtest",
        first_name: "Fikret", last_name: "Storaro", confirmed_at: DateTime.now)
User.create(email: "foo@bar.com", password: "testtest",
        first_name: "Pesho", last_name: "Goshov", confirmed_at: DateTime.now)

Technology.delete_all
Technology.create(name: 'HTML', description: 'Hypertext Markup Language')
Technology.create(name: 'Ruby on Rails', description: 'A web framework')
Technology.create(name: 'PHP', description: 'Something bad')

Category.delete_all
Category.create(name: 'Web')
Category.create(name: 'Mobile')
Category.create(name: 'Desktop')
Category.create(name: 'Embedded')
Category.create(name: 'IoT')
