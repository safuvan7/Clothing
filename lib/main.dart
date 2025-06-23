import 'package:app_project/Bindings/general_bindings.dart';
import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Routes/app_routes.dart';
import 'package:app_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clothing Shop',
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.red,
          body: Center(
            child: CircularProgressIndicator(color: Colors.white,),
          ),
      ),
      getPages: AppRoutes.pages,
    );
  }
}
