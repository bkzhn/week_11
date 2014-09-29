class AddAuthorYearDescriptionIsbn < ActiveRecord::Migration
  def change
		add_column :books, :author, 			:string
		add_column :books, :year,   			:integer
		add_column :books, :description, :text
		add_column :books, :isbn,				:string
  end
end
