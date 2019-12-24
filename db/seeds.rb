require 'faker'

    # Run in rails console to alter the created at dates to see full function of graphs


    # Standup.all.each {|standup| standup.created_at = (rand*15).days.ago; standup.save}
    # Team.all.each {|team| team.created_at = (15).days.ago; team.save}
    # User.all.each {|user| user.created_at = (15).days.ago; user.save}
    # Company.all.each {|company| company.created_at = (15).days.ago; company.save}


    10.times do 
        Company.create(:name => Faker::Company.name, 
        :about => Faker::Company.industry,
        :location => Faker::Address.city,
        :premium => true)

    end

    coLength = Company.all.length


    15.times do
        Team.create(:company_id => Faker::Number.within(range: 1..coLength), :name => Faker::Internet.username)
    end

        teamLength = Team.all.length
  
    40.times do 
        User.create(:username => Faker::Internet.username, 
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :age => Faker::Number.within(range: 1..55),
        :email => Faker::Internet.email,
        :gender => Faker::Gender.binary_type,
        :company_id => Faker::Number.within(range: 1..coLength),
        :team_id => Faker::Number.within(range: 1..teamLength)
        )
    end

    userLength = User.all.length

    100.times do
    Standup.create(:user_id => Faker::Number.within(range: 1..userLength),
     :company_id => Faker::Number.within(range: 1..coLength),
     :team_id => Faker::Number.within(range: 1..teamLength),
     :yesterday => Faker::TvShows::GameOfThrones.quote,
     :today => Faker::TvShows::GameOfThrones.quote,
     :blocker => Faker::TvShows::GameOfThrones.quote)
    end






