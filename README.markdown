# DaVinci LMS

DaVinci LMS is an Open Source Learning Management System focused on usability and performance.

This is in a very early phase of development and not ready for use. Contributions are welcomed.

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

* Teacher & admin
  * Username: admin@test.kiwi
  * Password: admin
    
* Student
  * Username: student@test.kiwi
  * Password: student

## Online testing environment

Check the demo:

[http://davinci-lms-testing.herokuapp.com/](http://davinci-lms-testing.herokuapp.com/)

Feel free to do whatever you like there, it is automatically rebuilt.

* Teacher & admin
  * Username: admin@test.kiwi
  * Password: admin
    
* Student
  * Username: student@test.kiwi
  * Password: student

## How to contribute

Take a look at the [issues](https://github.com/Nerian/DaVinci-LMS/issues) and pick one that you like. Feel free to ask questions. You may also propose things; just open an issue and we will talk about it.

Then:

* Fork the project on Github
* Create a topic branch for your changes
* Ensure that all tests pass (`bundle exec rake`)
* Ensure that the changes in your branch are as atomic as possible
* Create a pull request on Github

For significant changes, you may wish to discuss your idea on Github Issues before coding to ensure that your change is likely to be accepted.

## Licence

The MIT License (MIT)

Copyright (c) 2012 Gonzalo Rodríguez-Baltanás Díaz