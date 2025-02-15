import 'package:flutter/material.dart';
import '../view/certificate_view.dart';

class VideoDetails extends StatelessWidget {
  final int videoNumber;
  const VideoDetails({super.key, required this.videoNumber});
final bool isCompleted=false;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white
          ),
                height: height*0.25,width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tutorial $videoNumber',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              isCompleted?Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded,color: Colors.green,size: 14,),
                  Text('Completed',style: TextStyle(fontSize: 14,decoration: TextDecoration.underline,)),
                ],):
              Row(
                children: [
                  Icon(Icons.play_arrow_outlined,color: Colors.red,size: 18,),
                  Text('Ongoing',style: TextStyle(fontSize: 14,decoration: TextDecoration.underline,color: Colors.red)),
                ],),
            ],
          ),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit',maxLines: 2,overflow: TextOverflow.ellipsis,),
          SizedBox(
            height: height*0.05,
            ),
            Text('Next in Line',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            _stackCustom()
          ],
        ),
      ),
    );
  }
}
Widget _stackCustom(){
  return Stack(
    fit: StackFit.passthrough,
    children: [
      Center(
        child: Expanded(
          child: customContainer(
            margin: 15,
            containerColor: Colors.grey[200],
            hPadding:10,
            vPadding: 12,
            bRadius: 10,

            child: Row(
              spacing: 15,
              children: [
                customContainer(bRadius: 5,
                    child: SizedBox(
                      height: 130,width: 60,
                    )
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:80.0),
                      child: RichText(
                          text: TextSpan(
                              text: 'Simplify Legal Services',
                              style: TextStyle(color: Colors.blue[200],fontSize: 16),
                              children: [
                                TextSpan(
                                    style: TextStyle(color: Colors.black,fontSize: 16),
                                    text:'\nReferrals and Get Paid with BizBooster!'
                                  )
                                ]
                             ),
                          ),
                       )
                   )
              ],
            ),
          ),
        ),
      ),//customContainer
      customContainer(
        containerColor: Colors.grey[200],
        hPadding:15,
        vPadding: 18,
        bRadius: 10,
        child: Row(
          spacing: 15,
          children: [
            customContainer(bRadius: 5,
                child: SizedBox(
                  height: 60,width: 60,
                )
            ),
            Expanded(child: RichText(text: TextSpan(
                text: 'Branding Made Profitable:',
                style: TextStyle(color: Colors.blue,fontSize: 16),
                children: [
                  TextSpan(
                      style: TextStyle(color: Colors.black,fontSize: 16),
                      text:'How to Share Marketing Leads on BizBooster'
                    )
                  ]
               ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}