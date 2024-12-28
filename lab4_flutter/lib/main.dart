import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:lab4_flutter/firebase_options.dart';
import 'package:lab4_flutter/src/app.dart';
import 'package:lab4_flutter/src/cubit/auth_cubit.dart';
import 'package:lab4_flutter/src/data_source/firebase_data_source.dart';
import 'package:lab4_flutter/src/repository/auth_repository.dart';
import 'package:lab4_flutter/src/repository/implementation/auth_repository.dart';
import 'package:lab4_flutter/src/repository/implementation/my_user_repository.dart';
import 'package:lab4_flutter/src/repository/my_user_repository.dart';


// Create a global instance of GetIt that can be used later to
// retrieve our injected instances
final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: "dev project"
  );

  // Inject dependencies
  await injectDependencies();

  runApp(
    // AuthCubit will be at the top of the widget tree
    BlocProvider(
      create: (_) => AuthCubit()..init(),
      child: const MyApp(),
    ),
  );
}

// Helper function to inject dependencies
Future<void> injectDependencies() async {
  // Inject the data sources.
  getIt.registerLazySingleton(() => FirebaseDataSource());

  // Inject the Repositories. Note that the type is the abstract class
  // and the injected instance is the implementation.
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
  getIt.registerLazySingleton<MyUserRepository>(() => MyUserRepositoryImp());
}
