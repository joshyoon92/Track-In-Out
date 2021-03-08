# Track-In-Out
E-commerce Database 

Project Overview:

“Tracks In & Out,” is a web application that can keep track purchases from specific meat companies, sold products and amounts to customers and restaurants. This is for my family business, called “HWR Soup” and we are a soup brewing company with beef products. How is this good for the company? There are so many aspects that will keep track of history and build client trust and loyalty. There are three parts to keeping history of purchases and selling products. 
One is the meat companies: there will be 6-10 companies all over the world that we will have with 4 different meat/bone parts. Depending on their cost per weight, we will be buying from different companies, and since the meat cost differ from time to time and country to country, we will be buying from the companies with least cost. With the cost history of the selected meat companies, we can readily see the cost rise or fall for each company to evaluate their weekly, bi-weekly, monthly costs. 
Two is the restaurants: we will be selling this soup/broth to restaurants to become the foundation of their recipe, and keep track on their weekly and monthly need. With multiple restaurants, we can see which restaurants has bought the most of our product per year and see where their highest buying month to measure our need to buy how much meat from meat companies. Also, with restaurants that buy the most of our product, we can give royalty points to keep them with our business. 
Lastly, this web application can keep track of costumers who are buying for their family. This will be in smaller package like 500g per package. We can keep track of the customers’ locations to deliver our product to their house, and can keep their record to recognize them as returning customers. This is another way for us to give presents/royalty points to the returning customers.
So there are three different entities in this group, but they will be treated different. The meat companies’ address, name, phone #, their meat cost per pound will be kept track by an internal employee every week, for our purchases. This employee will gather information via phone call/email from the meat companies and physically input the data in the web application for the company to view. The other side of the data will be the restaurants and customers. Each restaurant will have its own account and purchase on the web application on how many gallons of soup they need for the week. They can purchase the soup automatically as a recurring purchases per week/month, or purchase as needed basis. This will send the data back to our company to process the purchase and send out the merchandise to their restaurant. For individual customers, it will be the same structure, but our company is able to view their account as individual customers. The restaurant account and individual customers will have a different account because their cost and purchase options will be different.

Use Cases: 

Create Account Use Case:
1.	The customer/employee visits “Track In & Out” website.
2.	The customer/employee clicks on account.
3.	The website brings up account login / create account page.
4.	The customer/employee clicks on either a customer or an employee create account.
5.	The customer/employee enters their information and the information is stored in the database.

Customer Purchase Use Case:
1.	The customer visits the website.
2.	The customer clicks login/create account.
3.	The website brings up the login/create account page.
4.	The customer logins to their account with their login information and password.
5.	The website brings up the menu of 4 different soup products: Sul Soup, Gom Soup, Seum Soup, and Gal Soup.
6.	The customer browses the menu and select products to buy.
7.	The customer clicks on the shopping bag.
8.	The website brings up the summary of the selected products with number of product and total price.
9.	The customer reviews the summary and purchases selected product.
10.	The website brings up the confirmation and the expected delivery date.
11.	The customer confirms the expected delivery date.
12.	The website sends a confirming email of the purchase to the customer’s email and to the company. 

Meat Company Data Use Case:
1.	The HWR Soup’s employee visits the website.
2.	The employee logins as an employee.
3.	The employee clicks on the manage meat company
4.	The website brings up the list of meat company: Meat(a), Meat(b), Meat(c), where the employee can contact several of these or none of these.
5.	The employee clicks “new company”
6.	The website brings up empty profile page.
7.	The employee inputs information on company name, contact name, address, phone #, and email to save the meat company.
8.	The website stores the information and brings up empty table with 4 meat names in the far-left column.
9.	The employee inputs the meat cost per pound for each meat parts, and the date. Each meat is a brisket, tenderloin, rib-eye, or flank.
10.	The website stores the information.

Structural Database Rules:

There are three use cases that I have created for this project. 
1.	Create Account Use Case
2.	Customer Purchase Use Case
3.	Meat Company Data Use Case

	From the “Create Account Use Case,” there are two entities: customer and account.
1. Each account must be an employee account or a customer account, but not both.
	From the “Customer Purchase Use Case,” there are four entities: account, product, shopping bag, and purchase.
2. Each account is associated with one or more products; each product is associated with one to many accounts.
3. Each account is associated with one shopping bag; each shopping bag is associated with one account.
4. Each product can be associated with one or more shopping bags; each shopping bag may have one to many products.
5. Each account can place one or more purchases; each purchase is placed with one account.
6. Each purchase is associated with one or more products; each product can be associated with one or more purchases. 
	From the “Meat Company Data Use Case,” there are four entities: employee, account, meat company, and meat part.
7. Each meat company produces one or more meat parts; each meat part can be produced by one or more meat companies.
9. Each employee can manage one or more meat companies; each meat company is managed with each employee.




