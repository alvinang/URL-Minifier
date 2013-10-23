class Url < ActiveRecord::Base
  validates_presence_of :long_url, :short_url
  attr_accessible :long_url, :short_url
  validates_uniqueness_of :short_url
end
