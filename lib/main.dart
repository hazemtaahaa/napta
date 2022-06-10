import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/modules/login/LoginScreen.dart';
import 'package:napta/modules/profile%20visiting/profile_visiting.dart';
import 'package:napta/modules/profile/profile.dart';
import 'package:napta/modules/update/nterstedPlants.dart';
import 'package:napta/modules/update/update.dart';
import 'package:napta/shared/BlocObserver.dart';
import 'package:napta/shared/cubit/cubit.dart';
import 'package:napta/shared/network/remote/dio_helper.dart';


import 'modules/update/nterstedPlants.dart';

void main() {
  blocObserver: MyBlocObserver();
  DioHelper.init();
  runApp(
    BlocProvider<AppCubit>(
      create: (_) => AppCubit(), // create your BLoC here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:LoginScreen()
    );
  }
}


