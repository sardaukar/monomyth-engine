MonomythEngine
==============

The Engine With A Thousand Faces
--------------------------------

This is a simple hack to have endpoints on your Rails app composed of other actions' output. For example, you might have <pre>/endpoints/meh</pre> be the combined output of 2 other actions in your app.

Quick setup
-----------

1. Add the <pre>monomyth_engine</pre> gem to your Gemfile
2. Mount the engine on your routes file:
<pre lang='ruby'>
  mount MonomythEngine::Engine, at: '/endpoints'
</pre>
3. Add a config file (by default looks in 'config/facades.yml') following this scheme:
<pre lang='yaml'>
facades:
  one:
    users: 'users#index'
    posts: 'posts#latest'
    format: 'json'
</pre>
4. Restart app, go to <pre>/endpoints/one</pre> and observe as the output of the mentioned actions is aggregated into this one.

DO NOT USE THIS CODE IN PRODUCTION. It's not even tested, and is just a hack to learn more about Rails actions and routes!!!!!11

Developed as a hack-day toy for a hack day at New Bamboo.

This project rocks and uses MIT-LICENSE.