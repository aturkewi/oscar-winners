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

  attr_reader :title, :year, :budget

end
