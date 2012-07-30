Sinatra Band
=============

This is a snippet ruby code for a faster initial setup of a Sinatra App. This is not meant to be a framework of any kind (yet). It's just a way of making a clean start without loosing so much time.

Also, i think Sinatra sings better with a band...


Installation
-----------

    gem install sinatraband-0.0.5.gem


Requirements
-----------

    require 'pathname'
    require 'erb'

It's currently only supporting MySQL database. But it's actually pretty easy to change the default values on the generated database.rb. Take a look on Data Mapper for help.


Usage
-----

After setup you can do for creating a app:

    sinatraband create app_name

Once you see the files created, you can move to the app_name directory and run the Sinatra app like you would normally:

    ruby app.rb

You can also create a model and it's following properties:

    sinatraband model model_name property1:Data_mapper_type property2:Other_data_mapper_type


Testing
-------

You are on your own...


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_sinatraband`)
3. Commit your changes (`git commit -am "Added something"`)
4. Push to the branch (`git push origin my_sinatraband`)
5. Create an Issue with a link to your branch