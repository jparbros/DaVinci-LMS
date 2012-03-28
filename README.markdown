# DaVinci LMS

DaVinci LMS is an Open Source Learning Management System designed for project based teaching. A Learning Management System is a web enabled tool designed to enhance, in some way, the learning process of your students. There are many ways to enhance education and we won't try to be a fit for all. DaVinci LMS is specifically designed to help educational communities to do project based teaching. 

Project based teaching is a very simple concept. If solving problems is an integral part of the learning experience of your students, then you are doing project based teaching. DaVinci LMS provides an online interface that help teachers coordinate the projects and help students organise their assignments. 

This technology is open source, which means that you can access the source code and modify it to fit your particular needs. Nonetheless, DaVinci LMS will be crafted in such way that you won't need to modify the code to integrate it with your existing infrastructure. Instead, you will interact with a well defined API, an Application Programming Interface, which will be consistent, documented and easy to use. 

The current state of the project is early development. This is an excellent opportunity for you to be part of a fascinating project on educational technology. We would love to get contributions regarding the implementation of currently planned features (which you can see in the Issues section above). Design is going to be a first grade citizen in DaVinci LMS so we would love to get usability suggestions and art contributions. We are aiming for minimalist layout with an organic look. 

This piece of technology sits upon many other top notch technologies such as Ruby on Rails and MongoDB.

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