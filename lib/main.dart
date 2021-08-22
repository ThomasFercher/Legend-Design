import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/legendColorTheme.dart';

import 'objects/menuOption.dart';
import 'pages/widgetComponets.dart';
import 'pages/home.dart';
import 'pages/products.dart';
import 'router/delegate.dart';
import 'router/parser.dart';
import 'router/routes/routeInfo.dart';
import 'router/routerProvider.dart';
import 'styles/legendTheme.dart';
import 'customwidgets/typography/typography.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = new WebRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LegendTheme>(create: (_) => LegendTheme()),
      ],
      child: RouterProvider(
        routerDelegate: routerDelegate,
        routes: [
          RouteInfo(
            name: "/",
            page: Home(),
          ),
          RouteInfo(
            name: "/products",
            page: ProductsPage(),
          ),
          RouteInfo(
            name: "/widgets",
            page: WidgetComponents(),
            sections: [
              SectionRouteInfo(name: "/buttons"),
              SectionRouteInfo(name: "/modals"),
              SectionRouteInfo(name: "/selectbar"),
              SectionRouteInfo(name: "/carousel"),
              SectionRouteInfo(name: "/textfield"),
              SectionRouteInfo(name: "/form"),
            ],
          ),
        ],
        menuOptions: [
          MenuOptionHeader(
            title: "Home",
            page: "/",
            icon: Icons.home,
          ),
          MenuOptionHeader(
            title: "Products",
            page: "/products",
            icon: Icons.accessibility,
          ),
          MenuOptionHeader(
            title: "Widgets",
            page: "/widgets",
            icon: Icons.widgets,
          ),
        ],
        child: MaterialApp.router(
          title: 'Legend Design',
          routerDelegate: routerDelegate,
          routeInformationParser: const MyRouteInformationParser(),
          debugShowCheckedModeBanner: false,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
