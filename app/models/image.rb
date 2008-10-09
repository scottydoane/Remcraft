class Image < ActiveRecord::Base
  has_attachment :max_size => 15.megabytes,
    :storage => :file_system,
    :content_type => :image,
    :processor => 'Rmagick',
    :path_prefix => 'public/images/uploads',
    :thumbnails => {
      :extralarge => '1200>',
      :large => '600>',
      :medium => '300>x300',
      :small => '180>',
      :mini => '60'
    }

  validates_as_attachment
    
  belongs_to :imageable, :polymorphic => true
  acts_as_list :scope => 'imageable_id = #{:imageable_id} AND imageable_type = \'#{:imageable_type}\''
    
end
