class Comment < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :post
  named_scope :ordered, :order => 'created_at DESC'
end
