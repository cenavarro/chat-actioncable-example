# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]

  def change
    create_table :messages do |t|
      t.belongs_to :chat
      t.belongs_to :user
      t.text :body
      t.timestamps
    end
  end

end
