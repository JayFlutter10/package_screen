import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../academy/view/certificate_view.dart';
import '../widgets/data_franchise.dart';

class SelectedPackageScreen extends StatefulWidget {
  const SelectedPackageScreen({super.key});

  @override
  State<SelectedPackageScreen> createState() => _SelectedPackageScreenState();
}

class _SelectedPackageScreenState extends State<SelectedPackageScreen> {
  int selection=0;
  int _currentIndex = 0;
  int selectedButton=0;
  DataFranchise dataFranchise=DataFranchise();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/package/bgImg/bkgImg.jpg',),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                /// Franchise Options 5X and KYC
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        ///5X and KYC buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            customContainer(bRadius: 10,
                                margin: width*0.005,
                                vPadding: 5,
                                hPadding: width*0.06,
                                borderColor: Color.fromRGBO(0, 80, 157, 1),
                                containerColor: selectedButton==0?Color.fromRGBO(0, 80, 157, 1): Colors.white,
                                child: Text('5X Guarantee',style: TextStyle(color:selectedButton==0? Colors.white:Color.fromRGBO(0, 80, 157, 1)),),
                                onTap: (){
                                  setState(() {
                                    selectedButton=0;
                                  });
                                }
                            ),
                            SizedBox(width: width*0.22,),
                            customContainer(bRadius: width*0.02,
                                containerColor: selectedButton==1?Color.fromRGBO(0, 80, 157, 1): Colors.white,
                                borderColor: Color.fromRGBO(0, 80, 157, 1),
                                margin: 10,
                                vPadding: 5,
                                hPadding: width*0.12,
                                child: Text('KYC',style: TextStyle(color:selectedButton==1? Colors.white:Color.fromRGBO(0, 80, 157, 1),),),
                                onTap: (){
                                  setState(() {
                                    selectedButton=1;
                                  });
                                }
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.012,),

                        ///Logic Based on Carousel Sliding
                        selection!=2? customContainer(bRadius: 10,
                            vPadding: height*0.01,
                            margin: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:selection==0? [
                                _circleAv(radiusWidth: width*2, text: 'Franchise\n',path: 'assets/package/img/crown.png',onTap: (){}),
                                _dash(width: width*0.25),
                                _circleAv(radiusWidth: width*2, text: 'Super\nFranchise',path: 'assets/package/img/super_crown.png',onTap: (){}),
                              ]:[
                                _circleAv(radiusWidth: width*2, text: 'Super\nFranchise\n',path: 'assets/package/img/super_crown.png',onTap: (){}),
                                _dash(width: width*0.25),
                                _circleAv(radiusWidth: width*2, text: 'Premium\nFranchise',path: 'assets/package/img/premium_crown.png',onTap: (){}),
                              ]
                            ),
                        ):Container(),
                      ],
                    ),

                    ///Image Centered on Stack
                    _imageForCenterStacked(context:context,selection: selection),
        
                  ],
                ),
        
                ///Journey Starts
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Your Earning Journey Starts Here',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                ),
        
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
                    height: height * 0.42,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.75,
                    enlargeFactor: 0.09,
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

                ///Franchise
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dataFranchise.franchiseName[selection].toString(),style: TextStyle(fontSize: 18,color: Color.fromRGBO(0, 80, 157, 1),fontWeight: FontWeight.bold),),
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
                  ),
                ),

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
                                  SizedBox(width: width*0.032),
                                  Expanded(
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(vertical:height*0.005),
                                        child: RichText(
                                          textScaler: TextScaler.linear(1.01),
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${currentData[index]['subtitle'][i]['data']
                                                    .toString()
                                                    .split(' ')
                                                    .take(2)
                                                    .join(' ')} ', // Extract first two words and add space
                                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: ' ', // Add explicit space between spans
                                                style: TextStyle(color: Colors.black),
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
                    itemBuilder: (context, index) {
                      // Convert the data string into a list by splitting at periods
                      List<String> bulletPoints = dataFranchise.learnMore[index]['data']
                          .toString()
                          .split('.')
                          .where((point) => point.trim().isNotEmpty)
                          .toList();
                      return customContainer(
                        bRadius: 15,
                        margin: 10,
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.zero
                          ),
                          collapsedShape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.zero
                          ),
                          childrenPadding: EdgeInsets.only(left: 10),
                          title: Text(
                            dataFranchise.learnMore[index]['title'].toString(),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: bulletPoints.map((point) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "• ",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Expanded(
                                        child: Text(
                                          point.trim(),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                )).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///Custom Carousel Widgets
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
          margin: width * 0.035,
          hPadding: width*0.019,
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
                  style: TextStyle(fontSize: isSelected?16:14, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left:width*0.002,
          top: height*0.01,
          child: _imageStacked(context :context, selection: selection),
        ),
        Padding(
          padding: EdgeInsets.all(height*0.025),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              headline,
              style: TextStyle(
                fontSize: 16,
                color: isSelected?Colors.white:Color.fromRGBO(0, 80, 167, 1),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}
///Dash
Widget _dash({required double width}){
  return Row(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.circle,color: Color.fromRGBO(0, 80, 157,1),size: width*0.32,),
          Icon(Icons.check_circle_outline,color: Colors.white,)
        ],
      ),
      customContainer(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 80, 157,1),
          Colors.white,
        ]),
        bRadius: width*0.05,
        borderColor: Color.fromRGBO(0, 80, 157,1),
        width: width*1.45,
        height: 8
    ),
      Icon(Icons.circle,color: Color.fromRGBO(0, 80, 157,1),size: width*0.32),
    ],
  );
}
///Circle Avatar with crown
Widget _circleAv({required double radiusWidth,required String text,required String path,VoidCallback? onTap,}){
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(radius: radiusWidth*0.04,backgroundColor: Colors.brown.shade50,backgroundImage: AssetImage(path),),
        Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
      ],
    ),
  );
}
///Custom Carousel Data
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
///Stacked Crowned Images
Widget _imageStacked({required BuildContext context,required int selection}){
  final double height=MediaQuery.of(context).size.height;
  return Stack(
    alignment: Alignment.center,
    children: [
      selection==0?Image.asset('assets/package/img/bg.png',scale: 1.18,):selection==1?Image.asset('assets/package/img/superBG.png',scale: 1.18,):Image.asset('assets/package/img/premiumBG.png',scale: 0.71,),
      Positioned(
          right: 0,bottom: height*0.018,
          child: Image.asset('assets/package/img/star.png',scale: 1,)),
      Positioned(
        top: height*0.005,
        child: selection==0?Image.asset('assets/package/img/crown.png',scale: height*0.0012,):selection==1?Image.asset('assets/package/img/super_crown.png',scale: height*0.0012,):Image.asset('assets/package/img/premium_crown.png',scale: height*0.0012,),),
      Positioned(
          left: 0,top: 0,
          child: Image.asset('assets/package/img/star.png',scale: 1,)),
    ],
  );
}
///Franchise Benefits Icons
Widget _columnBenefits({required IconData icon,required String text,}){
  return Column(
    children: [
      customContainer(containerColor:Color.fromRGBO(0, 80, 157, 0.79),shadowColor: Colors.transparent,borderColor: Colors.transparent,bRadius: 15, vPadding: 10,hPadding: 10,child: Icon(icon,size: 35,color: Colors.white,),),
      Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Color.fromRGBO(0, 80, 157, 0.79),fontWeight: FontWeight.w700),)
    ],
  );
}
///Centered Crown Image
Widget _imageForCenterStacked({required BuildContext context, required int selection}){
  final double height=MediaQuery.of(context).size.height;
  return Stack(
    alignment: Alignment.center,
    children: [
      selection==0?Image.asset('assets/package/img/bg.png',scale: 1.0,):selection==1?Image.asset('assets/package/img/superBG.png',scale: 0.95,):Image.asset('assets/package/img/premiumBG.png',scale: 0.57,),
      Positioned(
          top: height*0.005,
          child: selection==0?Image.asset('assets/package/img/crown.png',scale: height*0.0012,):selection==1?Image.asset('assets/package/img/super_crown.png',scale: height*0.0012,):Image.asset('assets/package/img/premium_crown.png',scale: height*0.0012,),),
      Positioned(
          right: 0,bottom: height*0.018,
          child: Image.asset('assets/package/img/star.png',scale: height*0.0011,),),
      Positioned(
          left: 0,top: 0,
          child: Image.asset('assets/package/img/star.png',scale: height*0.0011,),),
      Positioned(
          bottom: height*0.027,
          child: Text('Franchise',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: height*0.015),),
      )
    ],
  );
}