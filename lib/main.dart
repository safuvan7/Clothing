import 'package:app_project/Bindings/general_bindings.dart';
import 'package:app_project/Data/Controller/banner_controller.dart';
import 'package:app_project/Data/Controller/user_controller.dart';
import 'package:app_project/Data/repositories/authentication/authentication_repository.dart';
import 'package:app_project/Data/repositories/banners/banner_repository.dart';
import 'package:app_project/Routes/app_routes.dart';
import 'package:app_project/Screens/Bottom_Navigation_Screen.dart';
import 'package:app_project/Screens/Login_pg.dart';
import 'package:app_project/Screens/Onboarding_screen.dart';
import 'package:app_project/Screens/SignUp_screen.dart';
import 'package:app_project/Screens/Splashscreen.dart';
import 'package:app_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.web).then(
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
