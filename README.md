# Reading Meow!
The one and only app wrangling the gift of reading for a kitty near you!

Also the official repo for this [Crash Course Intro to RSpec](https://bintlopez.gitbooks.io/rspec-wrangling/content/)

## Project Setup

### This project runs on...
* Ruby version 2.4.2
* Rails 5

### To get up and running...
* `git clone git@github.com:BintLopez/reading_meow.git`
* `cd reading_meow`
* `gem install bundler`
* `bundle install`
* `rake db:create db:migrate`

### To check your set up...
Make sure you can run the following two commands.
* `rails s`
* `bundle exec rspec`

### New to Ruby or Rails?
* Guide to set up your development environment for a Rails project
  * http://installfest.railsbridge.org/installfest/installfest
* Intro to rails tutorials:
  * http://installfest.railsbridge.org/intro-to-rails/
  * https://www.railstutorial.org/book

## How we're going to use this repo

We will be checking out various commits/branches and working off those to progress through the stages of app development with testing. The sequential steps with links to commits, diffs, more information, etc can be found here: https://bintlopez.gitbooks.io/rspec-wrangling/content/

This app does not 100% work, and in it's resting state has more than a few pended tests.
* Fix the bugs in this repo!
* Implement all the tests!
* Let the tests drive you to develop the best cat reading wrangling app Ruby, Rails, and RSpec have ever seen!

## Welcome to Reading Meow

You just got hired by Reading Meow, a lean start up trying to bring the gift of reading to cats. Reading's Meow's revolutionary app allows kind souls with library cards to go to the library and check out books on behalf of cats! Bored kitties don't have to languish away at home scratching on the same tired chair or expensive piece of furniture. Now, with Reading Meow, they can READ!

Your assignment is to build out the Reading Meow MVP.

As a user...
* Sign up for an account
* Log into account
* Update my profile
* Cancel/delete my account

As a cat...
* Has all the user actions
* Request books
* Rate/review books

As a cat reading wrangler...
* Has all the user actions
* Accept and fulfil book request(s) for cats

Book Request Actions...
* Initiate request (cat)
* Cancel request (cat)
* Accept request (wrangler)
* Checkout books for request (wrangler)
* Deliver books for request (wrangler)
* Pick up books for request (wrangler)
* Return books to library (wrangler)
