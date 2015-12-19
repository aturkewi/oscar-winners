# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  year       :string
#  title      :string
#  budget     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ActiveRecord::Base

  def self.average_budget
    average("budget").to_i
  end

end
