# Yumemi's Flutter Engineer Code Check Assignment

## Outline

Create a Flutter App that work for iOS and Android following the requirements below.

## Requirements

### Environment

- Use the latest and stable versions for IDE・SDK・Programming Language
- In case of using outdated versions, make sure to describe the reasonings in the README
- Use Provider or Riverpod for state management
- You are free to use third party libraries as long as they are open source

### OS Version

|         | OS Version |
| ------- | ---------- |
| iOS     | 9.0 ~ 15.2 |
| Android | 4.1 ~ 12   |

### Features

- Allow users to input keywords
- Search GitHub repositories based on the user's input
- When searching GitHub repositories、use the GitHub API（[`search/repositories`](https://docs.github.com/ja/rest/reference/search#search-repositories)）
  - Do not use packages like [github | Dart Package](https://pub.dev/packages/github). Implement it so you are actually calling the API.
- Display the list of search results (Name of Repository)
- Clicking on the search item will display the details of the repository (Name of Repository, owner Icon, Programming Language, Number of stars, Number of Watches, Number of Fork, and Number of Issues)

### Design

Conform to Material Design

## Submission

- Present the URL for the public GitHub Respository
- Let us know if you want to submit in a different format（We would like to see your Git Commits）

## Packages

- [Flutter_svg 2.0.9](https://pub.dev/packages/flutter_svg)
- [intl ^0.19.0](https://pub.dev/packages/intl)

## Credits

- [DevIcon](https://github.com/devicons/devicon/): GitHub Icon used for App bar

## Evaluation

- Review Difficulty
  - Descriptive README
  - Proper Comments
  - Utilizing GitHub's pull requests
- Git
  - Proper gitignore Settings
  - Proper and clean Commit
  - Proper use of branches
- Safe, Clean, Maintainable, easy to read code
- Utilizing Dart's progrmaming language
- Testing
  - Follows a structure that allows to easilly incorporate tests
  - Unit / UI testing
- UI/UX
  - Error screen
  - Responsiveness to multiple screen size and scree orientation
  - Use of Theme and Dark Mode
  - Localization
  - Animation
- CI/CD
  - Build
  - Test
  - Lint
  - Format
  - Mock Deploy environment
