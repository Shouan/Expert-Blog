namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    experts = Expert.all(limit: 11)
    50.times do
	  title = "Title"
      content = Faker::Lorem.sentence(5)
      experts.each { |expert| expert.posts.create!(title: title, content: content) }
    end
  end
end