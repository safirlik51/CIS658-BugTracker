class User < ApplicationRecord
	has_many :bugs, dependent: :destroy

	validates :lname, :fname, :email, presence: true
	validates :email, uniqueness: {case_sensitive: false}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
	validates :thumbnail, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG, or PNG image.'}
end
