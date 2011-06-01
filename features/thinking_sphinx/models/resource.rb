class Resource < ActiveRecord::Base
  translates :name

  define_index do
    indexes translations(:name)

    has translations.locale, :as => 'locales'
    has "GROUP_CONCAT(DISTINCT CRC32(IFNULL(`resource_translations`.`locale`, '0')) SEPARATOR ' ')", :as => 'locale', :type => :multi
  end
end
