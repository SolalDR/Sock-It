# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  alt               :string
#  file              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
