import 'package:flutter/material.dart';

class NavHelper {
  /// Normal push – yeni sayfaya geçiş yapar
  static Future<T?> push<T>(BuildContext context, Widget page) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  /// Push replacement – mevcut sayfayı değiştirir
  static Future<T?> pushReplacement<T>(BuildContext context, Widget page) {
    return Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  /// Pop – geri döner
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  /// Pop until – verilen route predicate sağlanana kadar geri gider
  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.of(context).popUntil(predicate);
  }

  /// Push and remove until – stack’i temizleyip yeni sayfayı açar
  static Future<T?> pushAndRemoveUntil<T>(BuildContext context, Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }
}
