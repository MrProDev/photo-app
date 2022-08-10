import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itour_planner/firebase/auth_api.dart';
import 'package:itour_planner/firebase/google_signin.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const route = '/DashboardScreen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Dashboard'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(Icons.logout),
          onPressed: () async {
            final authApi = Provider.of<AuthApi>(context, listen: false);
            final googleApi =
                Provider.of<GoogleSignInApi>(context, listen: false);
            await authApi.signOut();
            googleApi.googleLogout();
          },
        ),
      ),
      child: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
