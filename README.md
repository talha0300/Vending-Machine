# Setup (Ubuntu 20.04)
On Local Machine install 
Ruby 3.1.2
Rspec 3.11.0   (in case you want to run test cases)


# Running instruction
I used Ubuntu 20.04.

Open the Terminal and run the command **ruby start.rb**.

Vending Machine will display all the available items number vise 
and customer has to enter the respective number to buy the item 
after that customer will be asked to enter the money(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£)
if the entered money is not enough to buy the item, customer will be asked to enter the money again.
After that purchase will be successfull and extra cash paid by customer will be returned e.g if 
the price of item is 70p and customer paid 1£ then 0.30£ is returned back in coins (20p, 10p)

# Project Explanation

Because we not using any database so I used constants to store data of items and coins.
Contansts are in the **data.rb**
First constant **ITEMS** is a ruby hash(dictionary) to store items information like thier title and price
Second constant **COINS** is also ruby hash to store coins values in pennies like 2£ = 200

Then their are two ruby classes 
**VendingMachine** in vending_machine.rb file
and 
**CurrencyHandler** in currency_handler.rb file.

**VendingMachine** class implements the main flow of customer interacting with the vending machine.
**CurrencyHandler** helps in currency conversion and display.\n

Then their is one more file **tests.rb** that includes rspec tests and you can run these test by running **ruby tests.rb** command on the terminal.

# Review Entry Point 

**start** function at the end of **VendingMachine** class in vending_machine.rb file is best entry point for review.






