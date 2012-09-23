class AddAttachmentsBlobAvatarToUsers < ActiveRecord::Migration
  def change
  	execute 'ALTER TABLE users ADD COLUMN avatar_file LONGBLOB'
    execute 'ALTER TABLE users ADD COLUMN avatar_small_file LONGBLOB'
    execute 'ALTER TABLE users ADD COLUMN avatar_thumb_file LONGBLOB'
  end
end
