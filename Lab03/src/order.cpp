#include "../inc/order.h"
#include <iostream>

// TODO - Part 2 - Member Initialization List for Item
Order::Item::Item(const std::string& n, int c)
{
}

// TODO - Part 2 - Constructor for Order - Member Initialization List
Order::Order()
{
}

// TODO - Part 2 - Constructor which allocates one item - Member Initialization List
Order::Order(const std::string& name)
{
	mItems.push_back(new Item(name, 1));
}

// Copy Constructor - Part 4
Order::Order(const Order &rhs)
{
	// TODO
}

Order::~Order()
{
	clearOrder();
}

// Deletes all items in variable ITEMS. - Part 3
void Order::clearOrder()
{
	// TODO
}

// Prints all items and their amounts.
void Order::displayOrder() const
{
	std::cout << "The current order is: " << std::endl;

	// Check if empty
	if(mItems.empty())
	{
		std::cout << "Empty" << std::endl;
		return;
	}

	// Display each item and its amount
	for (size_t i = 0; i < mItems.size(); ++i)
	{
		std::cout << mItems[i]->name << " " << mItems[i]->count << std::endl;
	}
}

// Assigns Order RHS values to the current Order's values - Part 5
Order& Order::operator=(const Order &rhs)
{
	// Starter code: self-assignment can cause unseen problems. It won't
		// happen in this program, but let's get you in the habit early.
	if(this == &rhs)
		return *this;

	// TODO
	
	
	/* Return the result */
	return *this;
}

/* 
Part 5
This operator should create a new Order that represents the
combined outcome of the current Order and the Order passed in via
parameter.
Note: It should not directly modify the current Order, but return
a copy of the combined Order instead. 
*/
Order Order::operator+(const Order &rhs) const
{
	// Starter code: operator+ should not modify THIS, so we make a copy
	Order result(*this);

	// TODO

	/* Return the result */
	return result;
}
