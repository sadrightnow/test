class Post < ApplicationRecord
	validates :bands, presence: true
	validates :event_date, presence: true
	has_and_belongs_to_many :genres # if genres are a separate model
	has_many_attached :image
end
