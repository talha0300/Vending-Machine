class CurrencyHandler
    # This function change any given amount to collection of coins like 35 to (20p, 10p, 5p)
    # This function is used to give back exta amount to customer like customer pays 2£ for an item 
    # and item price is 1£ and 30p 
    def self.coins_return(amount_to_return)
        coins = []
        COINS.each do |coin, value|
            if amount_to_return > 0
                coin_count = amount_to_return/value
                if coin_count > 0
                    coins += [coin.to_s] * coin_count # insert coins to the list like 2 coins of 2p or 3 coins of 1£
                    amount_to_return -= value * coin_count 
                end
            else
                break
            end
        end
        coins
    end

    # convert pennies to pound for display
    def self.pennies_to_pounds(pennies)
        "£" + ("%.2f" % (pennies/100.0)) # two decimal points precision
    end

end
