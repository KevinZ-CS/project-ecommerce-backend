## Project Status
Project is actively being worked on. Issues and Pull Requests are welcomed.

## Project Ecommerce

Project Ecommerce is an online shopping web application where users can freely 
browse items listed on the webstore and add items to their shopping cart. After 
being satisfied with the items in their cart, the user can then checkout and securely 
pay through the Stripe payment gateway. In addition, users can create an account and leave 
reviews for items that other shoppers can view.

The frontend for this application is built using ReactJS with styling from React-
Bootstrap. Redux Toolkit is also introduced in this application for global 
state management. On the other side, the backend utilizes a Rails API and 
uses PostgreSQL as the primary database.

## Installation
Fork and clone this repo. Then install the dependencies by running:

```
bundle install
```
To seed the database with sample data, run:
```
rails db:seed
```
To run the server, run:
```
rails s
```

Repo for the front-end can be found at this link:

https://github.com/KevinZ-CS/project-ecommerce-client

## Usage
The features of this application include:

1. Full CRUD when logged in as an admin user. As an admin, the user can create,
   read, update and delete items on the website. In addition, the admin can 
   delete reviews by the customers.

2. Full CRUD as a customer. The user can add items to their cart, remove items from their cart,
   and update the quantity of the items in their cart.

3. Checkout capabilities where customers can securely pay through the Stripe payment gateway.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
MIT License

Copyright (c) 2023 Kevin Zheng

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
