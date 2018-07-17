# DOG_API

A functional API to create/update/delete/show a dog race.
It's lacking a seed file for a database, which I'll add later

* Ruby version
2.5.1, but should work with 2.3.0 and up!

* System dependencies
Postgres 9.5+ for the db, Rails 5.2, Ruby >=2.3, and the gems described on the Gemfile.

* Configuration
Basic config with Postgres will be added later, but you can basically run the migrations to enform the database.
Just run `bundle exec rails server`, and start a postman (or use another service to create the requisitions) to `do the magic`.

* Database creation
Just run the migrations.

* Database initialization
(Missing seeds for now, I'm sorry)

* How to run the test suite
Will be adding some unit tests for this soon.

* Services (job queues, cache servers, search engines, etc.)
There is none of it, but accepting ideas of implementations.
