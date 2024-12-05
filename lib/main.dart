import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallerio/controller/bloc/galleriobloc_bloc.dart';
import 'package:gallerio/controller/provider/providerapiservice.dart';
import 'package:gallerio/utils/theme/theme_data.dart';
import 'package:gallerio/view/pages/splash/splashscreen.dart';
import 'package:provider/provider.dart';

import 'controller/provider/networkprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //  ChangeNotifierProvider(create: (_) => NetworkStatus()),
        BlocProvider(
          create: (context) => GallerioBloc(ProviderApiService(),context))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gallerio',
        theme:  MyTheme.theme,
        home:const SplashScreen()
      ),
    );
  }
}

