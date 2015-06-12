# DIT

The source code for dit-rohm.com.

[![wercker status](https://app.wercker.com/status/30dd7f3a9c5f19804f02a4b041e18eea/s "wercker status")](https://app.wercker.com/project/bykey/30dd7f3a9c5f19804f02a4b041e18eea)

## Requirements

- ruby 1.9.3 or later
- bundler
- bower

## Getting Started

Clone this repository:

```
$ git clone https://github.com/dit-rohm/dit-rohm.com
```

Install dependencies listed in `Gemfile` and `bower.json`:

```
$ bundle install --path vendor/bundle
$ bower install
```

Then you can run the server:

```
$ bundle exec middleman server
```

Go to `http://localhost:4567` and you'll see the website.

## Create an article

To create an article, Run the following command:

```
$ bundle exec middleman article TITLE --blog=TYPE
```

The `TYPE` is a type of the article (`news` or `blog`).
