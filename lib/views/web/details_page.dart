import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String images;
  DetailsPage({super.key, required this.images});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    List images = widget.images.split(',').toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid.builder(
            itemCount: images.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2
                ),
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(images[index],fit: BoxFit.cover,));
            },
          )
        ],
      ),
    );
  }
}
