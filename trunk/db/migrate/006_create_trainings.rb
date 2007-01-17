class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :trainings
  end
end
