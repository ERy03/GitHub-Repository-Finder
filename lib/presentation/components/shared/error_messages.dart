import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';

class ErrorMessages extends StatelessWidget {
  const ErrorMessages({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final isDioException = error is DioException;
    return Center(
        child: Text(
      isDioException
          ? handleDioError(error as DioException)
          : LocaleKeys.somethingWentWrong.tr(),
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.1),
    ));
  }
}

String handleDioError(DioException error) {
  if (error.response?.statusCode == 403) {
    return LocaleKeys.rateLimitExceeded.tr();
  } else if (error.response?.statusCode == 404) {
    return LocaleKeys.notFound.tr();
  } else if (error.response?.statusCode == 503) {
    return LocaleKeys.serviceUnavailable.tr();
  } else if (error.type == DioExceptionType.connectionError) {
    return LocaleKeys.networkError.tr();
  }
  return LocaleKeys.somethingWentWrong.tr();
}
