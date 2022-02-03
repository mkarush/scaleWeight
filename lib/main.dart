import 'package:bloc_scale_weight/bloc/label_bloc/label_bloc.dart';
import 'package:bloc_scale_weight/bloc/weight_bloc/weight_bloc.dart';
import 'package:bloc_scale_weight/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      // Using Bloc Provider which provides bloc to children
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LabelBloc>(
            create: (BuildContext context) => LabelBloc(),
          ),
          BlocProvider<WeightBloc>(
            create: (BuildContext context) => WeightBloc(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
