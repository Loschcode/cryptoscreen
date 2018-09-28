module Types
  class QueryType < Types::BaseObject
    field :GetWatchlistCoin, [Types::WatchlistCoin], null: true do
      description "Find a watchlist coin by ID"
      argument :id, ID, required: true
    end

    def get_watchlist_coin(id:)
      return unless current_user
      current_user.watchlist_coins.find_by(id: id)
    end

    field :GetWatchlistCoins, [Types::WatchlistCoin], null: false do
      description "Find watchlist coins"
    end

    def get_watchlist_coins
      return [] unless current_user
      current_user.watchlist_coins
    end
  end
end

# query_string = "
# {
#   coins {
#     id
#     code
#   }
# }"
#
# result_hash = BloodbathApiSchema.execute(query_string)
