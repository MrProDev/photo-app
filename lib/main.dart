import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:itour_planner/firebase/auth_api.dart';
import 'package:itour_planner/firebase/google_signin.dart';
import 'package:itour_planner/screens/Home/dashboard_screen.dart';
import 'package:itour_planner/screens/SignUp/signup_screen.dart';
import 'package:itour_planner/screens/login/login_screen.dart';
import 'package:itour_planner/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ItourPlanner());
}

class ItourPlanner extends StatelessWidget {
  const ItourPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthApi>(
          create: (_) => AuthApi(),
        ),
        ChangeNotifierProvider<GoogleSignInApi>(
          create: (_) => GoogleSignInApi(),
        ),
      ],
      child: CupertinoApp(
        title: 'Itour Planner',
        routes: {
          '/': (context) => const SplashScreen(),
          MainPage.route: (context) => const MainPage(),
          SignUpScreen.route: (context) => const SignUpScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const route = '/MainPage';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CupertinoPageScaffold(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return const DashboardScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
