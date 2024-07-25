# Yumemi's Flutter Engineer Code Check Assignment

![github-repository-finder-recording-ezgif com-optimize](https://github.com/user-attachments/assets/538a94c7-9daf-4058-a132-bacb4f38794f)

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

- [Flutter_svg ^2.0.10+1](https://pub.dev/packages/flutter_svg)
- [intl ^0.19.0](https://pub.dev/packages/intl)
- [dio ^5.5.0+1](https://pub.dev/packages/dio)
- [flutter_riverpod: ^2.5.1](https://pub.dev/packages/flutter_riverpod)
- [riverpod_annotation: ^2.3.5](https://pub.dev/packages/riverpod_annotation)
- [cached_network_image: ^3.3.1](https://pub.dev/packages/cached_network_image)
- [url_launcher: ^6.3.0](https://pub.dev/packages/url_launcher)
- [share_plus: ^9.0.0](https://pub.dev/packages/share_plus)
- [easy_localization: ^3.0.7](https://pub.dev/packages/easy_localization)
- [app_settings: ^5.1.1](https://pub.dev/packages/app_settings)
- [shared_preferences: ^2.2.3](https://pub.dev/packages/shared_preferences)
- [flutter_markdown: ^0.7.3](https://pub.dev/packages/flutter_markdown)
- [markdown: ^7.2.2](https://pub.dev/packages/markdown)
- [mocktail: ^1.0.4](https://pub.dev/packages/mocktail)
- [jovial_svg: ^1.1.21](https://pub.dev/packages/jovial_svg)
- [flutter_native_splash: ^2.4.1](https://pub.dev/packages/flutter_native_splash)
- [flutter_launcher_icons: ^0.13.1](https://pub.dev/packages/flutter_launcher_icons)

## Issues

Not being able to display SVG in Flutter markdown.
https://github.com/flutter/flutter/issues/87857

Flutter SVG not displaying when it has a `<style>` element
https://github.com/dnfield/flutter_svg/issues/105

This is why I decided to use Jovial SVG which handles the style element as shown below. Not perfect but better.

flutter_svg:

![example with flutter svg](https://raw.githubusercontent.com/ERy03/GitHub-Repository-Finder/develop/assets/readme/flutter_svg.png)

jovial_svg:

![example with jovial svg](https://raw.githubusercontent.com/ERy03/GitHub-Repository-Finder/develop/assets/readme/jovial_svg.png)

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

This is the expected behavior because the app is being rebooted when its setting is changed.

[As explained in this comment](https://github.com/Baseflow/flutter-permission-handler/issues/509#issuecomment-1113636977)

## Test

Includes Units test and Widget test utilizing Mocktail.

Run test with `flutter test`

## Credits

- [DevIcon](https://github.com/devicons/devicon/): GitHub Icon used for App bar

## Inspiration and Documents

- https://codewithandrea.com/articles/flutter-riverpod-data-caching-providers-lifecycle/#caching-with-timeout
- [Implementing pagination](https://github.com/rrousselGit/riverpod/tree/master/examples/marvel)
- https://qiita.com/kasa_le/items/a33a607b8e6f1636be81

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
