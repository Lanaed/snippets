# P7 OO And CSV Bernie S Bistro 
 
##Learning Competencies 

* Infer the behavior and structure of code variables, methods, and objects accessed from test code
* Build test methods with descriptive output and clear indicators of passing tests
* Translate between different modes of modeling a problem (user stories, diagrams, pseudocode, etc.)
* Choose the appropriate method to store data in a file.
* Create well-defined classes with a single responsibility
* Identify and implement classes based on real world requirements

##Summary 

Congratulations! Your hard work modeling an orange grove for Fran the Farmer has paid off! She's referred you to her friend Bernie, owner of the popular cafe, Bernie's Bistro.

Bernie hired another programmer to build a computerized recipe system for the Bistro, but they didn't finish the job before moving on to an "exciting stealth mode opportunity in the virtual unicorn party space." Bernie needs someone to **finish the Bistro's recipe system**; and that person is YOU.


#### Recipe System Use Cases:

1. Load recipes from a file
2. List all recipes
3. Display a recipes name, description, and ingredients

Listing all recipes should print something like this to the console:
	
	1. Kale Burger
	2. Poodle Cake (For your puppy!)
	3. Peanut Butter Coffee Brownie
	
Displaying a single recipe should print something like this to the console:
	
	1 - Kale Burger
	The Kale Burger is one of our best selling dishes! 
	it combines the nutritional value of kale with
	the taste of cow!
	
	Ingredients:
	Kale, Cow
	
	Preparation Instructions:
	Preheat the oven to 500 degrees. Put in a cow. Wait 10 minutes.
	Put in some kale. Take out cow and kale. Put on bun Serve HOT!

---

Bernie is very impatient! Try to complete these objectives as quickly as you can! Be wary of over-designing the program - your job is to solve *these* problems, not find other problems to solve.

##Releases

###Release 0 :Find the edges

Try to get the existing recipe system to raise errors by interacting with it via the command-line. Try all sorts of crazy things. The code is dirty and incomplete; you may have to clean it up.

Be systematic in your approach. Write down what you tried, what you thought would happen, and what actually happened. 

### Write the code how you want to use it

Write down the main use cases for this program.

Then write tests that exercise those use cases. Use `bistro_test.rb` for your test code.

For example, if you want to be able to look at a recipe, you might write some code like this:

```ruby
p bistro.find_recipe_by_id(2).name == "Peanut Butter Coffee Brownie"
```
	
###Release 1 : Implement the MVP

MVP == Minimum Viable Product.

Implement the use cases that were not completed or completed incorrectly by the previous consultant, as revealed by the errors you got the program to raise or the driver code you wrote.


###Release 2 : Order Recipes in Alphabetical Order (Optional)

When you list the recipes now, the display should be:

	1. Kale Burger
	2. Peanut Butter Coffee Brownie
	3. Poodle Cake (For your puppy!)

Now the display number is different from it's id.  How can you accommodate this new listing format?   

<!-- ##Optimize Your Learning  -->

##Resources