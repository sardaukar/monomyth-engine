MonomythEngine
==============

The Engine With A Thousand Faces
--------------------------------

This is a simple hack to have endpoints on your Rails app composed of other actions' output. For example, you might have <pre>/endpoints/meh</pre> be the combined output of 2 other actions in your app.

Quick setup
-----------

1. Add the gem to your Gemfile, e.g.:
<pre lang='ruby'>
  gem 'monomyth_engine', github: 'sardaukar/monomyth-engine'
</pre>
2. Mount the engine on your routes file:
<pre lang='ruby'>
  mount MonomythEngine::Engine, at: '/endpoints'
</pre>
3. Add a config file (by default looks in 'config/facades.yml') following this scheme:
<pre lang='yaml'>
facades:
  one:
    users: 'users#index'
    posts:
      route: 'posts#latest'
      bottom: 5
    format: 'json'
</pre>
4. Restart app, go to <pre>/endpoints/one</pre> and observe as the output of the mentioned actions is aggregated into this one.

The config file is re-parsed on every endpoint hit, so no need to reload the app for changes to occur.

Optionally, you can have an initializer:
<pre lang='ruby'>
MonomythEngine.configure do |c|
  c.facade_file = 'config/facades.yml'
  c.default_format = :json # not really used
end
</pre>

**DO NOT USE THIS CODE IN PRODUCTION**. It's not even tested, and is just a hack to learn more about Rails actions and routes!!!!!11

Developed as a hack-day toy for a hack day at [New Bamboo](http://new-bamboo.co.uk).

This project rocks and uses MIT-LICENSE.
