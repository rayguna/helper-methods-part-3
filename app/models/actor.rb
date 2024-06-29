# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  bio        :string
#  dob        :date
#  name       :string
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
end
