# Setup
On Local Machine install Ruby 3.1.2
or 
you can just copy the vending_machine.rb file code and run in any online compiler like   https://www.tutorialspoint.com/execute_ruby_online.php 


# Running instruction
I used Ubuntu 20.04.

Open the Terminal and run the command **ruby vending_machine.rb**.

Vending Machine will display all the available items number vise 
and customer has to enter the respective number to buy the item 
after that customer will be asked to enter the money(1p, 2p, 5p, 10p, 20p, 50p, 1£, 2£)
if the entered money is not enough to buy the item, customer will be asked to enter the money again.
After that purchase will be successfull and extra cash paid by customer will be returned e.g if 
the price of item is 70p and customer paid 1£ then 0.30£ is returned back in coins (20p, 10p)

# Project Explanation

Because we not using any database so I used constants to store data of items and coins.

First constant **ITEMS** is a ruby hash(dictionary) to store items information like thier title and price
Second constant **COINS** is also ruby hash to store coins values in pennies like 2£ = 200

Then their are two ruby classes **VendingMachine** and **CurrencyHandler**.

**VendingMachine** class implements the main flow of customer interacting with the vending machine.
**CurrencyHandler** helps in currency conversion and display.

# Review Entry Point 

**start** function at the end of **VendingMachine** class is best entry point for review.






