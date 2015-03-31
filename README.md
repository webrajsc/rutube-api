# Rutube API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rutube-api', github: 'webrajsc/rutube-api'
```

And then execute:

    $ bundle

## Usage

### Searching

```ruby
Rutube::Video.search 'zkd'
Rutube::Video.search 'zkd', only_hd: :checked
Rutube::Tag.search 'zkd'
Rutube::User.search 'zkd'
```

### Video

```ruby
v = Rutube::Video.get 'f3992e6fb86edcf64223ec633fa3ed08'
v.title #=> "Comedy Woman: сезон 1, выпуск 1"

Rutube::Video.by_person 349
Rutube::Video.by_tag 8
Rutube::Video.by_tv 27
```

### User

```ruby
u = Rutube::User.get 349
u.name #=> "Надя Куликова"
```

### Tv

```ruby
Rutube::Tv.all

t = Rutube::Tv.get 27
t.name #=> "Реальные пацаны"
```

### Person

```ruby
p = Rutube::Person.get 789
p.name #=> "Nефть "
```

## API docs

1. http://dev.rutube.ru/api_video
2. http://dev.rutube.ru/search_api

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rutube-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
