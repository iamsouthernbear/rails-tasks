FactoryBot.define do
    factory :comment do
        user_name { Faker::Name.name }
        text { Faker::Lorem.sentence }
        article
    end
end