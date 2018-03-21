# Gamerverse

A website that aims to help gamers discover new games, especially ones that are being played in their local area. Gamerverse will make it simple and easy to meet new local gamers, as well as setting up and attending local gaming events.

## Instructions

It's a good idea to check the status first with the following command:

    heroku rake -a gamerverse db:migrate:seed

Run the application in the production environment (Heroku):

    heroku rake -a gamerverse db:migrate
    heroku rake -a gamerverse db:seed
