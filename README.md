# Openhomework
A site where you can upload and download homework assignments and exams from any college.
College data comes from the IPEDS database.

## Requirements
* Ruby 2.3.3
* AWS S3 (where assignments and assets are stored)

## Setup
* Run `bundle install`
* Create an `application.yml` file with your environment variables, based on the keys shown in `config/application.yml.sample`.
* `rake db:create`
* `rake db:schema:load`
* `rake db:seed` to seed your database with college data.
* Run `rails s -p <some port>` to run it
