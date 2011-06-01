class Resource < ActiveRecord::Base
  translates :name

  define_index do
    indexes :name
  end
end
