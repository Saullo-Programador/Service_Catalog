import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobs_app/data/dataSources/firestore_service_datasource.dart';
import 'package:jobs_app/data/repository_impl/service_repository_impl.dart';
import 'package:jobs_app/firebase_options.dart';
import 'package:jobs_app/presentation/controller/service_controller.dart';
import 'package:provider/provider.dart';
import 'package:jobs_app/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ServiceController(
            ServiceRepositoryImpl(
              FirestoreServiceDatasource(FirebaseFirestore.instance)
            )
          )
        )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
