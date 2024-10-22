import 'package:flutter/material.dart';
import 'package:one_piece_list/src/pages/details_page.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width - 50;
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Covers",
            style: titleStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              coverBlocks("p1.jpg", "title: ", "2018"),
              SizedBox(
                width: screenWidth * .033,
              ),
              coverBlocks("p2.jpg", "title: ", "2022"),
              SizedBox(
                width: screenWidth * .033,
              ),
              coverBlocks("p3.jpg", "title: ", "2023"),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 20,
          ),
          characterBlocks("Brook", 0xff4913C4, "o1"),
          characterBlocks("Luffy", 0xffF82A2D, "o2"),
          characterBlocks("Portgas D. Ace", 0xffFFCB28, "o3"),
          characterBlocks("Boa Hancock", 0xffFE4649, "o4"),
          characterBlocks("Boa Hancock", 0xffDF1C6A, "o5"),
          characterBlocks("Roronoa Zoro", 0xff21E295, "o6"),
        ],
      ),
    );
  }

  Widget characterBlocks(String name, int color, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detail(
              color: color,
              image: "assets/$image.png",
              name: name,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(66, 49, 49, 49)),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                        color: Color(color),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Hero(
                    tag: color,
                    child: Image.asset("assets/$image.png"),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }

  Widget coverBlocks(String image, String title, String subtitle) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            width: screenWidth * .31,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
