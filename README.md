# yo4r

[![Gem Version](https://badge.fury.io/rb/yo4r.svg)](http://badge.fury.io/rb/yo4r)
[![Dependency Status](https://gemnasium.com/tanimichi/yo4r.svg)](https://gemnasium.com/tanimichi/yo4r)
[![Stories in Ready](https://badge.waffle.io/tanimichi/yo4r.svg?label=ready&title=Ready)](http://waffle.io/tanimichi/yo4r)

A Ruby interface to the Yo API.

## Installation
Install the gem with:

```
gem install yo4r
```

## Usage
First, get an API token at http://developer.justyo.co/

Then:

```ruby
require 'yo4r'

# create a client
client = Yo::Client.new(api_token: 'your_api_token')

# say Yo to someone
client.yo(username: 'someone')

# say Yo to all subscribers
client.yoall

# count the number of your subscribers
client.subscribers_count # => 42
```

That's all.

## Exceptions
- If `Yo::ClientError` is raised, the API token or username may be invalid.
- If `Yo::UnknownError` is raised, the Yo API server may be down.

## Contributing
1. Fork it ( https://github.com/tanimichi/yo4r/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
