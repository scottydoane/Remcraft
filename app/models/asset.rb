class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true
  acts_as_list :scope => 'assetable_id = #{:assetable_id} AND assetable_type = \'#{:assetable_type}\''

  has_attachment :storage => :file_system,
    :max_size => 6.megabytes, 
    :file_system_path => 'public/assets',
    :processor => 'Rmagick'
    
  validates_as_attachment
end
