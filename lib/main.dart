import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weigh_master_admin/module/admin/Data/db_service.dart';
import 'package:weigh_master_admin/module/admin/Presentation/adding_page.dart';
import 'package:weigh_master_admin/module/admin/Presentation/login_page.dart';
import 'package:weigh_master_admin/module/legel/home_page.dart';

import 'firebase_options.dart';
import 'module/admin/Presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DbService>(create: (_) => DbService())
      ],
      child: MaterialApp(
        theme: ThemeData(
          // backgroundColor: Colors.red,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Weigh Master Admin',
        home: UserType(),
      ),
    );
  }
}

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 180,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Text('ADMIN'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageLegel(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text('LEGEL'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
