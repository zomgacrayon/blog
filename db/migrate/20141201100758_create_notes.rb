class CreateNotes< ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :notes do |t|
      t.belongs_to :tag
      t.belongs_to :post
    end
  end
end