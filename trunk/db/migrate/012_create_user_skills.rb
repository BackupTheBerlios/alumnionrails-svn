class CreateUserSkills < ActiveRecord::Migration
  def self.up
    create_table :user_skills do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :user_skills
  end
end
