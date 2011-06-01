class Resource < ActiveRecord::Base
  translates :name

  define_index do
    indexes translations(:name)

    has "GROUP_CONCAT(DISTINCT CRC32(IFNULL(`resource_translations`.`locale`, '0')) SEPARATOR ' ')", :as => 'locale', :type => :multi
  end

  # define_index 'resource_en' do
    # indexes translations(:name)

    # where "resource_translations.locale='en'"
  # end

  # define_index 'resource_es' do
    # indexes translations(:name)

    # where "resource_translations.locale='es'"
  # end
end
