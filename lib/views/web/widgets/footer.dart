import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        color: Colors.black,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width * 0.5 :  MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    'https://www.pngmart.com/files/22/Black-And-White-Instagram-Logo-PNG-File.png',
                    scale: 45,
                  ),
                  Image.network(
                    'https://p.kindpng.com/picc/s/32-326233_linkedin-thompson-electric-company-linkedin-logo-bw-png.png',
                    scale: 10,
                  ),
                  Image.network(
                    'https://www.pngmart.com/files/22/GitHub-PNG-Isolated-Transparent-Image.png',
                    scale: 15,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const Text(
              '© 2023 Built By Sai Kumar Kusangi',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Made with  ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Image.network(
                  'https://em-content.zobj.net/thumbs/160/twitter/322/red-heart_2764-fe0f.png',
                  scale: 8,
                ),
                const Text(
                  ' using ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png?20200223155044',
                  scale: 10,
                  color: Colors.white,
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
