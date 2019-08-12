# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app : Built FFL_APP using corneal, Sinatra and MaterializeCSS

- [x] Use ActiveRecord for storing information in a database : Used Active Record to create database and associations between models

- [x] Include more than one model class (e.g. User, Post, Category) : Includes Users, Players, and Teams

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) : a Team has many Players and a User has many Teams

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): a Player belongs to a Team and a Team belongs to a user

- [x] Include user accounts with unique login attribute (username or email) : User accounts require eunique usernames and passwords
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying : Teams can be Created, Read, Updated and Destroyed

- [x] Ensure that users can't modify content created by other users : Must be logged in to modify data belonging to a user

- [x] Include user input validations : username and password validated 

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message