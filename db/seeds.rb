require 'faker'

Company.destroy_all
# Activity.destroy_all
# ActivityComment.destroy_all
# Goal.destroy_all
# Consumption.destroy_all
# ConsumptionComment.destroy_all

    # Run in rails console to alter the created at dates to see full function of graphs

    # Activity.all.each {|activity| activity.created_at = (rand*7).days.ago; activity.save}
    # Consumption.all.each {|consumption| consumption.created_at = (rand*7).days.ago; consumption.save}
    # Goal.all.each {|goal| goal.created_at = (rand*7).days.ago; goal.save}
    
    # 4.times do 
    #     User.create(:username => Faker::Internet.username, 
    #     :name => Faker::Name.name,
    #     :age => Faker::Number.within(range: 1..100),
    #     :weight => Faker::Number.within(range: 100..300),
    #     :height => Random.new.rand(5.0...6.9).to_s[0..2],
    #     :email => Faker::Internet.email,
    #     :password => '123',
    #     :gender => Faker::Gender.binary_type)
    # end

    # User.create(:username => "CodeJonesW", :name => "Will Jones", :age => 27, :weight => 180, :height => "6.4", :email => "willjones@blah.com", password: '123', :gender => 'male')


    4.times do 
        Company.create(:name => Faker::Company.name, 
        :about => Faker::Company.industry,
        :location => Faker::Address.city,
        :premium => true)

    end

