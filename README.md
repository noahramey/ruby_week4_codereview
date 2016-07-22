# _Shoe Distribution_

##### This application is a shoe distribution site in which the user can create various shoe brands and shoe stores, and have them belong to each other to find where shoes are sold. The application is made to showcase what I have learned about Active Record and Ruby thus far.

## Technologies Used

Application: Ruby, Sinatra, ActiveRecord<br>
Testing: RSpec, Capybara, Shoulda-Matchers<br>
Database: Postgres

Installation
------------

First clone the repository.  
```
$ git clone https://github.com/noahramey/ruby_week4_codereview.git
```

Install required gems:
```
$ bundle install
```

Use rake to setup your database:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```

Start the webserver:
```
$ ruby app.rb
```

Open `localhost:4567` in browser.

License
-------

MIT License. Copyright &copy; 2016 "Noah Ramey"
