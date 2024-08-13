import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_world/business_logic/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:hello_world/business_logic/cubits/merchant_cubit/merchant_cubit.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_cubit.dart';
import 'package:hello_world/core/helpers/fire_base_helper.dart';
import 'package:hello_world/core/routing/routes.dart';
import 'package:hello_world/screens/authentication/login_screen.dart';
import 'package:hello_world/utils/theme.dart';
import 'package:hello_world/utils/utils.dart';

import 'business_logic/cubits/app_cubit/app_cubit.dart';
import 'business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'business_logic/cubits/bottom_nav_cubit/bottom_nav_bar_cubit.dart';
import 'business_logic/cubits/category_cubit/category_cubit.dart';
import 'business_logic/cubits/store_cubit/store_cubit.dart';
import 'business_logic/my_bloc_observer.dart';
import 'core/conf/firebase_options.dart';
import 'data/dataproviders/local/shared_preferences.dart';
import 'data/services/locator.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  final deviceData = await FireBaseHelper.getDeviceInfo();
  FireBaseHelper.initFirebaseMessaging();
  SharedPreference.init();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Tajawal", "Tajawal");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider(
          create: (context) => SettingCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => StoreCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => MerchantCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(getIt()),
        ),
      ],
      child: MaterialApp(
        locale: const Locale("ar"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: brightness == Brightness.dark ? theme.light() : theme.dark(),
        routes: routes,
        initialRoute: LoginScreen.route,
        // SharedHelper.isThereToken() == true
        //     ? MyBottomNavBar.route
        //     : LoginScreen.route,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
