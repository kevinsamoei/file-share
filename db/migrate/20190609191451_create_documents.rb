class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title

      t.timestamps
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
