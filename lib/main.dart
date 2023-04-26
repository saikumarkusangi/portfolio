import 'package:flutter/material.dart';
import 'package:portfolio/controllers/appbar_hover_provider.dart';
import 'package:portfolio/controllers/certificates_controller.dart';
import 'package:portfolio/controllers/image_hover.dart';
import 'package:portfolio/controllers/projects_controller.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/views/mobile/certificates/mobile_certificates.dart';
import 'package:portfolio/views/views.dart';
import 'package:portfolio/views/web/certificates/certificates.dart';
import 'package:portfolio/views/web/details_page.dart';
import 'package:portfolio/views/web/resume/resume.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppBarHoverController>(
            create: (_) => AppBarHoverController()),
        ChangeNotifierProvider<CertificatesController>(
            create: (_) => CertificatesController()),
        ChangeNotifierProvider<ImageHover>(create: (_) => ImageHover()),
        ChangeNotifierProvider<ProjectController>(
            create: (_) => ProjectController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'sai kumar kusangi portfolio',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(size: 32, color: Colors.black)),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const ResponsiveLayout(
                mobile: MobileHomePage(),
                web: WebHomePage(),
              ),
          '/about': (context) => const ResponsiveLayout(
                mobile: MobileHomePage(),
                web: WebHomePage(),
              ),
          '/resume': (context) => const ResponsiveLayout(
                mobile: WebResume(),
                web: WebResume(),
              ),
          '/certificates': (context) => const ResponsiveLayout(
                mobile: MobileCertificates(),
                web: WebCertificates(),
              )
        },
        home: const ResponsiveLayout(
            mobile: MobileHomePage(), web: SplashScreen()),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final projects = Provider.of<ProjectController>(context, listen: false);
    final certificates =
        Provider.of<CertificatesController>(context, listen: false);
    projects.projects;
    certificates.certificates;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => const ResponsiveLayout(
                    mobile: MobileHomePage(),
                    web: WebHomePage(),
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
