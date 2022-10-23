

# Prices are stored in Pennies
ITEMS =  {"Item_1" => {"title": "Soft Drink", "price": 50},  
    "Item_2" =>  {"title": "Potatao Chips",  "price": 80},
    "Item_3" =>  {"title": "Choclate",  "price": 120}}
# coins and thier values in pennies
COINS = {"2£": 200, "1£": 100, "50p": 50, "20p": 20, "10p": 10, "5p": 5, "2p": 2,"1p": 1}

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

class VendingMachine
    # display items and ask customer to select the item and return the selected item
    def self.select_item
        print "Welcome to My Vending Machine\n"
        print "These Items are available and we accept coins in payment\n"
        ITEMS.values.each_with_index do |item, index|
            print "#{index + 1}:  #{item[:title]}  #{CurrencyHandler.pennies_to_pounds(item[:price])} \n"
        end
        print "enter the number to buy an item e.g 1 to buy first item:  "
        item = gets.chomp
        ITEMS["Item_" + item] # return selected item
    end

    def self.make_a_purchase(selected_item)
        # print "please enter money and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "
        # inserted_amount = COINS[gets.chomp.to_sym]
        inserted_amount = 0

        while inserted_amount < selected_item[:price] do 
            pending_amount = CurrencyHandler.pennies_to_pounds(selected_item[:price] - inserted_amount)
            print "please insert #{pending_amount} and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "
            inserted_amount += COINS[gets.chomp.to_sym]
        end

        amount_return = inserted_amount - selected_item[:price]
    end

    def self.start
        selected_item = select_item
        print "You have selected #{selected_item[:title]} and its price is "\
        "#{CurrencyHandler.pennies_to_pounds(selected_item[:price])}\n"
        amount_return = make_a_purchase(selected_item)
        print "You just Bought a #{selected_item[:title]}\n"
        print "Extra amount #{CurrencyHandler.pennies_to_pounds(amount_return)} in "\
        "coins(#{CurrencyHandler.coins_return(amount_return).join(',')}) is returned to you\n" if amount_return > 0
    end

end

## Start the Machine
VendingMachine.start


