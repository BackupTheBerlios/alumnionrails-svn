class CreateFaculties < ActiveRecord::Migration
  def self.up
    create_table :faculties do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :faculties
  end
end
