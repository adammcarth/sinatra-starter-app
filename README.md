Use this basic Sinatra Starter Application every time you start a new project. It works right out of the box, and only requires a tiny bit of configuration to get your development project up and running.

## What it's good for:

- Perfect backbones if you're starting a **dynamic** sinatra web application.
- Created for use with MySQL.
- People who want an easy starting template that's extremely flexible and contains good practises.

## What it's not good for:

- Not as great for **static** websites. This template is database driven, and the file structure and configuration is not really suited to an application that rarely uses dynamic content. If you're on this boat, take advantage of Sinatra's awesome lightweight nature and keep it basic.
- Haml junkies and people wearing cheap suites.

# Installation:

1. Configure The Databse:<br />
1.1. Change `config\database_example.yml` to `config\database.yml`.<br />
1.2. Add your MySQL database settings to the database config file.
2. Install The Gems:<br />
2.1. CD to your project folder using terminal/command prompt.<br />
2.2. Run `bundle install`.
3. Oh... that's it. Start your server by running either `rackup` or `ruby app.rb`.<br />

### Shotgun and Tux?

This template uses 2 development gems by default, [shotgun](https://github.com/rtomayko/shotgun "Visit GitHub Page For More Info") and [tux](https://github.com/cldwalker/tux "Visit GitHub Page For More Info"), which you may not have come across before:

- If you're a Mac or Linux user, start your server when in development by using `shotgun`. This means you don't have to restart the server each time you wish to refresh the page to see your changes. Sorry, this gem doesn't work for Windows users.
- The tux console allows you to run ruby code in your apps environment. Open a fresh terminal/command prompt and cd to your project. Simply run `tux` like so...<br />
**Once in the Tux console, we can talk to our App in ruby code (assuming we have a post model):**

<pre>
$ tux
>> Post.count
3
>> loadingBay = Post.new(title: "Foo", body: "Hello World")
>> loadingBay.save
>> Post.count
4
</pre>

### Flash Messages
The [sinatra-flash](https://github.com/SFEley/sinatra-flash "Visit GitHub Page For More Info") gem also comes default with this template. Almost every dynamic app has a use for them. To use flash messages, follow the example below:

<pre>
post "/posts"
  @post = Post.new(params[:post])
  if @post.save
    flash.next[:success] = "Your post was added succesfully!"
    redirect "/posts/#{@post.id}"
  else
    flash.next[:error] = "Oops. Something went wrong. Please fix any errors and try again!"
    erb :"posts/new"
  end
end
</pre>

###Asset Pipeline
The asset pipeline works exactly the same as it does in Rails. This template uses [sprockets](https://github.com/sstephenson/sprockets "Visit GitHub Page For More Info"), so if you're unfamiliar with it - it's probably worth your while to read the documentation. The way it's setup now, anything you put into `assets/stylesheets` will get automatically added to your layout. For stability reasons, files in `assets/javascripts` need to be manually included in the `application.js` file (you can change this of course).

###Rendering Partials
Again, a helper method has been added to simulate *rails-style* partials. To use a partial with this template, use the exact same technique you use in Rails:

<pre>
# views/_login.erb
I'm a login form :)

# views/index.erb
&lt;%= render :partial => "login" %>

# Browser Output:
I'm a login form :)
</pre>

## QITYMA (Questions I Think You Might Ask):
**What is the point of step 1.1? Why don't you just upload the proper filename, `database.yml`?:**

Should you ever decide to upload your finished application to GitHub, I've made sure that the real `database.yml` file is ignored so that people can't access your MySQL configuration in plain text. This demo app is no different, so I had to add `_example` to prevent `.gitignore` from hiding it.

**Bundle Install fails due to MySQL2. How do I fix it?**

Try seperately installing the MySQL2 gem like this (sub in the real path of your `lib` folder):

<pre>
gem install mysql2 -- --with-mysql-lib=/usr/lib/mysql/lib
</pre>