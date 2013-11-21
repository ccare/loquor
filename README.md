# Loquor

[![Build Status](https://travis-ci.org/meducation/loquor.png)](https://travis-ci.org/meducation/loquor)
[![Dependencies](https://gemnasium.com/meducation/loquor.png?travis)](https://gemnasium.com/meducation/loquor)
[![Code Climate](https://codeclimate.com/github/meducation/loquor.png)](https://codeclimate.com/github/meducation/loquor)

Handles calls to the Meducation API via an ActiveRecord-style interface

## Installation

Add this line to your application's Gemfile:

    gem 'loquor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install loquor


## Usage

You will want to set up some configuration variables.
``` ruby
Loquor.config do |config|
  config.access_id  = "Username"
  config.secret_key = "SecretKey1929292"
  config.endpoint   = "http://www.meducation.net"
end
```

Now you make requests to get, create, update, destroy and list a range of objects, like this:

```ruby
User.where(email: "jeremy@meducation.net").where(name: "Jeremy").each do |user|
  p "The user with id ##{user['id']} is #{user['name']}."
end

User.find(2) # => {id: 2, name: "Jeremy Walker"}

User.create(name: "Jeremy Walker", email: "jeremy@meducation.net") # => {id: 2, name: "Jeremy Walker", email "jeremy@meducation.net"}
```

### Supported Objects

The following are currently endpoints are supported:
* Group Discussions
* Group Discussion Posts
* Media Files
* Users

### Is it any good?

[Yes.](http://news.ycombinator.com/item?id=3067434)

## Contributing

Firstly, thank you!! :heart::sparkling_heart::heart:

We'd love to have you involved. Please read our [contributing guide](https://github.com/meducation/loquor/tree/master/CONTRIBUTING.md) for information on how to get stuck in.

### Contributors

This project is managed by the [Meducation team](http://company.meducation.net/about#team). 

These individuals have come up with the ideas and written the code that made this possible:

- [Jeremy Walker](http://github.com/iHID)

## Licence

Copyright (C) 2013 New Media Education Ltd

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

A copy of the GNU Affero General Public License is available in [Licence.md](https://github.com/meducation/loquor/blob/master/LICENCE.md)
along with this program.  If not, see <http://www.gnu.org/licenses/>.
