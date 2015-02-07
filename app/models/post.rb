class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :message, presence: true

	extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :finders]

	def slug_candidates
		[
			:title,
			[:title, :id]
		]
	end
end
