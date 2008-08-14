class Image < ActiveRecord::Base
  has_attachment :max_size => 15.megabytes,
    :storage => :file_system,
    :content_type => :image,
    :path_prefix => 'public/images/uploaded',
    :thumbnails => {
      :extralarge => '1200>',
      :large => '600>',
      :medium => '300>',
      :small => '100>',
      :mini => '60'
    }

  validates_as_attachment
    
  belongs_to :imageable, :polymorphic => true
  acts_as_list :scope => 'imageable_id = #{:imageable_id} AND imageable_type = \'#{:imageable_type}\''
end