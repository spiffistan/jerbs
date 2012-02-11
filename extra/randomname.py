#!/usr/bin/env python

import sys

from random import random

def randomname():
	first = open('fornavn_by_freq.csv', 'r')
	last = open('etternavn_by_freq.csv', 'r')

	first_by_freq = []
	last_by_freq = [] 

	for line in first.readlines():
	  name, freq = line.split()
	  first_by_freq.append((float(freq),name))
 
	for line in last.readlines():
	  name, freq = line.split()
	  last_by_freq.append((float(freq),name))

	first_by_freq.sort()
	last_by_freq.sort()

	print first_by_freq

	def random_name():
	  first_name = ""
	  last_name = ""

	  acc = 0.0
	  rand = random()

	  for i in first_by_freq:
	    acc += i[0]
	    if rand < acc:
	      first_name = i[1]
	      break

	  acc = 0.0
	  rand = random()

	  for i in last_by_freq:
	    acc += i[0]
	    if rand < acc:
	      last_name = i[1]
	      break

	  return first_name + " " + last_name

	print random_name()

if __name__ == "__main__":
	sys.exit(randomname())