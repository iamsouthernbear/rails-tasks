# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tags = FactoryBot.create_list(:tag, 20)

20.times do
    author = FactoryBot.create(:author)

    rand(10).times do
        article = FactoryBot.create(:article, author: author)

        FactoryBot.create_list(:comment, rand(10), article: article)

        3.times do
             article.tags << tags[rand(tags.size - 1)]
        end
    end
end