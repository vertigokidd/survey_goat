class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :password_digest
      t.timestamps
    end

    create_table :surveys do |t|
      t.belongs_to :user
      t.string  :title
      t.string  :url
      t.string :file
      t.timestamps
    end

    create_table :questions do |t|
      t.belongs_to  :survey
      t.string  :content
      t.timestamps
    end

    create_table :answers do |t|
      t.belongs_to  :question
      t.string  :choice
      t.timestamps
    end

    create_table :results do |t|
      t.belongs_to  :answer
      t.timestamps
    end
  end
end
