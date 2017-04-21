# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  live       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    primary_key: :id

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id,
    primary_key: :id
end
