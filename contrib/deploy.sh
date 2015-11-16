#!/bin/bash

git config --global user.name "DIT (Doshisha Institute of Technology)"
git config --global user.email "dit.rohm@gmail.com"

bundle exec middleman deploy
