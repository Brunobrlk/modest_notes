import 'package:flutter/material.dart';

import 'app/Home/home_page.dart';
import 'app/Search/search_page.dart';
import 'app/Write/write_page.dart';
import 'routes/routes.dart';

class AppMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modest Notes',
      theme: ThemeData(),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (_) => HomePage(),
        AppRoutes.SEARCH: (_) => SearchPage(),
        AppRoutes.WRITE: (_) => WritePage(),
      },
    );
  }
}