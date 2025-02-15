import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/widgets/video_details.dart';

import '../view/certificate_view.dart';

class ModuleData extends StatelessWidget {
  final String headline;
 const  ModuleData({super.key, required this.headline});

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Module'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
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
              Row(
                children: [
                  customContainer(

                      margin: 8,
                      bRadius: 25,
                      height: 120,width: 120
                  ),
                  Expanded(
                    child: customContainer(

                      vPadding: 10,
                      hPadding: 15,
                      height: 120,
                      bRadius: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(headline,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',style: TextStyle(fontSize: 14),),
                        ],
                      )
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height*0.9,
                child: Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:5,
                      itemBuilder: (context,index){
                        int pi=index+1;
                        return InkWell(
                          onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoDetails(videoNumber: pi,),
                               ),
                              );
                          },
                          child: _videos(pi.toString(),
                              pi==5?
                              false:true,
                          ),
                        );
                      }
                   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _videos(String no,bool isCompleted){
  return Container(
    padding: EdgeInsets.only(top: 10,bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customContainer(bRadius: 10, height: 95, width: 160),
            SizedBox(width: 15,height: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tutorial $no',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
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