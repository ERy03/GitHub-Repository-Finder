import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repository_finder/theme/theme_mode_provider.dart';
import 'package:github_repository_finder/presentation/screens/repositories_search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ja')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ProviderScope(overrides: [
        // Override the unimplemented provider with the value gotten from the plugin
        sharedPreferencesProvider.overrideWithValue(prefs),
      ], child: const MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeModeProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeModeState ? ThemeData.dark() : ThemeData.light(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const RepositoriesSearchScreen());
  }
}
