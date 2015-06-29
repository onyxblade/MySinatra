def generate_project(name)
  Dir.mkdir name
  puts "created project menu #{name}"
  Dir.chdir name
  Dir.mkdir 'controllers'
  Dir.mkdir 'views'
  Dir.mkdir 'models'
end

def camelize(str)
  str.split('_').map(&:capitalize).join
end

def generate_migration(name)
  version = Time.now.utc.strftime("%Y%m%d%H%M%S")
  File.new("./db/migrations/#{version}_#{name}.rb", 'w').write <<-EOF
class #{camelize(name)} < ActiveRecord::Migration
  def change
  end
end
  EOF
end
