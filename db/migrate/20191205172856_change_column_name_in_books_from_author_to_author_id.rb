class ChangeColumnNameInBooksFromAuthorToAuthorId < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :author, :author_id 
  end
end
