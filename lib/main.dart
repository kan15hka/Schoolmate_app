import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolmate/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolmate/drawer/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    // runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //systemNavigationBarDividerColor: Color.fromARGB(255, 151, 72, 72),
        statusBarColor: kPrimaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark));
    kheight = MediaQuery.of(context).size.height;
    kwidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: kPrimaryColor,
        ),
        fontFamily: GoogleFonts.outfit().fontFamily,
        textTheme: TextTheme(
            bodyMedium: TextStyle(
                fontFamily: GoogleFonts.outfit().fontFamily, fontSize: 16.0)),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: kPrimaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: AttendenceScreen(),
      //home: StudentPhone(),
      home: const MainScreen(),
    );
  }
}
