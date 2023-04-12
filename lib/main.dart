import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Modules/cubit/home_cubit.dart';
import 'package:todo_fir/Modules/task/tasks.dart';

import 'Modules/Auth/login/cubit/login_cubit.dart';
import 'Modules/Auth/login/login.dart';
import 'Modules/Auth/register/cubit/register_cubit.dart';
import 'Shared/Components/constante.dart';
import 'Shared/blocObserver/blocObserver.dart';
import 'Shared/helper/chashHelper.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachHelper.init();

  Widget startWidget;
  UID = CachHelper.getData(key: 'uid') ?? '';
  if (UID != '') {
    startWidget = Tasks();
  } else {
    startWidget = Login();
  }
  runApp(MyApp(
    startwidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;

  const MyApp({super.key, required this.startwidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => HomeCubit()..getUserData()),
        ],
        child: MaterialApp(
          home: startwidget,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                backgroundColor: Colors.white,
                // shadowColor: Colors.white,
                elevation: 0),
            scaffoldBackgroundColor: Colors.white,
          ),
        ));
  }
}
