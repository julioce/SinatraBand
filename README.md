Sinatra Band
=============

This is a snippet ruby code for a faster initial setup of a Sinatra App. This is not meant to be a framework of any kind (yet). It's just a way of making a clean start without loosing so much time.

Also, i think Sinatra sings better with a band...


Installation
-----------

    $ gem install sinatraband-0.1.5.gem


Requirements
-----------

    require 'pathname'
    require 'erb'

You need `Ruby 1.9` to run SinatraBand and the `Sinatra` gem to run the app.

It's currently only supporting MySQL database. But it's actually pretty easy to change the default values on the generated database.rb. Take a look on DataMapper for help.


Usage
-----

After setup you can do for creating a app:

    $ sinatraband create app_name

Once you see the files created, you can move to the app_name directory:

    $ cd app_name

Then run the Sinatra app like you would normally do:

    $ ruby app.rb

You can also create a model and it's following properties:

    $ sinatraband model model_name property1:datamapper_type property2:other_datamapper_type

This also creates a sub-directory on the views directory with the name of the model and a controller file containing a basic scaffold idea. Remember that the views files called in the controller are not generated. 


Generating Tests
-------

You are on your own...


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_sinatraband`)
3. Commit your changes (`git commit -am "Added something"`)
4. Push to the branch (`git push origin my_sinatraband`)
5. Create an Issue with a link to your branch