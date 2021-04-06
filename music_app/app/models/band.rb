# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer          not null
#
class Band < ApplicationRecord
    validates :name, presence: true

    belongs_to :member,
        primary_key: :id,
        foreign_key: :member_id,
        class_name: :User

    has_many :albums,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Album
end
