class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  has_many :comments
  belongs_to :user
  named_scope :recent, :order => 'created_at DESC', :limit => 3  
  named_scope :ordered, :order => 'created_at DESC'

end

