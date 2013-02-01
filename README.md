ribbon-api-sample
=================

A sample site that shows the capabilities of Ribbon's API

To run the application:
1. Clone the repository
2. Navigate to the directory where it is stored "cd ribbon-api-sample"
3. Make an account on https://www.ribbon.co and create an application (Settings->Developer->Register a new application)
4. Put "http://localhost:4567" for the main application URL and "http://localhost:4567/auth/callback" for the callback URL.  Name it whatever you like.
5. Take the Consumer Key and Consumer Secret and place them into the variables at the top of app.rb
6. Install the gems listed in the Gemfile with a "bundle install"
7. Install the sinatra contrib gem with a "gem install sinatra-contrib"
8. Run "ruby app.rb" in your terminal
9. Navigate to http://localhost:4567/ in your browser.
10. Try adding and deleting some products
11. Enjoy!