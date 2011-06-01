module ThinkingSphinx
  class Index
    class Builder

      # def indexes(*args)
        # options = args.extract_options!
        # args.each do |columns|
          # columns = globalize3_column_modifications(columns)
          # field = Field.new(source, FauxColumn.coerce(columns), options)
          
          # add_sort_attribute  field, options   if field.sortable
          # add_facet_attribute field, options   if field.faceted
        # end
      # end

      # def initialize(index, &block)
        # @index  = index
        # @explicit_source = false
        
        # new_block = proc {
          # self.instance_eval &block

          # has "GROUP_CONCAT(DISTINCT CRC32(IFNULL(`#{source.model.translations_table_name}`.`locale`, '0')) SEPARATOR ' ')", :as => 'locale', :type => :multi
        # }

        # self.instance_eval &new_block
        
        # if no_fields?
          # raise "At least one field is necessary for an index"
        # end
      # end

      def initialize_with_locale_attribute(index, &block)
        initialize_without_locale_attribute(index) do
          self.instance_eval &block
          if source.model.respond_to? :translations_table_name
            has "GROUP_CONCAT(DISTINCT CRC32(IFNULL(`#{source.model.translations_table_name}`.`locale`, '0')) SEPARATOR ' ')", :as => 'locale', :type => :multi
          end
        end
      end

      alias_method_chain :initialize, :locale_attribute



      def indexes_with_globalize3_column_modifications(*args)
        options = args.extract_options!
        args.map! { |columns| globalize3_column_modifications(columns) }
        indexes_without_globalize3_column_modifications(*args, options)
      end

      alias_method_chain :indexes, :globalize3_column_modifications

      def globalize3_column_modifications(columns)
        if source.model.respond_to?(:translated?) && source.model.translated?(columns)
          translations.send columns
        else
          columns
        end
      end



    end
  end
end
