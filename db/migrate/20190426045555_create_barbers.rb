class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.text :name
      
        t.timestamps
    end
  Barber.create :name => 'Abdulla'
  Barber.create :name => 'Samigella'
  Barber.create :name => 'Arbot'

  end
end
