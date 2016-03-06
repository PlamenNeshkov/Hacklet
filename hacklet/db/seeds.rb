Event.delete_all

Event.create!(title: "HackTUES",
             description: "The first student-driven hackathon in Bulgaria",
             image: "logo.png",
             start: DateTime.new(2015, 6, 27, 18, 00, 00),
             end: DateTime.new(2015, 6, 29, 15, 00, 00),
             max_participants: 100)

Event.create!(title: "HackTUES 2",
             description: "The second hackathon in TUES",
             image: "logo.png",
             start: DateTime.new(2015, 10, 13, 18, 00, 00),
             end: DateTime.new(2015, 10, 15, 15, 00, 00),
             max_participants: 80)
