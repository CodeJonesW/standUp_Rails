require 'faker'

Company.destroy_all

    4.times do 
        Company.create(:name => Faker::Company.name, 
        :about => Faker::Company.industry,
        :location => Faker::Address.city,
        :premium => true)

    end

    coLength = Company.all.length

    4.times do 
        User.create(:username => Faker::Internet.username, 
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :age => Faker::Number.within(range: 1..55),
        :email => Faker::Internet.email,
        :gender => Faker::Gender.binary_type,
        :company_id => Faker::Number.within(range: 1..coLength-1)
        )
    end

    User.create(:username => "CodeJonesW", :first_name => "Will", :last_name => "Jones", :age => 27, :email => "willjones@code.com", :gender => 'male', company_id: 1)




