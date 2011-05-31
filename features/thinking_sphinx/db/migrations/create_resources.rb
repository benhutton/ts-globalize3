ActiveRecord::Base.connection.create_table :resources, :force => true do |t|
  t.column  :name, :string,  :null => false
end
