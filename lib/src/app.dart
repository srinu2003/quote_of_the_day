import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'themes/app_theme.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes of the Day',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(title: 'Quote of the Day'),
    );
  }
}
