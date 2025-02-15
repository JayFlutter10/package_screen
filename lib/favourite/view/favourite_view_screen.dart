import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/view/certificate_view.dart';

class FavouriteViewScreen extends StatefulWidget {
  const FavouriteViewScreen({super.key});

  @override
  State<FavouriteViewScreen> createState() => _FavouriteViewScreenState();
}

class _FavouriteViewScreenState extends State<FavouriteViewScreen> {
  // Sample data structure for favorite items
  List<dynamic> favorites = [
    {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sit amet, adipiscing elit.',
      'points': 'Earn up to 4000'
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sit amet, adipiscing elit.',
      'points': 'Earn up to 4000'
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sit amet, adipiscing elit.',
      'points': 'Earn up to 4000'
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sit amet, adipiscing elit.',
      'points': 'Earn up to 4000'
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sit amet, adipiscing elit.',
      'points': 'Earn up to 4000'
    }
  ];

  void removeItem(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Favorite Services ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: height*0.03,
            ),
            favorites.isNotEmpty?Expanded(
                child: ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      return customContainer(
                        bRadius: 12,
                        margin: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                customContainer(
                                  borderColor: Colors.transparent,
                                    assetsImg: 'assets/img/img.png',
                                    bRadius: 10,
                                    height: height*0.1,
                                    width: width * 0.28,
                                    margin: 0,
                                    containerColor: Colors.transparent
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(favorites[index]['title']!),
                                    subtitle: Text(favorites[index]['subtitle']!),
                                    trailing: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) => AlertDialog(
                                                backgroundColor: Colors.white,
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      OutlinedButton(
                                                          style: OutlinedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                                side: BorderSide(color: Color.fromRGBO(0, 80, 157, 1))
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text(
                                                              'No',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Color.fromRGBO(0, 80, 157, 1),
                                                                  fontWeight: FontWeight.bold
                                                              )
                                                          )
                                                      ),
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              elevation: 0,
                                                              backgroundColor: Color.fromRGBO(0, 80, 157, 1)
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            removeItem(index);
                                                            showDialog(
                                                                context: context,
                                                                builder: (context) => AlertDialog(
                                                                  backgroundColor: Colors.white,
                                                                  titlePadding: EdgeInsets.all(20),
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                      horizontal: 25,
                                                                      vertical: 60
                                                                  ),
                                                                  content: Text(
                                                                    'This Service is removed from your favorites',
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  contentTextStyle: TextStyle(
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                  elevation: 0,
                                                                )
                                                            );
                                                          },
                                                          child: Text(
                                                            ' Yes ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          )
                                                      )
                                                    ],
                                                  )
                                                ],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                ),
                                                content: Text("Remove this service from your favorites"),
                                                contentTextStyle: TextStyle(fontSize: 14, color: Colors.black),
                                                title: Center(child: Text('Are you Sure')),
                                                titleTextStyle: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(0, 80, 157, 1)
                                                ),
                                              )
                                          );
                                        },
                                        child: Icon(
                                          CupertinoIcons.suit_heart_fill,
                                          size: height*0.026,
                                          color: Color.fromRGBO(0, 80, 157, 1),
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8, bottom: 8),
                              child: Text(
                                favorites[index]['points']!,
                                style: TextStyle(color: Color.fromRGBO(0, 80, 157, 1)),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                )
            ):Center(child: Text('No Favourites Yet'))
          ],
        ),
      ),
    );
  }
}