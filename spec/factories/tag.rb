FactoryBot.define do
    factory :tag do
        name { Faker::Music.instrument }
    end
end