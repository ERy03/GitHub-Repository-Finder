import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// We don't have an actual instance of SharedPreferences, and we can't get one except asynchronously
final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final themeModeProvider = StateProvider<bool>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final isDarkMode = preferences.getBool('darkMode') ?? false;
  ref.listenSelf((prev, curr) {
    preferences.setBool('darkMode', curr);
  });
  return isDarkMode;
});
