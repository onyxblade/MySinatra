require 'fileutils'

def generate_project(name)
  Dir.mkdir name
  gem_path = __FILE__.match(/(.*)\/lib/)[1]
  FileUtils.copy_entry gem_path + '/template', "./#{name}"
  Dir.chdir name
  %w{./db/migrations ./controllers ./models ./views }.each {|x| FileUtils.mkdir_p x}
end

def camelize(str)
  str.split('_').map(&:capitalize).join
end

def generate_migration(name)
  version = Time.now.utc.strftime("%Y%m%d%H%M%S")
  File.open("./db/migrations/#{version}_#{name}.rb", 'w').write <<-EOF
class #{camelize(name)} < ActiveRecord::Migration
  def change
  end
end
  EOF
end

def generate_controller(name)
  template = ERB.new <<-EOF
controller '/<%= name %>' do
  get '/' do
    
  end
end
  EOF
  File.open("./controllers/#{name}.rb",'w').write template.result(binding)
end

def generate_model(name)
  template = ERB.new <<-EOF
class <%= name.capitalize %> < ActiveRecord::Base
end
  EOF
  File.open("./models/#{name}.rb",'w').write template.result(binding)
end