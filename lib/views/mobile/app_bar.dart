import 'package:flutter/material.dart';
import 'package:portfolio/views/views.dart';
import 'package:portfolio/views/web/resume/resume.dart';
import 'package:provider/provider.dart';

import '../../../controllers/appbar_hover_provider.dart';
import '../web/certificates/certificates.dart';
import 'certificates/mobile_certificates.dart';


class CustomMobileAppBar extends StatelessWidget {
  const CustomMobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appbarHoverProvider = Provider.of<AppBarHoverController>(context);
    return Container(
    
      
      child: Stack(
        children: 
          [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close)),
            ),
            Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width ,
              height:  MediaQuery.of(context).size.height/2,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (value) {
                        appbarHoverProvider.hover(index: 0, isHover: true);
                      },
                      onExit: (value) {
                        appbarHoverProvider.hover(index: 0, isHover: false);
                      },
                      child: InkWell(
                        onTap: () {
                          appbarHoverProvider.setCurrentTab(index: 0);
                          Navigator.pushNamed(
                              context,
                              '/home');
                        },
                        child: Text(
                          'HOME',
                          style: TextStyle(
                              decoration: (appbarHoverProvider.currentTab == 0)
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontSize:
                                  (appbarHoverProvider.currentTab == 0) ? 32 : 24,
                              color: (appbarHoverProvider.isHover &&
                                      appbarHoverProvider.index == 0 &&
                                      appbarHoverProvider.currentTab != 0)
                                  ? Colors.greenAccent
                                  : (appbarHoverProvider.currentTab == 0)
                                      ? Colors.black
                                      : Colors.black45),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (value) {
                        appbarHoverProvider.hover(index: 1, isHover: true);
                      },
                      onExit: (value) {
                        appbarHoverProvider.hover(index: 1, isHover: false);
                      },
                      child: InkWell(
                        onTap: () {
                          appbarHoverProvider.setCurrentTab(index: 1);
                        },
                        child: Text(
                          'ABOUT',
                          style: TextStyle(
                              decoration: (appbarHoverProvider.currentTab == 1)
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontSize:
                                  (appbarHoverProvider.currentTab == 1) ? 32 : 24,
                              color: (appbarHoverProvider.isHover &&
                                      appbarHoverProvider.index == 1 &&
                                      appbarHoverProvider.currentTab != 1)
                                  ? Colors.greenAccent
                                  : (appbarHoverProvider.currentTab == 1)
                                      ? Colors.black
                                      : Colors.black45),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (value) {
                        appbarHoverProvider.hover(index: 2, isHover: true);
                      },
                      onExit: (value) {
                        appbarHoverProvider.hover(index: 2, isHover: false);
                      },
                      child: InkWell(
                        onTap: () {
                          appbarHoverProvider.setCurrentTab(index: 2);
                          Navigator.pushNamed(context,
                             '/resume');
                        },
                        child: Text(  
                          'RESUME',
                          style: TextStyle(
                              decoration: (appbarHoverProvider.currentTab == 2)
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontSize:
                                  (appbarHoverProvider.currentTab == 2)? 32 : 24,
                              color: (appbarHoverProvider.isHover &&
                                      appbarHoverProvider.index == 2 &&
                                      appbarHoverProvider.currentTab != 2)
                                  ? Colors.greenAccent
                                  : (appbarHoverProvider.currentTab == 2)
                                      ? Colors.black
                                      : Colors.black45),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (value) {
                        appbarHoverProvider.hover(index: 3, isHover: true);
                      },
                      onExit: (value) {
                        appbarHoverProvider.hover(index: 3, isHover: false);
                      },
                      child: InkWell(
                        onTap: () {
                          appbarHoverProvider.setCurrentTab(index: 3);
                          Navigator.pushNamed(
                              context,
                             '/certificates');
                        },
                        child: Text(
                          'CERTIFICATES',
                          style: TextStyle(
                              fontSize:
                                  (appbarHoverProvider.currentTab == 3) ? 32 : 24,
                              decoration: (appbarHoverProvider.currentTab == 3)
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              color: (appbarHoverProvider.isHover &&
                                      appbarHoverProvider.index == 3 &&
                                      appbarHoverProvider.currentTab != 3)
                                  ? Colors.greenAccent
                                  : (appbarHoverProvider.currentTab == 3)
                                      ? Colors.black
                                      : Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // actions: const [
      //   Padding(
      //     padding: EdgeInsets.only(right: 20, top: 20),
      //     child: Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Chip(
      //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //           backgroundColor: Colors.black,
      //           label: Text(
      //             'Get in touch',
      //             style: TextStyle(color: Colors.white),
      //           )),
      //     ),
      //   )
      // ],
    );
  }
}
