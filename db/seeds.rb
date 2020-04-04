# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    users = User.create([{ username: 'Nicole', password_digest: 1234, email: 'nicole@gmail.com'}, { username: 'Sara', password_digest: 1234, email: 'sara@gmail.com'}])
    clients = Client.create([{ name: 'Lego' }, { name: 'Pokeman' }])


    projects = Project.create([{ department: 'marketing', name:'Flyer creation',  desc: 'Kids ages 9-12 winter collection', client_id: 01, user_id: 01, target_completion_date: "2020-04-02" , completion_date: "2020-04-02" },
    { department: 'tech', name:'new feature', desc:'new mobile feature spring release'}, client_id: 2, user_id: 2, target_completion_date: "2020-01-5", completion_date: "2019-12-8" ])
    comments = Comment.create([{text: 'Completed early', project_id: 02}, text: "Design first review.", project_id: 01])

 