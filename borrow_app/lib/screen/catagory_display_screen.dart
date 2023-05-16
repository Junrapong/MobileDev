import 'package:borrow_app/data/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CategoryDisplayScreeen extends StatefulWidget {
  const CategoryDisplayScreeen({super.key});

  @override
  State<CategoryDisplayScreeen> createState() => _CategoryDisplayScreeenState();
}

class _CategoryDisplayScreeenState extends State<CategoryDisplayScreeen> {
  @override
  Widget build(BuildContext context) {
    return const category();
  }
}

class category extends StatelessWidget {
  const category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 170,
                  margin: const EdgeInsets.only(
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            categories[index].thumbnailImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.transparent
                    ], begin: Alignment.bottomCenter, end: Alignment.center),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              categories[index].categoryName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text('${categories[index].productCont} products')
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
