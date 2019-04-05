# == Schema Information
#
# Table name: bands
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Band < ApplicationRecord
    validates :name, presence:true
    
    has_many :albums,
        class_name: :Album,
        primary_key: :id,
        foreign_key: :band_id
end
