class Resource < ActiveRecord::Base
  define_index do
    indexes :name, :sortable => true
  end
end
