# MarkTheSpot
 Got an interesting idea for stat analysis:  
  Object: 
    Create a simple yet powerful interface to collect data mesurements to be
    used for analysis for ML.
  
    Strategy: 
    allow for a model to add buttons for a user to choose 

  Example:    
    Model LegalTerms
      includes Watchlistable # From model concerns
      has_many_watchlists(names: %w[danger like ignore interested], class_name: 'Term')

      This will make associations:
        # First the Polymorphic generic assoc using names: param from above
        has_many :danger_watch,     -> {where(watchlist_type: 1)}, class_name: 'Watchlist'
        has_many :like_watch,       -> {where(watchlist_type: 2)}, class_name: 'Watchlist'
        has_many :ignore_watch,     -> {where(watchlist_type: 3)}, class_name: 'Watchlist'
        has_many :interested_watch, -> {where(watchlist_type: 4)}, class_name: 'Watchlist'

        # Now map
        has_many :danger_terms,through: :danger_watch, source: :watchable, source_type: 'Term'
        has_many :like_terms,     through: :like_watch,   source: :watchable, source_type: 'Term'
        has_many :ignore_terms,   through: :ignore_watch, source: :watchable, source_type: 'Term'
        has_many :interested_terms,   through: :ignore_watch, source: :watchable, source_type: 'Term'

## Usage
How to use my plugin.
Example in User model:

    include Watchlistable
    has_many_watchlists(action_names: %w[danger like ignore interested], class_name: 'Term')

will create has_many with #{action_name}_#{class_name}
ie, has_many :danger_terms 
or
has_many :like_terms


## Installation
Add this line to your application's Gemfile:

run:  rails mark_the_spot_engine:install:migrations
      rails db:migrate

```ruby
gem "mark_the_spot"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install mark_the_spot
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
# mark_the_spot
