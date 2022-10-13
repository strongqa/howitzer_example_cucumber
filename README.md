Howitzer Example Cucumber
=======================

[![Build Status](https://app.travis-ci.com/strongqa/howitzer_example_cucumber.svg?branch=master)](https://app.travis-ci.com/strongqa/howitzer_example_cucumber)
[![CircleCI](https://circleci.com/gh/strongqa/howitzer_example_cucumber.svg?style=svg&circle-token=e46a95ce08f0f19b93aee140f842ae845f696f01)](https://circleci.com/gh/strongqa/howitzer_example_cucumber)

Howitzer example project based on Cucumber for demo web application https://demoapp.strongqa.com

## Requirements

- Ruby 3.0.2

## Getting Started

*Note!* This project uses Git submodules in order to reuse common code between similar projects:

[howitzer_example_rspec](https://github.com/strongqa/howitzer_example_rspec)

[howitzer_example_turnip](https://github.com/strongqa/howitzer_example_turnip)

Typically it is not required for a regular project based on [Howitzer](https://github.com/strongqa/howitzer)

### How to try the project locally

- Clone project

```
git clone --recursive git@github.com:strongqa/howitzer_example_cucumber.git
```

- Install dependencies

```
bundle install
```

- Get list of available commands

```
rake -T
```

## Run tests in Docker

### Build image
```
docker build -t howitzer_example_cucumber .
```
Driver which is used by default is **headless chrome**

Use **docker run** command to create and run container.

- In order to run container by default:
```
docker run -d --name cucumber_container howitzer_example_cucumber
```
- Connect to created container using this command:
```
docker exec -it cucumber_container /bin/bash
docker exec -it <container ID> /bin/bash
```

- Run tests with the next commands using container's terminal:
```
SEXY_SETTINGS="driver=headless_chrome; headless_chrome_flags=$CHROME_ARGS" bundle exec rake
```
NOTE! If you need to launch tests under firefox headless browser, use this command:
```
SEXY_SETTINGS="driver=headless_firefox" bundle exec rake
```

### Run with docker compose

- Initialize build, and up the container in detached mode:
```
docker-compose -f docker-compose.yml up -d
```
- Connect to created container using this command:
```
docker compose exec -it howitzer_example_cucumber  /bin/bash
```

### Stop container
- Perform the next command to stop running container using docker-compose command:
```
docker-compose -f docker-compose.yml down
```
WARNING: ***after this command container will be deleted and all data lost.***

- If you need to save container use the next command to stop container:
```
docker stop <container_name/ID>
```

## Contributing

Code quality is controlled by [Rubocop](https://github.com/bbatsov/rubocop)

It is useful to activate rubocop pre-commit git hook for changed files.

```
cp scripts/pre-commit .git/hooks/pre-commit
```
