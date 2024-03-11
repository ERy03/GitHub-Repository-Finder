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
- [intl 0.18.1](https://pub.dev/packages/intl)
- [dio ^5.4.0](https://pub.dev/packages/dio)
- [flutter_riverpod: ^2.4.10](https://pub.dev/packages/flutter_riverpod)
- [riverpod_annotation: ^2.3.4](https://pub.dev/packages/riverpod_annotation)
- [cached_network_image: ^3.3.1](https://pub.dev/packages/cached_network_image)
- [url_launcher: ^6.2.4](https://pub.dev/packages/url_launcher)
- [share_plus: ^7.2.2](https://pub.dev/packages/share_plus)
- [easy_localization: ^3.0.4](https://pub.dev/packages/easy_localization)
- [app_settings: ^5.1.1](https://pub.dev/packages/app_settings)

intl uses version 0.18.1 because intl is pinned to version 0.18.1 by flutter_localizations from the flutter SDK.

## Easy Localization

Run the following command whenever translations files are modified.

`dart run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart`

## App Settings

This project utilizes App_Settings Package to allow users to change the app's language via the setting screen. In ios when running locally, app will crash with the following output:

```
thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGKILL
    frame #0: 0x00000001d38c0030 libsystem_kernel.dylib`mach_msg2_trap + 8
libsystem_kernel.dylib`mach_msg2_trap:
->  0x1d38c0030 <+8>: ret
libsystem_kernel.dylib`macx_swapon:
    0x1d38c0034 <+0>: mov    x16, #-0x30
    0x1d38c0038 <+4>: svc    #0x80
    0x1d38c003c <+8>: ret
Target 0: (Runner) stopped.
Lost connection to device
```

This is the expected behavior because the app is being rebotted when its setting is changed.

[As explained in this comment](https://github.com/Baseflow/flutter-permission-handler/issues/509#issuecomment-1113636977)

## Credits

- [DevIcon](https://github.com/devicons/devicon/): GitHub Icon used for App bar

## Inspiration and Documents

- https://codewithandrea.com/articles/flutter-riverpod-data-caching-providers-lifecycle/#caching-with-timeout

## Side note

I would typically use GoRouter for navigation. However, because the project has simple navigation and does not require web implmentation, I just went with the Navigator widget. If you want to utilize GoRouter and implement this project for web, you would not be able to pass the `GitHubRepositoryModel` object when navigating to the detail screen because we can't encode custom objects inside the URL path.

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
