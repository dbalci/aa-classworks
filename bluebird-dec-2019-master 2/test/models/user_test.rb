# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  email                 :string(100)
#  age                   :string
#  political_affiliation :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
