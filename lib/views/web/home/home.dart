
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/controllers/appbar_hover_provider.dart';
import 'package:portfolio/controllers/image_hover.dart';
import 'package:portfolio/controllers/projects_controller.dart';
import 'package:portfolio/views/web/widgets/my_works.dart';
import 'package:provider/provider.dart';

import '../details_page.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    final appbarHoverProvider = Provider.of<AppBarHoverController>(context);
    final imageHover = Provider.of<ImageHover>(context);
    final projectsProvider = Provider.of<ProjectController>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            leadingWidth: 100,
            expandedHeight: 100,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
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
                          },
                          child: Text(
                            'HOME',
                            style: TextStyle(
                                decoration:
                                    (appbarHoverProvider.currentTab == 0)
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                fontSize: (appbarHoverProvider.currentTab == 0)
                                    ? 24
                                    : 18,
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
                                decoration:
                                    (appbarHoverProvider.currentTab == 1)
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                fontSize: (appbarHoverProvider.currentTab == 1)
                                    ? 24
                                    : 18,
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
                          },
                          child: Text(
                            'RESUME',
                            style: TextStyle(
                                decoration:
                                    (appbarHoverProvider.currentTab == 2)
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                fontSize: (appbarHoverProvider.currentTab == 2)
                                    ? 24
                                    : 18,
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
                          },
                          child: Text(
                            'CERTIFICATES',
                            style: TextStyle(
                                fontSize: (appbarHoverProvider.currentTab == 3)
                                    ? 24
                                    : 18,
                                decoration:
                                    (appbarHoverProvider.currentTab == 3)
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      backgroundColor: Colors.black,
                      label: Text(
                        'Get in touch',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'My Works',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 8),
                    child: const Divider(
                      color: Colors.black26,
                      thickness: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          (projectsProvider.isLoading)
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: MediaQuery.of(context).size.height / 4,
                      crossAxisCount: 1,
                      childAspectRatio: 4),
                  itemCount: projectsProvider.projects.length,
                  itemBuilder: (context, index) {
                  final tags =   projectsProvider.projects[index].tags.split(',');
                    if (index % 2 == 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.width / 1.5,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            images: projectsProvider
                                                .projects[index].images,
                                          ))),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (event) {
                                  imageHover.hover(index: index, isHover: true);
                                  imageHover.setCurrentTab(index: index);
                                },
                                onExit: (event) {
                                  imageHover.hover(
                                      index: index, isHover: false);
                                },
                                child: Image.network(
                                    projectsProvider.projects[index].banner,
                                    fit: imageHover.currentTab == index &&
                                            imageHover.isHover == true
                                        ? BoxFit.cover
                                        : BoxFit.contain),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    projectsProvider.projects[index].projectName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 42,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    child: Text(
                                      projectsProvider
                                          .projects[index].description,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                 
                                    child: ListView.builder(
                                      
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: tags.length,
                                      itemBuilder: (contex, tagindex) {
                                      return StreamBuilder<Object>(
                                        stream: null,
                                        builder: (context, snapshot) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Chip(
                                              labelStyle: TextStyle(fontSize: 18),
                                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                              label: Text(tags[tagindex])),
                                          );
                                        }
                                      );
                                    }),
                                  ),
                                
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    
                                    child: InkWell(
                                      onTap: () async {
                                          await launchUrl(Uri.parse(projectsProvider.projects[index].githubLink));
                                  
                                      },
                                      child: Chip(
                                        backgroundColor: Colors.black54,
                                        labelStyle: TextStyle(color: Colors.white),
                                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                        label: SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: Center(
                                            child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(width: 40,child: Image.network('https://cdn-icons-png.flaticon.com/512/25/25231.png')),
                                                Text('GitHub Link'),
                                              ],
                                            ),
                                          ),
                                        )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    projectsProvider.projects[index].projectName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 42,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    child: Text(
                                      projectsProvider
                                          .projects[index].description,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      maxLines: 3,
                                    ),
                                  ),
                                   SizedBox(height: 20),
                                  Expanded(
                                 
                                    child: ListView.builder(
                                      
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: tags.length,
                                      itemBuilder: (contex, tagindex) {
                                      return StreamBuilder<Object>(
                                        stream: null,
                                        builder: (context, snapshot) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Chip(
                                              labelStyle: TextStyle(fontSize: 18),
                                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                              label: Text(tags[tagindex])),
                                          );
                                        }
                                      );
                                    }),
                                  ),
                                  
                                   MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: InkWell(
                                      onTap: () async {
                                          await launchUrl(Uri.parse(projectsProvider.projects[index].githubLink));
                                  
                                      },
                                      child: Chip(
                                        backgroundColor: Colors.black54,
                                        labelStyle: TextStyle(color: Colors.white),
                                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                        label: SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                
                                                SizedBox(width: 40,child: Image.network('https://cdn-icons-png.flaticon.com/512/25/25231.png')),
                                                Text('GitHub Link'),
                                              ],
                                            ),
                                          ),
                                        )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            images: projectsProvider
                                                .projects[index].images,
                                          ))),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (event) {
                                  imageHover.hover(index: index, isHover: true);
                                  imageHover.setCurrentTab(index: index);
                                },
                                onExit: (event) {
                                  imageHover.hover(
                                      index: index, isHover: false);
                                },
                                child: Image.network(
                                    projectsProvider.projects[index].banner,
                                    fit: imageHover.currentTab == index &&
                                            imageHover.isHover == true
                                        ? BoxFit.cover
                                        : BoxFit.contain),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  })
        ],
      ),
    );
  }
}
