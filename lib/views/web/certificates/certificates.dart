import 'package:flutter/material.dart';
import 'package:portfolio/controllers/certificates_controller.dart';
import 'package:portfolio/views/web/widgets/certificate_preview.dart';
import 'package:provider/provider.dart';

import '../../../controllers/projects_controller.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class WebCertificates extends StatelessWidget {
  const WebCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    final certificatesProvider = Provider.of<CertificatesController>(context);
    return Scaffold(
        body: CustomScrollView(slivers: [
      const CustomAppBar(),
      SliverGrid.builder(
        itemCount: certificatesProvider.certificates.length,
          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2
           ),
          itemBuilder: (context, index) {
            return certificatesProvider.isLoading ? 

             SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child:Image.asset('assets/images/image_loader.png')
            ) :
            
             SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>CertificatePreview(src:  certificatesProvider.certificates[index].certificates))),
                  child: FadeInImage.assetNetwork(
  placeholder: 'assets/images/image_loader.png',
  image:  certificatesProvider.certificates[index].certificates,fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          }),
          
             const  Footer()
    ]));
  }
}
