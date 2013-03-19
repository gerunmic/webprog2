class Product < ActiveRecord::Base
	validates_presence_of :title, :description, :price
	validates :image_url, :format => { :with => %r{\.(gif|jpg|png)$}i, :message => 'must be a URL for GIF, JPG or PNG image.'}
	validates_length_of  :description, :minimum => 20
end
