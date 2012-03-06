# DaVinci LMS

DaVinci LMS is an Open Source Learning Management System focused on usability and performance.

This is in a very early phase of development and not ready for use.

## Setting up development

You will need

* MongoDB
* Ruby

Advisable:

* RVM

Get the code

```
git://github.com/Nerian/DaVinci-LMS.git
cd DaVinci-LMS
bundle install
rake db:reseed
rails s
```

The website will be available at [localhost:3000](localhost:3000)

## How to contribute

* Fork the project on Github
* Create a topic branch for your changes
* Ensure that all tests pass (`bundle exec rake`)
* Ensure that the changes in your branch are as atomic as possible
* Create a pull request on Github

For significant changes, you may wish to discuss your idea on Github Issues before coding to ensure that your change is likely to be accepted.

## Licence

The MIT License (MIT)

Copyright (c) 2012 Gonzalo Rodríguez-Baltanás Díaz