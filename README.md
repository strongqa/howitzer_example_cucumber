Howitzer Example Cucumber
=======================

[![Build Status](https://travis-ci.com/strongqa/howitzer_example_cucumber.svg?branch=master)][travis]
[![CircleCI](https://circleci.com/gh/strongqa/howitzer_example_cucumber.svg?style=svg&circle-token=e46a95ce08f0f19b93aee140f842ae845f696f01)](https://circleci.com/gh/strongqa/howitzer_example_cucumber)

[travis]: https://travis-ci.com/strongqa/howitzer_example_cucumber

Howitzer example project based on Cucumber for demo web application http://demoapp.strongqa.com

## Requirements

- Ruby 2.4.0
- Howitzer 2+

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

## Contributing

Code quality is controlled by [Rubocop](https://github.com/bbatsov/rubocop)

It is useful to activate rubocop pre-commit git hook for changed files.

```
cp scripts/pre-commit .git/hooks/pre-commit
```
