### Created by:
- [Jordan Beck](https://github.com/jordanfbeck0528) | [LinkedIn](https://www.linkedin.com/in/jordan-f-beck/)

#### Built With
* [Ruby on Rails](https://rubyonrails.org)
* [HTML](https://html.com)

#### Tested With
This project was tested with:
* [RSpec](https://rspec.info/)
* [VCR](https://github.com/vcr/vcr)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Postman](https://www.postman.com/) Explore and test the API endpoints using Postman, and use Postman’s CLI to execute collections directly from the command-line.

### About

I was given 5 days to create and consume expose 5 endpoints, and consume 4 APIs. This is the Fianl Project for Turing School's Mod 3. 


#### Prerequisites

* __Ruby__

  - The project is built with rubyonrails using __ruby version 2.5.3p105__, you must install ruby on your local machine first. Please visit the [ruby](https://www.ruby-lang.org/en/documentation/installation/) home page to get set up. _Please ensure you install the version of ruby noted above._

* __Rails__
  ```sh
  gem install rails --version 5.2.5
  ```

* __Postgres database__
  - Visit the [postgresapp](https://postgresapp.com/downloads.html) homepage and follow their instructions to download the latest version of Postgres app.

#### Installing

1. Clone the repo
  ```
  $ git clone https://github.com/jordanfbeck0528/sweater_weather
  ```

2. Bundle Install
  ```
  $ bundle install
  ```

3. Create, and migrate rails database
  ```
  $ rails db:{create,migrate}
  ```

4. Set up Environment Variables:
  - run `bundle exec figaro install`
  - add the below variable to the `config/application.yml` if you wish to use the existing email microservice. Otherwise you replace it the value with service if desired.


  If you do not wish to use the sample data provided to seed your database, replace the commands in `db/seeds.rb`.

### Endpoints
| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| GET | /api/v1/forecast | Get a minute, hour and day forecast |
| GET | /api/v1/backgrounds  | Get a background image |
| POST | /api/v1/users  | Create a new user |
| POST | /api/v1/sessions  | Create a session |
| POST | /api/v1/road_trip | Create a road trip |


#### API Contract
Please see the [API Documentation](In Progress) for detailed information about each endpoint, existing parameters, and expected json data input and output.


### Testing
##### Running Tests
- To run the full test suite run the below in your terminal:
```
$ bundle exec rspec
```
- To run an individual test file run the below in tour terminal:
```
$ bundle exec rspec <file path>
```
