# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.float :value, null: false
      t.timestamps
    end
  end
end
