ribbon-api-sample
=================

A sample site that shows the capabilities of Ribbon's API

To run the application:
<ol>
<li>Clone the repository</li>
<li>Navigate to the directory where it is stored "cd ribbon-api-sample"</li>
<li>Make an account on https://www.ribbon.co and create an application (Settings->Developer->Register a new application)</li>
<li>Put "http://localhost:4567" for the main application URL and "http://localhost:4567/auth/callback" for the callback URL.  Name it whatever you like.</li>
<li>Take the Consumer Key and Consumer Secret and place them into the variables at the top of app.rb</li>
<li>Install the gems listed in the Gemfile with a "bundle install" (if you don't have bundler install it here: http://gembundler.com/)</li>
<li>Install the sinatra contrib gem with a "gem install sinatra-contrib"</li>
<li>Run "ruby app.rb" in your terminal</li>
<li>Navigate to http://localhost:4567/ in your browser.</li>
<li>Try adding and deleting some products</li>
<li>Enjoy!</li>
</ol>