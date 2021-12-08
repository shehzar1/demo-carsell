# Carsell

**Carsell is the online marketplace website for car shoppers and sellers.**

Technical framework behind this project is **Ruby on Rails** and for interface **bootstrap** is integrated. 

## Features 
- Post Ad going through multiple steps 
- CRUD operations for an Advertisement
- User authentication using devise gem
- Add an Advertisement to Favorites
- Feature an Advertisment through **STRIPE API**
- Search an Advertisment through multiple filters
- Close status of an Advertisement 
- View User Specific Posts
- View User Specific Favorite Posts
- Pagination all over using pg gem

## How to run

### Pre Requisite
- Rails 6 
- Bootstrap 5
- Postgres db

1. Clone this repo in your local machine
2. run `bundle install`
3. run `rails db:create`
4. run `rails db:migrate`
5. run `rails server`
