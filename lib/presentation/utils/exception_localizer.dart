import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/domain/exceptions/empty_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/mood_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/not_filled_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/wrong_order_exception.dart';

class ExceptionLocalizer {
  static String localize(BuildContext context, dynamic exception) {
    if (exception is MoodException) {
      return _localizeMoodException(context, exception);
    }
    return _localizeGenericError(context, exception);
  }

  static String _localizeMoodException(
    BuildContext context,
    MoodException exception
  ) {
    switch (exception) {
      case EmptyFieldException e:
        return 'Ошибка заполнения формы - код 001 (${e.field})';
      case NotFilledFieldException e:
        return 'Ошибка заполнения формы - код 002 (${e.field})';
      case WrongOrderException e:
        return 'Ошибка заполнения формы - код 003 (${e.message})';
      default:
        return "Неизвестная ошибка. Попробуйте еще раз";
    }
  }

  static String _localizeGenericError(
    BuildContext context,
    dynamic exception
  ) {
    return 'Что-то пошло не так. Попробуйте еще раз';
  }
}