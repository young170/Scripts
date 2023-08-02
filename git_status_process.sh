#!/bin/bash

git status > text

# read from "
( tail -n0 text & ) | grep -q "modified:"
