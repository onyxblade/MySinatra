
module Sinatra
  class Application
    def self.controller path, &block
      Sinatra::Controller.new(path, &block)
    end
  end

  class Controller
    def initialize path, &block
      @path = path == '/' ? '' : path
      self.instance_eval &block
    end

    [:get, :post, :put, :delete].each do |x|
      define_method x do |path, **para, &block|
        Sinatra::Application.send(x, "#{@path}#{path}", para, &block)
      end
    end

    [:before, :after].each do |x|
      define_method x do |path='/*', **para, &block|
        Sinatra::Application.send(x, "#{@path}#{path}", para, &block)
      end
    end

  end
end

Sinatra::Delegator.delegate(:controller)