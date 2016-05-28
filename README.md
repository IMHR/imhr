# IMHR

IMHR is the official API gem to use for imhr.io, 24/7 On Demand HR. It's mainly a wrapper to OAuth2
API calls using an access token to https://imhr.io/api. Our goal is to minimize the setup needed and
get you started integrating with IMHR. Let us know when it's not easy. We love making things easy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imhr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imhr


Set `IMHR_API_TOKEN` environment variable to the API token you created from
[https://imhr.io/my/api_keys](https://imhr.io/my/api_keys).

## Usage

### Creating an event

```ruby
response = IMHR::API.create "v1/events",
                            type: "Events::ForgotClockOut",
                            data: {
                              phone_number: "+18888888888", # Internaltional Format
                              clock_out_time: "2016-05-28T14:50:38Z" # ISO 8601 Format
                            }

response.status # => 201
response.parsed # => { "created" => "true" }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run
the tests. You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new
version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/IMHR/imhr. This project is
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

