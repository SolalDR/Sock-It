# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  color       :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes['file'].blank? }

end
