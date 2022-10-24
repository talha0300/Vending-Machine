require 'rspec/autorun'
require_relative 'vending_machine'
describe CurrencyHandler do
    it "check the pennies to pounds coversion workes correctly" do
        expect(CurrencyHandler.pennies_to_pounds(100)).to eq("£1.00")
        expect(CurrencyHandler.pennies_to_pounds(200)).to eq("£2.00")
        expect(CurrencyHandler.pennies_to_pounds(150)).to eq("£1.50")
        expect(CurrencyHandler.pennies_to_pounds(50)).to eq("£0.50")
    end

    it "check the coins change functionality" do
        expect(CurrencyHandler.coins_return(250)).to eq(["2£","50p"])
        expect(CurrencyHandler.coins_return(100)).to eq(["1£"])
        expect(CurrencyHandler.coins_return(75)).to eq(["50p","20p","5p"])
        expect(CurrencyHandler.coins_return(45)).to eq(["20p","20p","5p"])
        expect(CurrencyHandler.coins_return(18)).to eq(["10p","5p","2p", "1p"])
    end
end

describe VendingMachine do
    describe '#start' do 
        it "test customer input with single payment more than the item price" do
            ## customer select the item 1 and pays 2£ and then £1.50 in coins(1£,50p) are retured
            VendingMachine.stub(:gets).and_return("1\n", "2£\n")
            expect{VendingMachine.start}.to output("Welcome to My Vending Machine\nThese Items are available and we accept coins in payment\n"\
                "1:  Soft Drink  £0.50 \n"\
                "2:  Potatao Chips Pack  £0.80 \n"\
                "3:  Choclate Bar  £1.20 \n"\
                "4:  Candy Bar  £0.75 \n"\
                "5:  Juice Pack  £0.45 \n"\
                "please enter the number to buy an item e.g 1 to buy first item: "\
                " You have selected Soft Drink and its price is £0.50\n"\
                "please pay £0.50 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "You just Bought a Soft Drink\n"\
                "Extra amount £1.50 in coins(1£,50p) is returned to you\n").to_stdout
        end

        it "test customer input with single payment equal the item price" do
            ## customer select the item 1 and pays 50p
            VendingMachine.stub(:gets).and_return("1\n", "50p\n")
            expect{VendingMachine.start}.to output("Welcome to My Vending Machine\nThese Items are available and we accept coins in payment\n"\
                "1:  Soft Drink  £0.50 \n"\
                "2:  Potatao Chips Pack  £0.80 \n"\
                "3:  Choclate Bar  £1.20 \n"\
                "4:  Candy Bar  £0.75 \n"\
                "5:  Juice Pack  £0.45 \n"\
                "please enter the number to buy an item e.g 1 to buy first item: "\
                " You have selected Soft Drink and its price is £0.50\n"\
                "please pay £0.50 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "You just Bought a Soft Drink\n").to_stdout
        end
        
        it "test customer input with multiple payments more than the item price" do
            ## customer select the item 3 and pays (1£, 1£) and then £0.80 in coins(50p,20p,10p) are retured
            VendingMachine.stub(:gets).and_return("3\n", "1£\n", "1£\n")
            expect{VendingMachine.start}.to output("Welcome to My Vending Machine\nThese Items are available and we accept coins in payment\n"\
                "1:  Soft Drink  £0.50 \n"\
                "2:  Potatao Chips Pack  £0.80 \n"\
                "3:  Choclate Bar  £1.20 \n"\
                "4:  Candy Bar  £0.75 \n"\
                "5:  Juice Pack  £0.45 \n"\
                "please enter the number to buy an item e.g 1 to buy first item: "\
                " You have selected Choclate Bar and its price is £1.20\n"\
                "please pay £1.20 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "please pay £0.20 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "You just Bought a Choclate Bar\n"\
                "Extra amount £0.80 in coins(50p,20p,10p) is returned to you\n").to_stdout
        end

        it "test customer input with multiple payments equal to the item price" do
            ## customer select the item 4 and pays (50p, 20p, 5p)
            VendingMachine.stub(:gets).and_return("4\n", "50p\n", "20p\n", "5p\n")
            expect{VendingMachine.start}.to output("Welcome to My Vending Machine\nThese Items are available and we accept coins in payment\n"\
                "1:  Soft Drink  £0.50 \n"\
                "2:  Potatao Chips Pack  £0.80 \n"\
                "3:  Choclate Bar  £1.20 \n"\
                "4:  Candy Bar  £0.75 \n"\
                "5:  Juice Pack  £0.45 \n"\
                "please enter the number to buy an item e.g 1 to buy first item: "\
                " You have selected Candy Bar and its price is £0.75\n"\
                "please pay £0.75 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "please pay £0.25 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "please pay £0.05 and we only accept coins(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£): "\
                "You just Bought a Candy Bar\n").to_stdout
        end
    end
    
end