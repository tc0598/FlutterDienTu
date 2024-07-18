import 'package:app_shop_dien_tu/Provider/cart_provider.dart';
import 'package:app_shop_dien_tu/Provider/favorite_provider.dart';
import 'package:app_shop_dien_tu/admin/const.dart';
import 'package:app_shop_dien_tu/admin/dashboard.dart';
import 'package:app_shop_dien_tu/admin/pages/categories/category_screen.dart';
import 'package:app_shop_dien_tu/screens/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.mulishTextTheme(),
            primaryColor: MaterialColor(
              primaryColorCode,
              <int, Color>{
                50: const Color(primaryColorCode).withOpacity(0.1),
                100: const Color(primaryColorCode).withOpacity(0.2),
                200: const Color(primaryColorCode).withOpacity(0.3),
                300: const Color(primaryColorCode).withOpacity(0.4),
                400: const Color(primaryColorCode).withOpacity(0.5),
                500: const Color(primaryColorCode).withOpacity(0.6),
                600: const Color(primaryColorCode).withOpacity(0.7),
                700: const Color(primaryColorCode).withOpacity(0.8),
                800: const Color(primaryColorCode).withOpacity(0.9),
                900: const Color(primaryColorCode).withOpacity(1.0),
              },
            ),
            // scaffoldBackgroundColor: Color(0xFF171821),
            // fontFamily: 'IBMPlexSans',
            // brightness: Brightness.dark
          ),
          // home: const LoginScreen(),
          home: DashBoard(),
          initialRoute: '/',
          routes: {
            '/category-admin': (context) => CategoryAdminScreen(),
            // '/product-admin': (context) => ,
          },
        ),
      );
}
