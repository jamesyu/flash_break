class Screenshot < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "200x100>", :large => "700x500>" }
  
  named_scope :approved, :conditions => { :approved => 1 }
  named_scope :unapproved, :conditions => { :approved => 0 }
  
  validates_presence_of :url
  validates_format_of :url, :with => URI.regexp
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 25.megabytes, :message => "Screenshot must be less than 25M."
  
  attr_accessible :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :twitter, :url, :image
  before_validation_on_create :fix_url
  
  def domain
    begin
      URI.parse(url).host
    rescue URI::InvalidURIError
      ''
    end
  end
  
  def twitter_url
    unless twitter.blank?
      "http://www.twitter.com/#{twitter}"
    end
  end
  
  private
  
  def fix_url
    
    unless url.blank?
      if url !~ /^https?:\/\//
        self.url = "http://#{url}"
      end
    end
  end
end
