# coding: utf-8
# Renders the home page.
class HomeController < ApplicationController
  def index
    @amount=Link.last.id
    if !session[:visit]
      @number=rand(1 ..@amount)
      session[:visit] = 1
    elsif session[:visit] == 1
      @number=rand(1 ..@amount)
      session[:visit] = 2
      session[:number] = @number
    elsif session[:visit] == 2
      @number = session[:number]
      flash[:notice] = "Не стоит больше обновлять страницу:) Стоит защита и ссылки больше не поменяются."
    end

    @link=Link.find(@number)
  end
end
