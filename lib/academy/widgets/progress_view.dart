import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatefulWidget {
 const  ProgressView({super.key});

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {

final bool isFilled=true;
int selection=0;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Timeline
            // Container(
            //   height: 70,
            //   padding: EdgeInsets.all(0),
            //   width: double.infinity,
            //   child: Row(
            //     children: [
            //       customContainer(bRadius:1,child: _namedColumn(data[0].toString(),false)),
            //       Expanded(
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //             shrinkWrap: true,
            //             physics: NeverScrollableScrollPhysics(),
            //             itemCount: 4,
            //             itemBuilder: (context,index){
            //           return Container(
            //             margin: EdgeInsets.all(2),
            //             child: Row(
            //               children: [
            //                 customContainer(bRadius: 1,width: width*0.075,height:3 ,containerColor: Colors.black),
            //                 customContainer(
            //                   bRadius: 1,
            //                   containerColor: Colors.white,
            //                   child: _namedColumn(
            //                     data[index+1].toString(),true,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }),
            //       ),
            //       // _namedColumn(),
            //       // customContainer(bRadius: 1,width: 50,height:3 ,containerColor: Colors.black),
            //       // _namedColumn()
            //     ],
            //   ),
            // ),
            //Timeline
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       height: 59,
            //       child:
            //         ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //             itemCount: 5,
            //             itemBuilder: (context,index){
            //           return Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.values[1],
            //             children: [
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Icon(Icons.circle,color: Colors.blue,),
            //                   Expanded(child: Container(padding: EdgeInsets.all(2), child: Text(data[index],maxLines: 2,style: TextStyle(fontSize: 12),)))
            //                 ],
            //               ),
            //               index==4?Container():SizedBox(height: 4,width: width*0.09,child: customContainer(bRadius: 12,containerColor: Colors.blue),)
            //             ],
            //           );
            //         })
            //
            //     ),
            //   ],
            // ),
            //Video Watching
            Container(
              margin: EdgeInsets.all(2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customTimeline('ID',(){
                    setState(() {
                      selection=0;
                    });
                  },selection==0?true:false,

                  ),
                  _dash(width),
                  _customTimeline('Certificate',(){
                    setState(() {
                      selection=1;
                    });
                  },selection==1?true:false),
                  _dash(width),
                  _customTimeline('Appointment\n Letter',(){
                    setState(() {
                      selection=2;
                    });
                  },selection==2?true:false,
                  ),
                  _dash(width),
                  _customTimeline('Agreement',(){
                    setState(() {
                      selection=3;
                    });
                  },selection==3?true:false),
                  _dash(width),
                  _customTimeline('Bill',(){
                    setState(() {
                      selection=4;
                    });
                  },selection==4?true:false),
               ],
              ),
            ),
           selection==0? Column(
              children: [
                customContainer(
                  margin: 10,
                  vPadding: 15,
                  hPadding: 15 ,
                  bRadius: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ID',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      customContainer(
                        containerColor: Colors.green,
                        bRadius: 15,
                        vPadding: 5,
                        hPadding: 15 ,
                        child: Text('Download',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                      )
                    ],
                  ),
                ),

                customContainer(
                    margin: 10,
                    bRadius: 10,
                    vPadding: 5,
                    hPadding: 10,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start watching...',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        customContainer(bRadius: 12,
                            containerColor: Colors.grey,
                            height: height*0.25,width: double.infinity),
                        Text('Business Analysis & Process Management',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                      ],
                    )
                ),
                customContainer(
                  bRadius: 10,
                  vPadding: 10,
                  hPadding: 10,
                  width: width*0.6 ,containerColor: Color.fromRGBO(0, 63, 136, 1),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(CupertinoIcons.lock,color: Colors.white,size: 18,),
                      Text('Download Certificate',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                //Appointment


              ],
            ):Container(),
            selection==2? Column(
              children: [
                customContainer(
                    margin: 10,
                    bRadius: 10,
                    vPadding: 15,
                    hPadding: 10,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Appointment Letter  ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                Icon(CupertinoIcons.lock,size: 18,),
                              ],
                            ),
                            customContainer(
                              containerColor: Colors.green,
                              bRadius: 15,
                              vPadding: 5,
                              hPadding: 15 ,
                              child: Text('Download',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                          ],
                        ),

                      ],
                    )
                ),
                Container(
                  height: height*0.27,
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context,index){
                        int ind=index+1;
                        return customContainer(
                          hPadding: 5,
                          vPadding: 8,
                          bRadius: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Tutorial $ind'),
                              Row(
                                children: [
                                  Text('5 min'),
                                  Icon(Icons.check_circle_outline,color: Colors.green,),
                                ],
                              ),
                              customContainer(bRadius: 8,
                                  onTap: (){},
                                  hPadding: 8,
                                  containerColor:Colors.green,child: Text('Complete',style: TextStyle(color: Colors.white),))
                            ],
                          ),
                        );
                      }),
                ),

                Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Complete all the videos and live webinars to unlock your documents',textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontSize: 16),)),
                    customContainer(
                    margin: 10,
                    bRadius: 10,
                    vPadding: 5,
                    hPadding: 10,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Continue where you left..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        customContainer(bRadius: 12,
                            containerColor: Colors.grey,
                            height: height*0.25,width: double.infinity),
                        Text('Business Analysis & Process Management',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                      ],
                    )
                ),//rgba(0, 80, 157, 1)
                customContainer(
                  bRadius: 10,
                  vPadding: 10,
                  hPadding: 10,
                  width: width*0.6 ,
                  containerColor: Color.fromRGBO(0, 80, 157, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.lock,color: Colors.white,),
                      Text('Download Certificate',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
}

Widget customContainer({
  double? height,
  double? width,
  Color? containerColor,
  Color? borderColor,
  required double  bRadius,
  double? margin,
  double? hPadding,
  double? vPadding,
  String? assetsImg,
  String? networkImg,
  Color? shadowColor,
  double? shadowBlurRadius,
  Offset? shadowOffset,
  Gradient? gradient,
  Widget? child,
  VoidCallback? onTap,
}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(margin ?? 0.0),
      padding: EdgeInsets.symmetric(horizontal: hPadding??0.0, vertical: vPadding ??0.0),
      decoration: BoxDecoration(
        color: gradient == null ? containerColor ?? Colors.white : null,
        gradient: gradient,
        border: Border.all(color: borderColor?? Colors.grey.shade100, width: 0.5),
        borderRadius: BorderRadius.circular(bRadius),
        image: (networkImg != null)
            ? DecorationImage(image: NetworkImage(networkImg), fit: BoxFit.cover)
            : (assetsImg != null)
            ? DecorationImage(image: AssetImage(assetsImg), fit: BoxFit.cover)
            : null,

        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.grey.shade100,
            blurRadius: shadowBlurRadius ?? 1.0,
            offset: shadowOffset ?? const Offset(0.5, 0.5),
          ),
        ],
      ),

      child: child,
    ),
  );
}

Widget _customTimeline(String text,  VoidCallback onTap,bool isSelected){
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        !isSelected?Icon(Icons.circle_outlined,size: 30,color: Color.fromRGBO(0, 63, 136, 1),):Icon((Icons.circle),size: 30,color: Color.fromRGBO(0, 63, 136, 1),),
        Text(text,style: TextStyle(
          fontSize: 12,
        ),),
      ],
    ),
  );
}
Widget _dash(double width){
  return customContainer(bRadius: 1,height: 4,width:width*0.08,containerColor:  Color.fromRGBO(0, 63, 136, 1));

}