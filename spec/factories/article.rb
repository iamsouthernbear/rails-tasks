FactoryBot.define do
    factory :article do
        title Faker::Book.title
        text Faker::Lorem.paragraph
        author
    end
end