class CreateSnipps < ActiveRecord::Migration[5.2]
  def change
    create_table :snipps do |t|
      t.string :medium
      t.text :quotation
      t.text :takeaway
      t.text :quoter
      t.text :source
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
