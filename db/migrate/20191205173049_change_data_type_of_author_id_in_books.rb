class ChangeDataTypeOfAuthorIdInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :author_id, :integer
  end
end
