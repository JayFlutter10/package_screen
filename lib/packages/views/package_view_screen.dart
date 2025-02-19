import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/view/certificate_view.dart';
import 'package:flutter_application_1/packages/widgets/data_franchise.dart';

class PackageViewScreen extends StatefulWidget {
  const PackageViewScreen({super.key});

  @override
  State<PackageViewScreen> createState() => _PackageViewScreenState();
}

class _PackageViewScreenState extends State<PackageViewScreen> {
   /// Track the current index
   int _currentIndex = 0;
   int selection=1;
   DataFranchise dataFranchise=DataFranchise();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/package/bgImg/bkgImg.jpg'),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                /// Franchise Options
                customContainer(bRadius: 15, borderColor: Colors.grey.shade300, containerColor: Colors.white60, vPadding: 10, hPadding: 10, margin: width * 0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _circleAv(height: height, width: width, text: 'Franchise\n',path: 'assets/package/img/crown.png'),
                      _dash(width: width * 0.12),
                      _circleAv(height: height, width: width, text: 'Super\nFranchise',path: 'assets/package/img/super_crown.png'),
                      _dash(width: width * 0.12),
                      _circleAv(height: height, width: width, text: 'Premium\nFranchise',path: 'assets/package/img/premium_crown.png'),
                    ],
                  ),),

                /// Carousel Franchise
                CarouselSlider(
                  items: List.generate(dataFranchise.carouselData.length, (index) {
                    return _customCarouselWidget(
                      selection: selection,
                      description: dataFranchise.carouselData[index]['value'].toString(),
                      headline: dataFranchise.carouselData[index]['key'].toString(),
                      context: context,
                      isSelected: _currentIndex == index, // Pass selection status

                    );
                  }),
                  options: CarouselOptions(
                    height: height * 0.45,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.68,
                    enlargeFactor: 0.199,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                        selection=index;
                      });
                    },
                  ),
                ),

                ///Assured Earning
                customContainer(bRadius: 20, vPadding: 5, hPadding: width*0.08, borderColor: Color.fromRGBO(0, 138, 0, 1),
                  child: Column(
                    children: [
                      Text(
                        'Assured Earnings',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 138, 0, 1)
                        ),
                      ),
                      Text(
                        dataFranchise.assuredLearning[selection],
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 138, 0, 1),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.04,),

                ///Upgrade Now
                _upgradeNow(context: context,onTap: (){}),

                ///Franchise
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Franchise',style: TextStyle(fontSize: 18,color: Color.fromRGBO(0, 80, 157, 1),fontWeight: FontWeight.bold),),
                    Text(' Benefits',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
                customContainer(bRadius: 10, vPadding: 10, margin: 10,borderColor: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _columnBenefits(icon: Icons.wallet, text: '15% Revenue\n Share'),
                      _columnBenefits(icon: Icons.window_rounded, text: 'Standard\nTemplate'),
                      _columnBenefits(icon: Icons.access_time, text: 'Support\nWithin 3-6hrs'),
                    ],
                  ),),

                ///Details
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selection == 0
                      ? dataFranchise.franchise.length
                      : selection == 1
                      ? dataFranchise.superFranchise.length
                      : dataFranchise.premiumFranchise.length,
                  itemBuilder: (context, index) {

                    final currentData = selection == 0
                        ? dataFranchise.franchise
                        : selection == 1
                        ? dataFranchise.superFranchise
                        : dataFranchise.premiumFranchise;

                    return customContainer(
                      bRadius: 15,
                      vPadding: 10,
                      hPadding: 10,
                      margin: 15,
                      containerColor: Color.fromRGBO(249, 249, 249, 1),
                      borderColor: Colors.grey.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentData[index]['title'].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.only(left: width*0.005,top: height*0.005),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: currentData[index]['subtitle'].length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  Icon(
                                    currentData[index]['subtitle'][i]['icon'],
                                    color: Color.fromRGBO(0, 80, 157, 1),
                                  ),
                                  SizedBox(width: 7),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${currentData[index]['subtitle'][i]['data']
                                                .toString()
                                                .split(' ')
                                                .take(2)
                                                .join(' ')} ', // Extract first two words and add space
                                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                          ),

                                          TextSpan(
                                            text: currentData[index]['subtitle'][i]['data']
                                                .toString()
                                                .split(' ')
                                                .skip(1)
                                                .join(' '), // Remaining words
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),

                ///Learn More
                ListView.builder(
                    itemCount: dataFranchise.learnMore.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return customContainer(
                    bRadius: 15,
                    margin: 10,
                    child: ExpansionTile(
                        shape:RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.zero
                        ) ,
                        collapsedShape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.zero
                        ),
                        childrenPadding: EdgeInsets.only(left: 10),
                        title: Text(dataFranchise.learnMore[index]['title'].toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                      children: [
                        Text(dataFranchise.learnMore[index]['data'].toString(),style: TextStyle(fontSize: 14),),
                      ],
                    ),
                  );
                }
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customCarouselWidget({required String headline, required BuildContext context, required bool isSelected,String? description,required int selection}) {
  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;

  return Container(
    margin: EdgeInsets.zero,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        customContainer(
          bRadius: 15,
          containerColor: isSelected ? Color.fromRGBO(0, 80, 157, 1) : Colors.white, // Change color dynamically
          vPadding: isSelected?height * 0.08:height*0.075,
          margin: isSelected?width * 0.035:0.03,
          hPadding: width*0.021,
          width: width * 0.9,
          child: Column(
            children: [
              Text(description!,style: TextStyle(color: Color.fromRGBO(208, 208, 208,1),fontWeight: FontWeight.w800,fontSize: 14),textAlign: TextAlign.center,),
              _rowIconText(text: 'Response within 24hrs.',isSelected: isSelected),
              _rowIconText(text: 'Priority franchise access',isSelected: isSelected),
              _rowIconText(text: 'Standard template',isSelected: isSelected),
              SizedBox(height: height * 0.03),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: isSelected?  Color.fromRGBO(0, 80, 157, 1): Color.fromRGBO(0, 80, 157, 1))
                ),
                child: Text(
                  'Know Benefits',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: width*0.002,
          top: height*0.01,
          child: Row(
            children: [
              _imageStacked( selection: selection, context: context),
              Text(
                headline,
                style: TextStyle(
                  fontSize: 18,
                  color: isSelected?Colors.white:Color.fromRGBO(0, 80, 167, 1),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget _dash({double? width}){
  return customContainer(bRadius: 10,
  containerColor: Colors.black,
    width: width,
    height: 3
  );
}
Widget _circleAv({double? height, double? width,String? text,required String path}){
  return Column(
    children: [
      CircleAvatar(radius: height!*0.04,backgroundColor: Colors.brown.shade50,child: Image.asset(path),),
      Text(text!,style: TextStyle(),textAlign: TextAlign.center,),
    ],
  );
}
Widget _rowIconText({String? text,bool? isSelected}){
  return Row(
    children: [
      Icon(Icons.check_circle,color:isSelected==false?Color.fromRGBO(0, 80, 157, 1):Colors.white,size: 25, ),
      SizedBox(
        width: 5,
      ),
      Expanded(child: Text(text!,style: TextStyle(color: isSelected==false?Color.fromRGBO(0, 80, 157, 1):Colors.white,fontSize: 16),))
    ],
  );
}
Widget _imageStacked({required BuildContext context,required int selection}){
  final double height=MediaQuery.of(context).size.height;
  return Stack(
    alignment: Alignment.center,
    children: [
      selection==0?Image.asset('assets/package/img/bg.png',scale: 1.18,):selection==1?Image.asset('assets/package/img/superBG.png',scale: 1.18,):Image.asset('assets/package/img/premiumBG.png',scale: 0.8,),

selection==0?Image.asset('assets/package/img/crown.png',scale: height*0.0012,):selection==1?Image.asset('assets/package/img/super_crown.png',scale: height*0.0012,):Image.asset('assets/package/img/premium_crown.png',scale: height*0.0012,),
        Positioned(
            right: 0,bottom: height*0.018,
            child: Image.asset('assets/package/img/star.png',scale: 0.6,)),
      Positioned(
          left: 0,top: height*0.001,
          child: Image.asset('assets/package/img/star.png',scale: 0.6,)),
    ],
  );
}
Widget _upgradeNow({required BuildContext context,required VoidCallback onTap}){
  final double height = MediaQuery.of(context).size.height;
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      customContainer(
        borderColor: Colors.grey.shade200,
        vPadding: height*0.04,
          hPadding: 15,
          margin: 18,
          bRadius: 15,child: Column(children: [
        RichText(text: TextSpan(
          text: 'Start Your ',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: 'Franchise ',style: TextStyle(color: Color.fromRGBO(0, 80, 157, 1,))),
            TextSpan(text: 'Journey With Just'),
          ]
        )),
        Text('₹99,999/user',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
      ],)),
      ElevatedButton(onPressed: onTap,style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(0, 80, 157, 1)), child:Text('Upgrade Now',style:const TextStyle(fontSize: 16,color: Colors.white),)),
    ],
  );
}
Widget _columnBenefits({required IconData icon,required String text}){
  return Column(
    children: [
      customContainer(containerColor:Color.fromRGBO(0, 80, 157, 0.79),shadowColor: Colors.transparent,borderColor: Colors.transparent,bRadius: 15, vPadding: 10,hPadding: 10,child: Icon(icon,size: 30,color: Colors.white,),),
      Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Color.fromRGBO(0, 80, 157, 0.79),fontWeight: FontWeight.w700),)
    ],
  );
}