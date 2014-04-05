namespace :test do

  namespace :karma do
    desc "Run unit test"

    task :unit => :environment do
      require Rails.root.join('lib', 'karma', 'unit')
      Karma::Unit.test!(single_run: true)
    end
  end

end
