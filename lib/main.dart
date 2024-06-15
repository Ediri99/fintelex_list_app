// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/item_provider.dart';
// import 'screens/home_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ItemProvider(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: HomeScreen(),
//       ),
//     );
//   }
// }

// lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/item_provider.dart';
// import 'screens/home_screen.dart';
// import 'theme/colors.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ItemProvider(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primaryColor: AppColors.primaryColor,
//           scaffoldBackgroundColor: AppColors.backgroundColor,
//           errorColor: AppColors.errorColor,
//           colorScheme: ColorScheme(
//             primary: AppColors.primaryColor,
//             primaryContainer: AppColors.primaryColorLight,
//             secondary: AppColors.secondaryColor,
//             secondaryContainer: AppColors.secondaryColorLight,
//             surface: AppColors.surfaceColor,
//             background: AppColors.backgroundColor,
//             error: AppColors.errorColor,
//             onPrimary: AppColors.onPrimaryColor,
//             onSecondary: AppColors.onSecondaryColor,
//             onSurface: Colors.black,
//             onBackground: Colors.black,
//             onError: Colors.white,
//             brightness: Brightness.light,
//           ),
//           textTheme: TextTheme(
//             headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
//             headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
//             bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
//           ),
//           buttonTheme: ButtonThemeData(
//             buttonColor: AppColors.primaryColor,
//             textTheme: ButtonTextTheme.primary,
//           ),
//           appBarTheme: AppBarTheme(
//             color: AppColors.primaryColor,
//             titleTextStyle: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: AppColors.onPrimaryColor,
//             ),
//           ),
//         ),
//         home: HomeScreen(),
//         debugShowCheckedModeBanner: false, // Remove the debug banner
//       ),
//     );
//   }
// }

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              scaffoldBackgroundColor: AppColors.backgroundColor,
              errorColor: AppColors.errorColor,
              colorScheme: ColorScheme(
                primary: AppColors.primaryColor,
                primaryContainer: AppColors.primaryColorLight,
                secondary: AppColors.secondaryColor,
                secondaryContainer: AppColors.secondaryColorLight,
                surface: AppColors.surfaceColor,
                background: AppColors.backgroundColor,
                error: AppColors.errorColor,
                onPrimary: AppColors.onPrimaryColor,
                onSecondary: AppColors.onSecondaryColor,
                onSurface: Colors.black,
                onBackground: Colors.black,
                onError: Colors.white,
                brightness: Brightness.light,
              ),
              textTheme: TextTheme(
                headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
                headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: AppColors.primaryColor,
                textTheme: ButtonTextTheme.primary,
              ),
              appBarTheme: AppBarTheme(
                color: AppColors.primaryColor,
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onPrimaryColor,
                ),
              ),
            ),
            darkTheme: ThemeData.dark(), // Use the built-in dark theme
            themeMode: themeProvider.themeMode, // Use the current theme mode
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
