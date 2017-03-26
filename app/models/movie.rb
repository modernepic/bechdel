 class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 1 }

    attr_accessor :title, :link

    def initialize(title, link)
      # (title, link)
      @title = title
      @link = link
    end
  end
