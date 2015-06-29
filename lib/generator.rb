def generate_project(name)
  Dir.mkdir name
  puts "created project menu #{name}"
  Dir.chdir name
  Dir.mkdir 'controllers'
  Dir.mkdir 'views'
  Dir.mkdir 'models'
end