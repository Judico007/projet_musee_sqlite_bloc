import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cadre extends StatelessWidget {
  String title;
  int total;
  String image;

  var created;

  Cadre(
      {required this.title,
      required this.total,
      required this.image,
      this.created});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image.toString()), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Inscrit depuis: $created',
                        style: TextStyle(
                            color: Colors.blueGrey[200], fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[500]),
                    child: Text(total.toString()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
