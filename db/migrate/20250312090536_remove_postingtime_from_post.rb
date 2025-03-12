class RemovePostingtimeFromPost < ActiveRecord::Migration[8.0]
  def change
    remove_column :posts, :postingtime, :datetime
  end
end
