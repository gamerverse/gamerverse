# Gamerverse

A website that aims to help gamers discover new games, especially ones that are being played in their local area. Gamerverse will make it simple and easy to meet new local gamers, as well as setting up and attending local gaming events.

## Instructions

### Setting up the workspace in AWS Cloud9

In Cloud9, create a new private hosted workspace, selecting the Ruby template. Enter the following commands in the workspace's terminal:

    git clone https://github.com/gamerverse/gamerverse
    cd gamerverse
    rvm install ruby-2.5.0
    gem install rails
    bundle install

### Running the application

#### Development

Run the application in the development environment (Cloud9):

    rails db:migrate RAILS_ENV=development
    rails db:seed
    rails s -b $IP -p $PORT

#### Production

Run the application in the production environment (Heroku):

    git push heroku master
    heroku restart -a gamerverse && heroku pg:reset DATABASE --confirm gamerverse && heroku rake db:migrate && heroku rake db:seed
