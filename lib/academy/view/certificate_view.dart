import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/widgets/progress_view.dart';

class CertificateView extends StatefulWidget {
  const CertificateView({super.key});

  @override
  State<CertificateView> createState() => _CertificateViewState();
}

class _CertificateViewState extends State<CertificateView> {
  int _selectedIndexTwo=0;


  final List<dynamic> tabData=[
    'About','Outcomes','Details','Reviews'
  ];

  final List<dynamic> details=[
    'Analyze business processes and find solutions to existing business problems.Define your business processes, their objectives and how they flow within the organizational context.Evaluate the current business from a process view, break down the problems, and find an applicable business solution.'
    ,'Receive training from industry experts.Gain hands-on experience solving real-world job tasks.Build confidence using the latest tools and technologies\n\n\n'
    ,'This is a guided project for both beginners and professionals managing small to medium enterprises or working in the fields of business analysis & business process management. It provides you with the initial know-how of analyzing businesses from a process view which allows you to further develop the skill needed to create solutions to your current business problems..By the end of this project, you will be able to: analyze business processes and find solutions to existing business problems; define your business processes, their objectives and how they flow within the organizational context; identify the different process stakeholders and their roles in your business processes; and evaluate the current business from a process view, break down the problems, and find an applicable business solution.'
    ,'Reviews'
  ];

  final List<dynamic> number=[
    '65.17','28.2','06.8','01.9','03.8'
  ];


  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Certification'),centerTitle: true,),
      body:
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,),
                hintText: 'Search by name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          SizedBox(height: height*0.02,),
          ///Video To be displayed
          customContainer(
              containerColor: Colors.blue.shade200,
              bRadius: 12,
              height: height*0.25,width: double.infinity),
              SizedBox(
                height: height*0.01,
              ),
          Text('Business Analysis & Process Management',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          //Text
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white54
            ),
            child: SizedBox(
              height: height*0.06,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabData.length,
                itemBuilder: (context,index){
                  return customContainer(
                    onTap: (){
                      setState(() {
                        _selectedIndexTwo=index;
                      });
                    },
                    bRadius: 7,
                    margin:10,
                    vPadding: 3,
                    hPadding: 5,
                    containerColor:  _selectedIndexTwo==index? Colors.blue:Colors.white,
                    child: Text(tabData[index].toString(),style: TextStyle(fontSize: 16,color
                        :  _selectedIndexTwo==index?Colors.white:Colors.black,fontWeight: FontWeight.bold,),),
                  );
                },
              ),
            ),
          
          ),
          customContainer(bRadius: 1,
            hPadding: 10,
            vPadding: 10,
            child: _selectedIndexTwo==3?
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reviews',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Icon(Icons.star_border_sharp,color: Colors.blue,size: 20,),
                          Text('4.4',style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),),
                          SizedBox(width: width*0.02,),
                          Text('56,000 Reviews',style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: number.length,
                          itemBuilder: (context,index){
                            int indexNo=6-index;
                            return _rating(width*0.25, width*0.21, (indexNo-1).toString(), number[index].toString()) ;
                          }
                      ),
                    ],
                  ),
                ),
          
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _customerReview();
                    },),
                ),
              ],
            ) :

            ///Details
            ExpansionTile(
              showTrailingIcon: false,
              shape:RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.zero
              ) ,
              collapsedShape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.zero
              ),
              childrenPadding: EdgeInsets.only(left: 0),
              title: Row(
                children: [
                  Expanded(child: Text(details[_selectedIndexTwo],style: TextStyle(fontSize: 14),maxLines: 4,)),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:16.0,),
                  child: Text(details[_selectedIndexTwo]),
                ),
              ],
            ),
            //Text(details[_selectedIndexTwo],style: TextStyle(fontSize: 14),maxLines: 6),
          ),
          Text("Next Videos",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            //Builder for Video Tutorial
            Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:3,
                    itemBuilder: (context,index){
                      int pi=index+1;
                      return _videos(pi.toString());
                    }),
                Center(child: Text("Complete all the videos to unlock your documents ",style: TextStyle(fontSize: 14,decoration: TextDecoration.underline),)),
                Center(child: InkWell(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProgressView()));
                    },
                    child: Text("Your Progress ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),))),
              ],
            ),
          ],
              ),
        ),
      )
    );
  }
}
Widget _rating(double widthB,double widthF,String number,String percentile){
  return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(number,style: TextStyle(fontSize: 12)),

          Expanded(
            child: customContainer(bRadius: 10,height: 10,
                containerColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: customContainer(bRadius:10, containerColor: Colors.blue),
                )
            ),
          ),

          Text('$percentile %',style: TextStyle(fontSize: 12),),
        ],
      ),
    );

}
Widget _customerReview(){
  return customContainer(
      hPadding: 5,
      vPadding: 5,
      bRadius: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text("A"),
          ),
          Expanded(
            child: Column(
              spacing: 2,
              children: [
                Row(
                  spacing: 2,
                  children: [Icon(Icons.star_border),Text("4")],),
                Text('I am excited for completing this course',maxLines: 2,softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      )
  );
}
Widget _videos(String no){
  return Container(
    padding: EdgeInsets.only(top: 10,bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customContainer(containerColor: Colors.blue.shade100,bRadius: 10, height: 95, width: 160),
            SizedBox(width: 15,height: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tutorial $no',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      Row(children: [
                        Icon(Icons.check_circle_outline_rounded,color: Colors.green,size: 14,),
                        Text('Completed',style: TextStyle(fontSize: 14,decoration: TextDecoration.underline,)),
                      ],),

                    ],
                  ),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit',maxLines: 2,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
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