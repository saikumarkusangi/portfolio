import 'package:portfolio/views/web/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/controllers/appbar_hover_provider.dart';
import 'package:portfolio/controllers/image_hover.dart';
import 'package:portfolio/controllers/projects_controller.dart';
import 'package:portfolio/views/web/widgets/my_works.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;
import '../details_page.dart';
import '../widgets/app_bar.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});
   static const String routeName = '/';
  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
   
    final imageHover = Provider.of<ImageHover>(context);
    final projectsProvider = Provider.of<ProjectController>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
         const CustomAppBar(),
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/background.gif',
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
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: MediaQuery.of(context).size.height / 4,
                      crossAxisCount: 1,
                      childAspectRatio: 4),
                  itemCount: projectsProvider.projects.length,
                  itemBuilder: (context, index) {
                    final tags =
                        projectsProvider.projects[index].tags.split(',');
                    if (index % 2 == 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            // height: MediaQuery.of(context).size.width / 3,
                            child: GestureDetector(
                              onTap: () {
                                html.window.history.pushState(null, 'MyWorks',
                                    '/MyWorks/${projectsProvider.projects[index].projectName.replaceAll(RegExp(' '), '')}');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                              images: projectsProvider
                                                  .projects[index].images,
                                            )));
                              },
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
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    projectsProvider
                                        .projects[index].projectName,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontSize: 42,
                                        fontWeight: FontWeight.w600),
                                  ),
                                const  SizedBox(height: 20),
                                  SizedBox(
                                    child: Text(
                                      projectsProvider
                                          .projects[index].description,
                                      style:const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      maxLines: 3,
                                    ),
                                  ),
                               const   SizedBox(height: 20),
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
                                                  padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                  child: Chip(
                                                      labelStyle: const TextStyle(
                                                          fontSize: 18),
                                                      padding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 10,
                                                              vertical: 10),
                                                      label: Text(
                                                          tags[tagindex])),
                                                );
                                              });
                                        }),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: InkWell(
                                      onTap: () async {
                                        await launchUrl(Uri.parse(
                                            projectsProvider
                                                .projects[index].githubLink));
                                      },
                                      child: Chip(
                                          backgroundColor: Colors.black54,
                                          labelStyle:
                                             const TextStyle(color: Colors.white),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          label: SizedBox(
                                            width: 150,
                                            height: 40,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                      width: 40,
                                                      child: Image.network(
                                                          'https://cdn-icons-png.flaticon.com/512/25/25231.png')),
                                                 const Text('GitHub Link'),
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
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    projectsProvider
                                        .projects[index].projectName,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 42,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    child: Text(
                                      projectsProvider
                                          .projects[index].description,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
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
                                                  padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                  child: Chip(
                                                      labelStyle: const TextStyle(
                                                          fontSize: 18),
                                                      padding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 10,
                                                              vertical: 10),
                                                      label: Text(
                                                          tags[tagindex])),
                                                );
                                              });
                                        }),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: InkWell(
                                      onTap: () async {
                                        await launchUrl(Uri.parse(
                                            projectsProvider
                                                .projects[index].githubLink));
                                      },
                                      child: Chip(
                                          backgroundColor: Colors.black54,
                                          labelStyle:
                                              const TextStyle(color: Colors.white),
                                          padding:const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          label: SizedBox(
                                            width: 150,
                                            height: 40,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                      width: 40,
                                                      child: Image.network(
                                                          'https://cdn-icons-png.flaticon.com/512/25/25231.png')),
                                                const  Text('GitHub Link'),
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
                            width: MediaQuery.of(context).size.width / 3,
                            child: GestureDetector(
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
                                    imageHover.currentTab == index &&
                                            imageHover.isHover == true
                                        ? projectsProvider
                                            .projects[index].banner
                                            .split(',')[1]
                                        : projectsProvider
                                            .projects[index].banner
                                            .split(',')[0],
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
               const  Footer()
        ],
      ),
    );
  }
}
