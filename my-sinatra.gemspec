file_list = ['lib', 'bin', 'template'].map do |x|
  Dir["./#{x}/**/*"]
end.flatten

Gem::Specification.new do |s|
  s.name        = 'my-sinatra'
  s.summary     = 'my-sinatra'
  s.author      = 'cichol'
  s.version     = '0'
  s.files       = file_list
  s.executables = ['smx']
end
