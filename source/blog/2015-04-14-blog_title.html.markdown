---
title: BLOG_TITLE
date: 2015-04-14 20:10 JST
tags:
---

# HTMLとは
Hypertext Markup Language。
Webの表示に用いられるよ。

# HTMLを書いてみよう
Sublime Text2を開いてcommand+Nを押そう。（TODO：Windowsの場合）
htmlは以下のように書くよ。

```:html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>ここがタイトルだよ</title>
</head>
<body>
  <h1>ここが内容になるよ</h1>  
</body>
</html>
```

書いたらindex.htmlと書いてデスクトップに保存しよう。

# 書いたHTMLをブラウザで見てみよう
保存したindex.htmlを開くとブラウザで確認できるよ。
（TODO：要素を検証とか入れる？）

# CSSとは
cascading style sheets。

# HTMLをCSSで装飾してみよう
Sublime Text2を開いてcommand+Nを押そう。（TODO：Windowsの場合）

htmlに追記しよう。

index.html
```:html
~~~
<title>Document</title>
<link rel="stylesheet" href="style.css">
</head>
~~~
```

style.css
```:css
* {
  margin: 0;
  padding: 0;
}

h1 {
  float: left;
  font-size: 15px;
  width: 350px;
  margin-bottom: 5px;
  color: #FFF;
}
```

書いたらstyle.cssと書いてデスクトップに保存しよう。

# ブラウザで見てみよう
hoge。
