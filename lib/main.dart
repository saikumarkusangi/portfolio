import 'package:flutter/material.dart';
import 'package:portfolio/controllers/appbar_hover_provider.dart';
import 'package:portfolio/controllers/certificates_controller.dart';
import 'package:portfolio/controllers/image_hover.dart';
import 'package:portfolio/controllers/projects_controller.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/views/views.dart';
import 'package:portfolio/views/web/details_page.dart';
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
            appBarTheme: AppBarTheme(iconTheme: IconThemeData(size: 32,color: Colors.black)),
            primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
        home: const ResponsiveLayout(
            mobile: MobileHomePage(), web: SplashScreen()),
      ),
    );
  }
}

class ProjectRouteInformationPasrser
    extends RouteInformationParser<RoutesPath> {
  @override
  Future<RoutesPath> paraseRouthInfo(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.length == 0) {
      return RoutesPath.home();
    }

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments.first != 'MyWorks') {
        return RoutesPath.unKnown();
      }
      final remaining = uri.pathSegments.elementAt(1);
      final id = remaining;
      if (id == null) {
        return RoutesPath.unKnown();
      }
      return RoutesPath.details(id);
    }

    return RoutesPath.unKnown();
  }

  @override
  RouteInformation? restoreRouteInformation(RoutesPath path) {
    if (path.isUnKnown) return RouteInformation(location: '/404');
    if (path.isHomePage) return RouteInformation(location: '/');
    if (path.isDetailsPage)
      return RouteInformation(location: '/MyWorks/${path.projectTitle}');
    return null;
  }
}

class RouteDelegate extends RouteInformationParser {}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final projects = Provider.of<ProjectController>(context, listen: false);
    final certificates =
        Provider.of<CertificatesController>(context, listen: false);
    projects.projects;
    certificates.certificates;
    Future.delayed(Duration(seconds: 3), () {
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
