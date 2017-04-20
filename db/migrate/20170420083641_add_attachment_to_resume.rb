class AddAttachmentToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :job, :attachment, :string
  end
end
