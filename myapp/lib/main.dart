// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:myapp/Firebase_Demo/read_demo.dart';
// // import 'package:myapp/Lab5/Check.dart';
// // import 'package:myapp/Lab5/Question1.dart';

// // import 'package:provider/provider.dart';

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();

// //   runApp(const MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: ReadDemo(),
// //   ));
// // }

// // void main() async {
// //   runApp(ChangeNotifierProvider(
// //     create: (context) => Check(),
// //     child: const MaterialApp(
// //       home: Q1(),
// //       debugShowCheckedModeBanner: false, //ทำให้ Debug หายไปชั่วคราว,
// //       // theme: ThemeData(scaffoldBackgroundColor: Colors.black45),
// //     ),
// //   ));
// // }

// // import 'package:flutter/material.dart';
// //import 'package:myapp/Validation/form_validation.dart';
// // import 'package:myapp/design/baking.dart';

// //  const Color primaryColor = Color(0xFFFFBD73);
// //  const Color bgColor = Color(0xFF202020);
// //  Color textFieldColor = Colors.white;

// // void main() {
// //   runApp(MaterialApp(
// //     home: const Baking(),
// //     debugShowCheckedModeBanner: false,
// //     theme: ThemeData(
// //       scaffoldBackgroundColor: bgColor,
// //       textTheme: const TextTheme(
// //         headlineMedium: TextStyle(
// //           color: Colors.white,
// //           fontWeight: FontWeight.bold,
// //         ),
// //         titleLarge: TextStyle(
// //           color: Colors.white,
// //           fontWeight: FontWeight.normal,
// //         ),
// //         titleMedium: TextStyle(
// //           //สีกรอกค่าใน input
// //           color: Colors.white,
// //         ),
// //       ),
// //       backgroundColor: Colors.white,
// //       elevatedButtonTheme: ElevatedButtonThemeData(
// //         style: ElevatedButton.styleFrom(
// //             backgroundColor: primaryColor,
// //             foregroundColor: Colors.black,
// //             shape: const StadiumBorder(side: BorderSide.none),
// //             padding: const EdgeInsets.all(16)),
// //       ),
// //       inputDecorationTheme: InputDecorationTheme(
// //         hintStyle: TextStyle(color: textFieldColor),
// //         prefixIconColor: primaryColor,
// //         enabledBorder: UnderlineInputBorder(
// //           borderSide: BorderSide(color: textFieldColor),
// //         ),
// //       ),
// //     ),
// //   ));
// // }

// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:myapp/Firebase/auth_check.dart';
// // import 'package:myapp/Firebase/crud.dart';
// // import 'package:myapp/Firebase/login_demo.dart';
// // import 'package:myapp/Firebase/read_demo.dart';
// // import 'package:myapp/design/recipe.dart';
// // import 'package:myapp/page1.dart';
// // import 'package:myapp/provider/shop.dart';

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(
// //     const MaterialApp(
// //       home: Shop(),
// //       debugShowCheckedModeBanner: false,
// //     ),
// //   );
// // }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Firebase/Google/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
