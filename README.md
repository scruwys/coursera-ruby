# Coursera API

This is an unofficial Ruby library for the [Catalog APIs](https://tech.coursera.org/app-platform/catalog/) provided by Coursera.

*Disclaimer: According to Coursera, these APIs are still in <b>beta</b> and can change in backwards-incompatible ways without warning. Therefore, beware when using this gem in production.* 


## Installation

In your Gemfile:

```ruby
gem 'coursera'
```

Or install it yourself as:

    $ gem install coursera

## Usage

There are three primary endpoints for the Coursera API: [Courses](https://api.coursera.org/api/courses.v1), [Partners](https://api.coursera.org/api/partners.v1), and [Instructors](https://api.coursera.org/api/instructor.v1). Due to the experimental nature of the API, I have decided to only include support for the Courses endpoint. The other two endpoints could be accessed in a similar nature, so feel free to read the code and contribute as you see fit.

### Course

You can search for a course if you know the ID:

```ruby
course = Coursera::Course.find("v1-228")
#=> #<Coursera::Course id="v1-228" ...>
```

Or if you know the slug you are interested in:

```ruby
course = Coursera::Course.find_by_slug("digitalmedia")
#=> #<Coursera::Course id="v1-228" ...>
```

You can then access course attributes like this :

```ruby
course.name
#=> "Creative Programming for Digital Media & Mobile Apps"

course.slug
#=> "digitalmedia"
```

You can add additional fields via a hash parameter:

```ruby
course = Coursera::Course.find("v1-228", {fields: [:startDate, :description]})
#=> #<Coursera::Course id="v1-228", description="For anyone ...>
```

Query the entire course catalog via the ```.all``` method:

```ruby
courses = Coursera::Course.all(limit: 30) # pass optional limit parameter to cap results
#=> [#<Coursera::Course ...>, #<Coursera::Course ...>]
```

Search functionality is also included:
```ruby
client = Coursera::Course.new

client.search_courses("data analytics", { fields: [:name, :photo], limit: 5 })
#=> [#<Coursera::Course ...>, #<Coursera::Course ...>]
```

Note in this last example, we initialize a client rather than call a class method. This was included for future development purposes, i.e., in case Coursera begins to require authorization tokens.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scruwys/coursera-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://www.contributor-covenant.org) code of conduct.

*Note: Test suite is minimal due to the experimental nature of this API. Contributions are appreciated.*

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

