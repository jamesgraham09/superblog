class AddAttachmentPostpicToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :postpic
    end
  end

  def self.down
    drop_attached_file :posts, :postpic
  end
end
