import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.lightBlue,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FancyShimmerImage(
                height: size.height * 0.45,
                width: size.width * 0.45,
                errorWidget: const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                  size: 22,
                ),
                imageUrl:
                    "https://th.bing.com/th/id/R.835983e251d097bc25af6fb3b2155be7?rik=M%2fqrSDtR0zalDw&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fshoe-transparent-background%2fshoe-transparent-background-12.png&ehk=aBRlr3y8H6C6wFWasX1boX9%2batIB911%2b5HM0eh0kwTo%3d&risl=&pid=ImgRaw&r=0",
                boxFit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Nike Shoes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: lightCardColor.withOpacity(0.5),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
