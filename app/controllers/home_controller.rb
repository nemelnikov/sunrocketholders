# Renders the home page.
class HomeController < ApplicationController
  def index
    @amount=Link.last.id
    @number=rand(1 ..@amount)
    @link=Link.find(@number)
  end
end
