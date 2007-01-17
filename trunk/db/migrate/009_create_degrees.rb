class CreateDegrees < ActiveRecord::Migration
  def self.up
    create_table :degrees do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :degrees
  end
end
