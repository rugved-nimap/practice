import 'package:flutter/material.dart';

class Inheritedclass extends InheritedWidget {
  final String text;
  const Inheritedclass({
    super.key,
    required this.text,
    required super.child
  });

  static Inheritedclass? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Inheritedclass>();
  }
  
  static Inheritedclass of(BuildContext context) {
    final Inheritedclass? result = maybeOf(context);
    assert(result != null, 'No Text Found');
    return result!;
  }

  @override
  bool updateShouldNotify(Inheritedclass oldWidget) {
    return text != oldWidget.text;
  }
}