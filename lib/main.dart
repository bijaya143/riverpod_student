import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_student/app/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}