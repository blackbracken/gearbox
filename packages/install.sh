#!/bin/bash

for language in $(ls ./languages); do
  sh ./languages/$language
done
