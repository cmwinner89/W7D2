# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord

    validates :band_id, :title, :year, presence: true

    belongs_to :band,
        primary_key: :idm
        foreign_key: :band_id,
        class_name: :Band
end
