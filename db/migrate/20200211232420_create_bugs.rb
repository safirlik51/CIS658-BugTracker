class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.text :issue_type, default: 2
      t.string :priority, default: 1 
      t.string :status, default: 0

      t.timestamps
    end
  end
end
