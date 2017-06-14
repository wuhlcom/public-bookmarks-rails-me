class HelloWorldController < ApplicationController
  def index
    render inline: "<span>#{['Hello', 'Hi', 'Hey', 'Yo'][rand(4)]} World!</span>"
  end
end
