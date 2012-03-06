## DaVinci LMS

DaVinci LMS is an Open Source Learning Management System focused on usability and performance.

This is in a very early phase of development and not ready for use.

### Setting up development

You will need

* MongoDB

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

### Licence

The MIT License (MIT)

Copyright (c) 2012 Gonzalo Rodríguez-Baltanás Díaz