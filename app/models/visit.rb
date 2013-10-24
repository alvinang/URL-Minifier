class Visit < ActiveRecord::Base
  attr_accessible :count
  attr_reader :url_id
  belongs_to :url
end
