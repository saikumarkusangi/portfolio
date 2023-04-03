import 'package:flutter/material.dart';
import 'package:portfolio/controllers/projects_controller.dart';
import 'package:portfolio/views/web/widgets/app_bar.dart';
import 'package:provider/provider.dart';

import '../../../controllers/certificates_controller.dart';
import '../widgets/footer.dart';

class WebResume extends StatefulWidget {
  const WebResume({super.key});

  @override
  State<WebResume> createState() => _WebResumeState();
}

class _WebResumeState extends State<WebResume> {
  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<CertificatesController>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         const CustomAppBar(),
         resumeProvider.isLoading ? 
         SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),),):
          SliverGrid.builder(
              itemCount: 2,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
               
                    crossAxisCount: 1),
              itemBuilder: (context, index) {
                return Image.network(resumeProvider.certificates[index].resume);
              }),
              const  Footer()
        ],
      ),
    );
  }
}
