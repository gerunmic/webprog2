class Product < ActiveRecord::Base
	has_many :line_items
	
	before_destroy :ensure_note_referenced_by_any_line_item
	
	validates_presence_of :title, :description, :price
	validates :image_url, :format => { :with => %r{\.(gif|jpg|png)$}i, :message => 'must be a URL for GIF, JPG or PNG image.'}
	validates_length_of  :description, :minimum => 20
	
	private
		
		def ensure_note_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
