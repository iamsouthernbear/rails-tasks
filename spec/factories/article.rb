FactoryBot.define do
    factory :article do
        title  { Faker::Book.title }
        text { Faker::Lorem.paragraph }
        author
        created_at { Faker::Date.between(2.days.ago, Date.today) }
    end
end