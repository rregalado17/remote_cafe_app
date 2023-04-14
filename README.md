Remote Cafe is a rails web application that allows users to create an account and comment/review cafes for remote workers. It is meant to help remote workers find cafes that serve quality food and strong wifi.

The app is built on Ruby on Rails and deployed on Heroku.

Setup
You'll need a Ruby environment to run Rails. First do:
$ rvm use .
$ bundle install

Then you need to create the database structure:
$ rake db:migrate

Lastly, you can you can start the server by doing:
$ raills s 

And go to http://localhost:3000/ to view the app. Alternatively, you can go directly to https://remote-cafe-app.herokuapp.com/ to see the app fully deployed. 

This RoR web app includes has_many, belongs_to and has_many :through associations through a join table that is a user-submittable attribute. My models include validations to defend against invalid data, classes that include chainable scope methods to differentiate data and standard user authentication (signup, login, logout, and passwords).

The controllers include reasonable DRY and SOLID principles. Any logic presented in my controllers is encapsulated as methods in my models. My routes include nested resources using RESTful URLs and my forms correctly display validation errors that describe the error in the views.

My views make use of helper methods and partials where appropriate.

License
The source code for the site is licensed under the MIT license, which you can find in the MIT-LICENSE.txt file.
