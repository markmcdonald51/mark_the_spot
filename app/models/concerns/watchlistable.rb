module Watchlistable
    extend ActiveSupport::Concern
    attr_reader :watchlist_action_names, :watchlist_class
  
    #included do
    #  puts "Called"
    #end  
    class_methods do
      def watchlist_has_many_name_for_action(action_name) 
        return nil unless @watchlist_action_names.include?(action_name)    
        "#{action_name}_#{@watchlist_class.to_s.downcase.pluralize}"
      end   

      def has_many_watchlists(action_names:, class_name:)
        @watchlist_action_names = action_names
        @watchlist_class = class_name

        @watchlist_action_names.each_with_index do |name, i|
          has_many :"#{name}_watch", -> {where(watchlist_type: i)}, class_name: 'Watchlist'
          has_many :"#{name}_#{class_name.to_s.downcase.pluralize}",
           through: :"#{name}_watch", source: :watchable, source_type: "#{class_name}"
        end

        @watchlist_action_names = a_names
      end
    end
  end
  
  