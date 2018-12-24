# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[5.2]

  def change
    create_table :chats do |t|
      t.string :name, null: false
      t.timestamps
    end
  end

end
