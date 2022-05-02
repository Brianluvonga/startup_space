import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/navigation.dart';
import 'package:startup_space/pages/startup/account/login_startup.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_auth_notifier.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_notifier.dart';
import 'package:startup_space/components/notifier/user/auth_notifier.dart';
import 'package:startup_space/pages/individuals/google_provider/google_provider.dart';
import 'package:startup_space/startup/posts/post_notifier/post_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
        ChangeNotifierProvider(create: (_) => StartupNotifier()),
        ChangeNotifierProvider(create: (_) => StartupPostNotifier()),
        ChangeNotifierProvider(create: (_) => StartupAuthNotifier()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigation(),
      ),
    );
  }
}
