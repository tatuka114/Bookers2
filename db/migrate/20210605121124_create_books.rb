class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.intrger :user_id
      t.string :user_image_id
      t.text :title
      t.text :opinion

      t.timestamps
    end
  end
end
