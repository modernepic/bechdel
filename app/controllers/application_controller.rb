class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # class Movie < ApplicationRecord
  #   has_many :comments, dependent: :destroy
  # validates :title, presence: true,
  #                   length: { minimum: 1 }

  #   def initialize
  #     # (title, link)
  #     @title = title
  #     @link = link
  #   end
  #   attr_accessor :title, :link
  # end

  def scrape_bechdel
    require 'open-uri'
    # url = "http://bechdeltest.com/sort/title?list=all"
    url = "http://bechdeltest.com/sort/title"
    doc = Nokogiri::HTML(open(url))

    movies = doc.css(".movie")
    @moviesArray = []

    movies.each do |movie|
      title = movie.at_css("a+ a").text
      link = movie.at_css('img')['src']
      # newMovie = Movie.new(title, link)
      # moviesArray << newMovie
      @moviesArray << Movie.new(title, link)
    end

  #   def show
  #   puts "Title: #{@title}"
  #   if @link == "/static/pass.png"
  #     puts "Verdict: Pass"
  #   else
  #     puts "Verdict: Fail"
  #   end
  # end
  

  render template: 'scrape_bechdel'
  end
end
