require 'faker'

    # Run in rails console to alter the created at dates to see full function of graphs

    # Activity.all.each {|activity| activity.created_at = (rand*7).days.ago; activity.save}
    # Consumption.all.each {|consumption| consumption.created_at = (rand*7).days.ago; consumption.save}
    # Goal.all.each {|goal| goal.created_at = (rand*7).days.ago; goal.save}
    
    4.times do 
        Company.create(:name => Faker::Company.name, 
        :about => Faker::Company.industry,
        :location => Faker::Address.city,
        :premium => true)

    end

    Team.create(:company_id => 1, :name => "Team1")

    coLength = Company.all.length

    4.times do 
        User.create(:username => Faker::Internet.username, 
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :age => Faker::Number.within(range: 1..55),
        :email => Faker::Internet.email,
        :gender => Faker::Gender.binary_type,
        :company_id => Faker::Number.within(range: 1..coLength-1),
        :team_id => 1
        )
    end

    4.times do
    Standup.create(:user_id => Faker::Number.within(range: 1..User.all.length-1),
     :company_id => Faker::Number.within(range: 1..coLength-1),
     :team_id => Faker::Number.within(range: 1..Team.all.length-1),
     :yesterday => Faker::TvShows::GameOfThrones.quote,
     :today => Faker::TvShows::GameOfThrones.quote,
     :blocker => Faker::TvShows::GameOfThrones.quote)
    end


    # User.create(:username => "CodeJonesW", :name => "Will Jones", :age => 27, :weight => 180, :height => "6.4", :email => "willjones@blah.com", password: '123', :gender => 'male')




