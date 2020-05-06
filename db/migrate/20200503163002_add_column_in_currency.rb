# frozen_string_literal: true

class AddColumnInCurrency < ActiveRecord::Migration[6.0]
  def change
    add_column :currencies, :expired_in, :datetime, null: false, index: true
  end
end
