class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.text :token, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
