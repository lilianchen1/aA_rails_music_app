class Track < ActiveRecord::Base
  validates :name, :album, presence: true
  has_many :notes
  belongs_to :album

end
