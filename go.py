#!/usr/bin/env python

def invoke(invocation, path='.'):
	import os, subprocess
	start=os.getcwd()
	os.chdir(path)
	subprocess.check_call(invocation, shell=True)
	os.chdir(start)

import argparse
parser=argparse.ArgumentParser()
parser.add_argument('--build', '-b', action='store_true')
parser.add_argument('--run', '-r', action='store_true')
parser.add_argument('--interact', '-i', action='store_true')
parser.add_argument('--gigalixir-git', action='store_true')
args=parser.parse_args()

if args.build:
	invoke('mix deps.get')
	invoke('mix deps.compile')

if args.run:
	invoke('mix phx.server')

if args.interact:
	invoke('iex -S mix phx.server')

if args.gigalixir_git:
	print('https://git.gigalixir.com/monstrous-alert-nurseshark.git/')
