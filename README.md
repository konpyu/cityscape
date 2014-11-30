cityscape
====

take outstanding picture by chance

# Built with
Ruby on Rails(4.1+)
MySQL

# Deploy
Host in Heroku

```
# create app & add addons
heroku create city-scape
heroku addons:add cleardb:ignite --app your-app-id
heroku config:set DATABASE_URL='mysql2://your-cleardb-url'
heroku addons:add scheduler

# deploy
git push heroku master

# make db
heroku run rake db:migrate
heroku run rake db:seed_fu

# set config
heroku config:add AWS_ACCESS_KEY=YOUR_ACCESS_KEY
heroku config:add AWS_SECRET_KEY=YOUR_SECRET_KEY

# set rake task in scheduler
rake photo:fetch (every 1h)
rake photo:purge (every day)
```
