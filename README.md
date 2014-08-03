# yo4r
A Ruby interface to the Yo API.

## Installation
Install the gem with:

```
gem install yo4r
```

## Usage
At first, get the API token at http://developer.justyo.co/ and then:

```ruby
require 'yo4r'

# create a client
client = Yo::Client.new(api_token: 'your_api_token')

# Yo to someone
client.yo(username: 'someone')

# Yo to all subscribers
client.yoall

# count the number of your subscribers
client.subscribers_count # => 42
```

That's all.

## Exceptions
If `Yo::ClientError` is raised, the API token or username maybe invalid.
If `Yo::UnknownError` is raised, the Yo API server maybe down.

## Contributing
1. Fork it ( https://github.com/tanimichi/yo4r/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
