class AddAnswerToFan < ActiveRecord::Migration
  def change
    add_column :fans, :answer, :string
  end
end
