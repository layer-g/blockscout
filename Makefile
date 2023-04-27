.PHONY: help db up down

# full path for the Makefile
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
BASE_DIR:=$(shell basename $(ROOT_DIR))

.DEFAULT: help

help:
	@echo "make db" ;
	@echo "    :::> Format all code the project." ;
	@echo ;

# check for unused dependencies
db:
	mix do ecto.drop, ecto.create, ecto.migrate ;

up:
	docker-compose -f ./docker-compose/tan.yaml up --build -d ;

down:
	docker-compose -f ./docker-compose/tan.yaml down -v ;
