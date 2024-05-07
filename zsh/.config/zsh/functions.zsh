#!/bin/sh

function git_branch() {
  echo $(command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
}

function gpo() {
  command git push -u origin $(git_branch)
}
