# DIT

### Prerequisites

- git
- ruby 1.9.3 or later
- rubygems
- bundler
- bower

### Installation

```
# Clone your repository
$ git clone ...

# cd into the source tree
$ cd dit

# Install dependencies listed in Gemfile
$ bundle install --path vendor/bundle

# Install dependencies listed in bower.json
$ bower install
```

### Run

```
$ bundle exec middleman server
```

### Create an article
以下のコマンドを実行することで、記事を書くためのmarkdownファイルが得られます。

```
$ bundle exec middleman article BLOG_TITLE --blog=BLOG_TYPE
```

`BLOG_TYPE`にはブログの種類を指定します。お知らせを作りたい場合は`news`、ブログ記事を作りたい場合は`blog`を指定します。markdownファイルは`/source/BLOG_TYPE/`に`{year}-{month}-{day}-BLOG_TITLE.html.markdown` というファイル名で作成されます。

### Reference
- [Middleman: インストール](https://middlemanapp.com/jp/basics/blogging/)
