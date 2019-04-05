# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  yr         :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

    validates :band_id, :title, :yr, :live, presence:true
    

    belongs_to :band,
        class_name: :Band,
        primary_key: :id,
        foreign_key: :band_id


end
