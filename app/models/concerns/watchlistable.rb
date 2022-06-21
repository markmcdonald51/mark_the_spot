module Watchlistable
    extend ActiveSupport::Concern
    attr_reader :action_names
  
    #included do
    #  puts "Called"
    #end  
    class_methods do
      def has_many_watchlists(action_names:, class_name:)
        @action_names = action_names  
        @action_names.each_with_index do |name, i|
          has_many :"#{name}_watch", -> {where(watchlist_type: i)}, class_name: 'Watchlist'
          has_many :"#{name}_#{class_name.to_s.downcase.pluralize}", through: :"#{name}_watch", source: :watchable, source_type: "#{class_name}"
        end
      end
    end
  end
  
  