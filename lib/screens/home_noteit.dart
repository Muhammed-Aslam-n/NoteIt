import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:noteit/constants/constants.dart';
import 'package:noteit/widgets/widgets.dart';

class NoteItHome extends StatelessWidget {
  const NoteItHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      endDrawer: const CommonDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 4.2,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Press Again to Close App')),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(25.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                  items: carousalImages
                      .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          e,
                          width: 1000,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              contentBox(
                color: Colors.white,
                heading: 'How we Differ',
                desc: descriptionText,
              ),
              contentBox(
                color: Colors.white,
                heading: 'Vision',
                desc: descriptionText,
              ),
              contentBox(
                color: Colors.white,
                heading: 'Stories',
                desc: descriptionText,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 35),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

