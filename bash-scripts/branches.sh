#!/bin/bash

# Simple grep of all local git branches.

git branch | grep $1
