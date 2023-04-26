import 'package:flutter/material.dart';
import 'package:portfolio/views/views.dart';
import 'package:portfolio/views/web/resume/resume.dart';
import 'package:provider/provider.dart';

import '../../../controllers/appbar_hover_provider.dart';
import '../certificates/certificates.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appbarHoverProvider = Provider.of<AppBarHoverController>(context);
    return SliverAppBar(
      snap: true,
      floating: true,
      automaticallyImplyLeading: false,
      leadingWidth: 100,
      expandedHeight: 100,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: SizedBox(
          width: 400,
          height: 400,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://instagram.fhyd11-2.fna.fbcdn.net/v/t51.2885-15/257159501_1564542983923024_3365922118013224602_n.webp?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fhyd11-2.fna.fbcdn.net&_nc_cat=104&_nc_ohc=iMWyn-Qn_54AX8QMQuc&edm=AP_V10EBAAAA&ccb=7-5&oh=00_AfA0dNa6YDvIZIR_og_PW-WA0cGQHF-qxK1G-rzuBFqFtg&oe=6430CEA4&_nc_sid=4f375e',
            ),
            radius: 100,
          ),
        ),
      ),
      centerTitle: true,
      title: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MobileHomePage()));
                    },
                    child: Text(
                      'HOME',
                      style: TextStyle(
                          decoration: (appbarHoverProvider.currentTab == 0)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          fontSize:
                              (appbarHoverProvider.currentTab == 0) ? 24 : 18,
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
                              (appbarHoverProvider.currentTab == 1) ? 24 : 18,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const WebResume()));
                    },
                    child: Text(
                      'RESUME',
                      style: TextStyle(
                          decoration: (appbarHoverProvider.currentTab == 2)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          fontSize:
                              (appbarHoverProvider.currentTab == 2) ? 24 : 18,
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
                              (appbarHoverProvider.currentTab == 3) ? 24 : 18,
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
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20, top: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Chip(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                backgroundColor: Colors.black,
                label: Text(
                  'Get in touch',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        )
      ],
    );
  }
}
