#!/usr/bin/env bash

for f in ~/dotfiles/*
do
  ln -s "$f" "$HOME/.${f##*/}"
done
