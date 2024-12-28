import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_flutter/src/cubit/auth_cubit.dart' as cubit;
import 'package:lab4_flutter/src/navigation/routes.dart';




final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for authentication state changes and
    // navigate to the intro or home screens
    return BlocListener<cubit.AuthCubit, cubit.AuthState>(
      listener: (context, state) {
        if (state == cubit.AuthState.signedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.intro, (r) => false);
        } else if (state == cubit.AuthState.signedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
        }
      },
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Authentication Flow',
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
