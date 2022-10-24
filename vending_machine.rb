require_relative 'data'
require_relative 'currency_handler'

class VendingMachine
    # display items and ask customer to select the item and return the selected item
    def self.select_item
        print "Welcome to My Vending Machine\n"
        print "These Items are available and we accept coins in payment\n"
        ITEMS.values.each_with_index do |item, index|
            print "#{index + 1}:  #{item[:title]}  #{CurrencyHandler.pennies_to_pounds(item[:price])} \n"
        end
        item = nil
        while !item
            print "please enter the number to buy an item e.g 1 to buy first item:  "
            item = gets.chomp #user input
            item = ITEMS["Item_" + item] # return selected item
            print "Invalid input\n" unless item
        end
        item
    end

    def self.make_a_purchase(selected_item)
        inserted_amount = 0

        while inserted_amount < selected_item[:price] do 
            pending_amount = CurrencyHandler.pennies_to_pounds(selected_item[:price] - inserted_amount)
            print "please pay #{pending_amount} and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "
            entered_amount = COINS[gets.chomp.to_sym] #user input
            if entered_amount
                inserted_amount += entered_amount
            else
                print "Invalid input\n"
            end
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


