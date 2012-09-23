class AddAttachmentsBlobImageToItems < ActiveRecord::Migration
  def change
  	execute 'ALTER TABLE items ADD COLUMN image_file LONGBLOB'
    execute 'ALTER TABLE items ADD COLUMN image_small_file LONGBLOB'
    execute 'ALTER TABLE items ADD COLUMN image_thumb_file LONGBLOB'
  end
end
