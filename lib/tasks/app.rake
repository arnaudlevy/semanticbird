namespace :app do
  desc 'Get database from Heroku'
  task :db do
    Bundler.with_unbundled_env do
      sh "heroku pg:backups capture --app semanticbird"
      sh "curl -o db/latest.dump `heroku pg:backups public-url --app semanticbird`"
      sh 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop'
      sh 'bundle exec rails db:create'
      begin
        sh 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d semanticbird_development db/latest.dump'
      rescue
        'There were some warnings or errors while restoring'
      end
      sh 'rails db:migrate'
    end
  end

  desc 'Synchronize accounts from twitter'
  task sync: :environment do
    Account.find_each &:get_recent_tweets!
  end
end
