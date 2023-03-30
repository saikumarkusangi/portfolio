import 'package:flutter/material.dart';
import 'package:portfolio/controllers/appbar_hover_provider.dart';
import 'package:portfolio/controllers/image_hover.dart';
import 'package:portfolio/controllers/projects_controller.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/views/views.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<AppBarHoverController>(create: (_)=> AppBarHoverController()),
        ChangeNotifierProvider<ImageHover>(create: (_)=> ImageHover()),
         ChangeNotifierProvider<ProjectController>(create: (_)=> ProjectController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'sai kumar kusangi portfolio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ResponsiveLayout(mobile:  MobileHomePage(), web:  WebHomePage()),
      ),
    );
  }
}
