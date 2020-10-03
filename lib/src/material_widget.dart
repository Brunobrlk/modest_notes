import 'package:flutter/material.dart';
import 'package:modestnotes/src/app/Categories/categories_view.dart';
import 'package:provider/provider.dart';

import 'app/Home/home_page.dart';
import 'app/Search/search_page.dart';
import 'app/Write/write_page.dart';
import 'controllers/controller.dart';
import 'routes/routes.dart';

class AppMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<Controller> (create: (_) => Controller())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Modest Notes',
        theme: ThemeData(),
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.HOME: (_) => HomePage(),
          AppRoutes.SEARCH: (_) => SearchPage(),
          AppRoutes.WRITE: (_) => WritePage(),
          AppRoutes.CATEGORIES: (_) => CategoriesView(),
        },
      ),
    );
  }
}