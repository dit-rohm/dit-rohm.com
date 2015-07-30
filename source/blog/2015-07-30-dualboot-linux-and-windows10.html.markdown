---
layout: article_layout
title: Dualboot Linux and Windows10
date: 2015-07-30 13:14 JST
author: たむりん
description: Windows10 と Linux(manjaro) のデュアルブート環境構築メモ
eyecatch:
tags: Windows10, Linux
---

# Windows10 & manjaro インストール備忘録

*メモ*
手順の3-8と9-13を入れ替える

## インストール
ver: manjaro-kde-0.8.13.1-x86_64
構成: SSDにWindows8.1が入った状態

## 手順

### 1. Windows8.1 インストール

### 2. Windowsパーティションを縮小

### 3. manjaro LiveDVDからインストール
grubを/boot/EFI/に

### 4. とりあえず有線で繋いでrtl8192cuドライバをインストール
cf. http://withlooxp.blog.fc2.com/blog-entry-7.html
カーネルはなんでもいいはず？
再起動後にカーネルを選択して起動

### 5. sudo pacman -Syu

### 6. 言語パッケージをインストール

### 7. IPAフォントのインストール

### 8. uim-mozcで日本語入力環境を整える
cf. http://cat-clock.hatenablog.com/entry/2014/03/30/225521
かなり長い
途中で無線が切れてヒヤヒヤ

### 9. Windows8.1 -> 10

### 10. 初回の再起動でまさかのgrubを上書きされ、grub rescueと格闘

### 11. manjaro側でgrubを再インストール

### 12. Windows10へのアップデートを完了させる
note. このとき数回再起動するのでブート順をWindows優先にしておいたほうが吉

### 13. Windows Update等でドライバ周りを整備

### 14. デュアルブート環境構築完了。あとはお好きにどうぞ。

## 注意事項

### Windows8.1以下とLinuxのデュアルブート環境を整えてから10にアップデートするとブートローダが壊れる
grub rescueからnormal.modを探して起動後、grub-install
自分の場合 (hd0,gpt6)/boot/grub/x86_64-efi/ にあった

### はじめWindows8.1をインストールしたときにEFIパーティションが作成されなかった
原因不明
インストールディスク選択時に「新規」でパーティションを切らないとダメ？
