class CreateImageSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :image_slides do |t|
      t.references :product, foreign_key: true
      t.string :image
      t.string :note
      t.timestamps
    end
  end
end
