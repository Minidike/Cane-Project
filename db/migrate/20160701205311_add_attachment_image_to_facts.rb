class AddAttachmentImageToFacts < ActiveRecord::Migration
  def self.up
    change_table :facts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :facts, :image
  end
end
