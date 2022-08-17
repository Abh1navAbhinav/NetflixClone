import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/bloc_downloads/downloads_bloc.dart';
import 'package:netflix/application/bloc_fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/bloc_search/search_bloc.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/main_page.dart/screen_main_page.dart';

import 'application/bloc_hot_and_new/hot_and_new_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await confifureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastLaughBloc>()),
        BlocProvider(create: (context) => getIt<HotAndNewBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
