class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :student_ic_number
      t.string :student_phone_number
      t.string :student_email

      t.timestamps
    end
  end
end
