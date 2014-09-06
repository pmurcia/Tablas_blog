class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.belongs_to :subject
      t.timestamps
    end
  end
end
