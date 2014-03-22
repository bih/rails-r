![Logo](http://bih.github.io/rails-r/images/logo.png)

# Rails-R: Navigation in Rails, made simple.

View the website for Rails-R [by clicking here](http://bih.github.io/rails-r/).

Rails-R is a script written in Bash that lets you navigate folders in your Rails projects very quickly through the `r` command. It uses Git to figure out the root of your Rails project and detects and intelligently opens files in either [Sublime Text](http://www.sublimetext.com), [Atom](http://atom.io) or Vim.

*Writing projects in Rails has never been so productive. Give it an spin in your project.*

# Installation
Currently, it only works in **Mac OS X** and tested in 10.8 Mavericks. It requires Git installed and used in your Rails project (which most projects usually do).

One-line installation.

```
$ curl http://bih.github.io/rails-r/download/latest.sh >> ~/.bash_profile && source ~/.bash_profile
```

# Navigation Commands

Some examples of what commands Rails-R gives you:

```
Configuration:
Open up my Gemfile:              $ r gems
Open up my README:               $ r readme
Open up environments folder:     $ r env
Open up my routes.rb:            $ r routes

Rails logic:
My Rails controllers folder:     $ r con
Rails application controller:    $ r con application_*
Models folder:                   $ r mod
Views folder:                    $ r view
Helpers folder:                  $ r help

Rails assets:
Stylesheets folder:              $ r css
Javascripts folder:              $ r js
Images folder:                   $ r img
Public folder:                   $ r public
Precompile assets:               $ r pre
Precompile & clean assets:       $ r -pre
```

# Contributing
We <3 contributors. Fork this repo and submit a pull request.

# License

Copyright © 2014 Bilawal Hameed

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.