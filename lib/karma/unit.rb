require 'karma'

module Karma
  class Unit
    def self.test!(opts = {})
      environments = Sprockets::Environment.new
      environments.append_path Rails.root.join("test/karma")

      Rails.application.assets.paths.each do |path|
        environments.append_path path
      end

      files = environments.find_asset("unit.js").to_a.map {|e| e.pathname.to_s }
      files << Rails.root.join("test/karma/unit/*_test.coffee").to_s

      puts "--> Karma.start!"
      Karma.start!({:files => files, :adapter => :jasmine}.merge(opts))
    end
  end
end
