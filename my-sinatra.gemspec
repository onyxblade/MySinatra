Gem::Specification.new do |s|
  s.name        = 'my-sinatra'
  s.summary     = 'my-sinatra'
  s.author      = 'cichol'
  s.version     = '0'
  s.files       = %w{lib bin}.collect{|p| `ls #{p}`.split("\n").collect{|x| "#{p}/#{x}"}}.flatten
  s.executables = ['smx']
end
