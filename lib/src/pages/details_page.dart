import 'package:flutter/material.dart';
import 'package:one_piece_list/src/animations/fade_animation.dart';
import 'package:one_piece_list/src/widgets/blur_container.dart';
import 'package:one_piece_list/src/widgets/info_title.dart';

class Detail extends StatefulWidget {
  const Detail(
      {super.key,
      required this.color,
      required this.image,
      required this.name});

  final int color;
  final String image;
  final String name;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(widget.color),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    height: screenHeight * .6,
                    child: Hero(
                      tag: widget.color,
                      child: Image.asset(widget.image),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: FadeAnimation(
                    intervalEnd: 0.8,
                    child: BlurContainer(
                      child: Container(
                        width: 160,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.1),
                        ),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: FadeAnimation(
                intervalStart: .3,
                child: Text(
                  "${widget.name} #Character",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(
                intervalStart: .35,
                child: Text(
                  "One Piece",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(
                intervalStart: .4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoTitle(
                      title: "Eiichiro Oda",
                      subtitle: "Creator",
                    ),
                    InfoTitle(
                      title: "Japan",
                      subtitle: "Country",
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            FadeAnimation(
              intervalStart: .5,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(widget.color)),
                  child: const Text(
                    "back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
