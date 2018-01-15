require 'CSV' 

namespace 'roonyx' do
  class CreateReport
    include Rails.application.routes.url_helpers

    def most_popular_article
      comment_id = Comment.group(:article_id)
                          .count.max_by { |k, v| v }.try { |k, v| k }
      @article = Article.find(comment_id)
    end

    def create_file
      most_popular_article
      all_articles = Article.all
      all_comments = Comment.all
      File.open("Report_#{DateTime.now}", 'w') do |file|
        file.puts "<p>Общее количество авторов: #{Author.all.length}</p>"
        file.puts "<p>Общее количество статей: #{all_articles.length}</p>"
        file.puts "<p>Общее число комментариев: #{all_comments.length}</p>"
        file.puts "<a href='#{article_path(@article.id)}'>#{@article.title}</a>"
        file.puts "<p>Среднее количество комментариев: #{all_comments.length / all_articles.length}</p>"
        file.puts "<table><thead><tr><th>Tag</th></tr></thead><tbody>"
        Tag.all.each do |t|
          file.puts "<tr><td>#{t.name}</td><td>#{t.articles.count}</td></tr>"
        end
        file.puts "</tbody></table>"
      end
    end
  end

  desc "Clean db and generate new"
  task :reset_db do
    Rake::Task["db:reset"].invoke
  end

  desc "Craete users list for mailing"
  task :create_list => :environment do
    @authors = Author.all
    CSV.open("Users_list #{DateTime.now}", 'w') do |file|
      @authors.each do |author|
        file << [author.name, author.email]
      end
    end
  end

  desc "Create report"
  task :create_report => :environment do
    report = CreateReport.new
    report.create_file
  end

  desc "Remove old articles"
  task :rm_old => :environment do
    authors = Author.all
    ids = []
    authors.each do |author|
      ids << author.articles.order(created_at: :desc).offset(5).ids
    end
    Article.delete(ids.flatten)
  end
end