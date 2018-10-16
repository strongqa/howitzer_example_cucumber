Howitzer Example Cucumber
=======================

[![Build Status](https://travis-ci.org/strongqa/howitzer_example_cucumber.svg?branch=master)][travis]
[![CircleCI](https://circleci.com/gh/strongqa/howitzer_example_cucumber.svg?style=svg&circle-token=e46a95ce08f0f19b93aee140f842ae845f696f01)](https://circleci.com/gh/strongqa/howitzer_example_cucumber)

[travis]: https://travis-ci.org/strongqa/howitzer_example_cucumber

Howitzer example project based on Cucumber for demo web application http://demoapp.strongqa.com

## Requirements

- Ruby 2.5.1
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

[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/0)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/0)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/1)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/1)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/2)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/2)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/3)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/3)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/4)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/4)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/5)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/5)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/6)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/6)[![](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/images/7)](https://sourcerer.io/fame/romikoops/strongqa/howitzer_example_cucumber/links/7)

Code quality is controlled by [Rubocop](https://github.com/bbatsov/rubocop)

It is useful to activate rubocop pre-commit git hook for changed files.

```
cp scripts/pre-commit .git/hooks/pre-commit
```
