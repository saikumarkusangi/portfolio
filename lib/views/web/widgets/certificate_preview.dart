import 'package:flutter/material.dart';
import 'package:portfolio/views/web/widgets/app_bar.dart';

import 'footer.dart';

class CertificatePreview extends StatefulWidget {
  String src;
   CertificatePreview({super.key,required this.src});

  @override
  State<CertificatePreview> createState() => _CertificatePreviewState();
}

class _CertificatePreviewState extends State<CertificatePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
        const  CustomAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
            
              
              child: Image.network(widget.src,)),
          ),
             const  Footer()
        ],
      ),
    );
  }
}
