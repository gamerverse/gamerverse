# Gamerverse

A website that aims to help gamers discover new games, especially ones that are being played in their local area. Gamerverse will make it simple and easy to meet new local gamers, as well as setting up and attending local gaming events.

## Instructions

### Starting Out

To get the project up and running on c9:

Log in to c9.io

Click “create a new workspace”

Enter a workspace name and description

Select private hosted workspace

Select Ruby as a template

Click create a new workspace

In the terminal, type: “git clone https://github.com/gamerverse/gamerverse”

Change the terminal directory to gamerverse

In the terminal, type: “rvm install ruby-2.5.0”

In the terminal, type: “gem install rails”

In the terminal, type: “bundle install”

In the terminal, type: “rails db:migrate RAILS_ENV=development”

In the terminal, type: “rails db:seed”

In the terminal, type: “rails s -b $IP -p $PORT”

Before working on the project, make sure you understand git, especially forking, branching and merging



### Development

Run the application in the development environment (AWS Cloud9):

    rails db:migrate RAILS_ENV=development
    rails db:seed
    rails s -b $IP -p $PORT

### Production

Run the application in the production environment (Heroku):

    git push heroku master
    heroku restart -a gamerverse && heroku pg:reset DATABASE --confirm gamerverse && heroku rake db:migrate && heroku rake db:seed
