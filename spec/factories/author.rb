FactoryBot.define do
    factory :author do
        name Faker::Name.name
        email Faker::Internet.email
        city Faker::Address.city
        address Faker::Address.street_address
        birth_date Faker::Date.birthday(18, 65)
    end
end