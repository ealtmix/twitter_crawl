class MultipleCityTables < ActiveRecord::Migration

  def change
    create_table :NewYork do |t|
      t.text :tweet
      t.timestamps
    end
    create_table :SanFran do |t|
      t.text :tweet
      t.timestamps
    end
    create_table :ChiTown do |t|
      t.text :tweet
      t.timestamps
    end
    create_table :Atlanta do |t|
      t.text :tweet
      t.timestamps
    end
    create_table :Denver do |t| 
      t.text :tweet
      t.timestamps
    end
    create_table :Sea_Van do |t|
      t.text :tweet
      t.timestamps
    end
    create_table :Texas do |t|
      t.text :tweet
      t.timestamps
    end
    create_table :Florida do |t|
      t.text :tweet
      t.timestamps
    end
  end

end
