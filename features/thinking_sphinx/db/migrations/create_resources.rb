ActiveRecord::Base.connection.create_table :resources, :force => true do |t|
  t.column  :name, :string
end

ActiveRecord::Base.connection.create_table "resource_translations", :force => true do |t|
  t.integer  "resource_id"
  t.string   "locale"
  t.string   "name"
  t.datetime "created_at"
  t.datetime "updated_at"
end

