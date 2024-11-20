import 'package:e_commerce/screens/form.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

final Color seedColor = Colors.grey.shade900;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark, // Adjust brightness if needed
          ),
          primaryColor: seedColor,
          useMaterial3: true,
        ),
        home: const LoginApp(),
      ),
    );
  }
}
