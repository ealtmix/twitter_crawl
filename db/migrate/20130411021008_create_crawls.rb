class CreateCrawls < ActiveRecord::Migration
  def change
    create_table :crawls do |t|

      t.timestamps
    end
  end
end
