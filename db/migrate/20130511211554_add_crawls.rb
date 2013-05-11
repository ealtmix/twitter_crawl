class AddCrawls < ActiveRecord::Migration
  def up
    create_table :crawls do |t|
      t.text 'tweet'
      t.text 'region'
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end
  end

  def down
    drop_table :crawls
  end
end
