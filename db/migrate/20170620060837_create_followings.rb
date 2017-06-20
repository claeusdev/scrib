class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.references :follower
      t.references :followed_user

      t.timestamps
    end
  end
end
