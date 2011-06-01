class Resource < ActiveRecord::Base
  translates :name

  define_index do
    indexes translations.name

    has translations.locale
  end
end
