class AddColumnsToDeviseUser < ActiveRecord::Migration
  def change
    # Base user attrs
    add_column :users, :name, :string, limit: 50, null: false, after: :id

    # legal_id necessary only if on company creation
    add_column :users, :username, :string, limit: 55, null: true, after: :email
    add_column :users, :legal_id, :string, limit: 45, null: true, after: :username
    add_column :users, :locale, :string, limit: 5, null: true, after: :legal_id
    add_column :users, :gender, 'char(1)', null: true, after: :locale
    add_column :users, :invite_key, :string, limit: 255, null: true, after: :gender

    # Address attributes
    add_column :users, :zip_code, :string, limit: 30, null: true, after: :locale
    add_column :users, :address_name, :string, limit: 80, null: true, after: :zip_code
    add_column :users, :address_number, :integer, null: true, after: :address_name
    add_column :users, :address_complement, :string, limit: 50, null: true, after: :address_number
    add_column :users, :timezone, :integer, null: true, after: :address_complement

    # Association attributes (most useful for consulting indication)
    add_column :users, :invited_by_id, :integer, unique: true, null: true
    add_index :users, :invited_by_id
  end
end
