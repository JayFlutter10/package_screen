import 'package:flutter/material.dart';
import 'certificate_view.dart';

class WebinarView extends StatelessWidget {
  const WebinarView({super.key});
final String link='https://www.bizbooster.com/franchise?meetinglink';
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Webinar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           customContainer(
             margin: 15,
             bRadius: 10,
             child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 40,
                          child: Text('ST',style: TextStyle(fontSize: 35),),),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Webinar 1',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                                  Text('Saturday 1st Jan 2024',style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text('01 pm - 02 pm',style: TextStyle(color: Colors.blue),)
                                ],
                              ),
                            ),
                          ),
                        Icon(Icons.share,size: 18,)
                        ],
                      ),
                  ),
        
                  customContainer(
                    margin: 15,
                      bRadius: 10,
                      hPadding: 10,
                      vPadding: 5,
                      child: Row(
                        children: [
                          customContainer(bRadius: 10,hPadding: 10,vPadding: 10,margin: 2,  child: Icon(Icons.video_chat_outlined)),
                          Expanded(
                            child: Text(link)
                          )
                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customContainer(
                        onTap: (){},
                        borderColor: Colors.blue,
                      bRadius: 15,
                      hPadding: 15,
                      vPadding: 5,
                      child: Row(
                        children: [
                          Text('Copy ',style: TextStyle(color: Colors.blue),),
                          Icon(Icons.copy,size: 15,color: Colors.blue,),
                        ],
                      )
                      ),
                      customContainer(bRadius: 15,hPadding: 15,
                          vPadding: 5,
                          onTap: (){},
                          child: Text('Enroll Now',style: TextStyle(color: Colors.white),),
                        containerColor: Colors.blue
                      ),
                    ],
                  ),
               Container(
        
                 padding: EdgeInsets.only(bottom: 20),
                   margin: EdgeInsets.only(top: 5,left: 15),
                   child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui.'))
                ],
              ),
           ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Time Remaining',style: TextStyle(fontSize: 14),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                          text: '10',style: TextStyle(color: Colors.black54,fontSize: 28,fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: 'hr',style: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold,),
                            ),
                            TextSpan(
                              text: ' 40',style: TextStyle(color: Colors.black54,fontSize: 28,fontWeight: FontWeight.bold,),
                            ),
                            TextSpan(
                              text: 'min',style: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold,),
                            ),
                          ]
                      )),
                    ],
                  ),
                ],
              ),
            ),
           
            SizedBox(
              height: height*0.7,
              child: Expanded(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context,index){
                      int newIndex=index+1;
                      return customContainer(
                        margin: 5,
                        vPadding: 8,
                        hPadding: 5,
                        bRadius: 10,
                        child: ListTile(
                          leading: CircleAvatar(radius: 25,child: Text('ST'),),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Live Webinar $newIndex'),
                              InkWell(child: Icon(Icons.share,size: 18,)),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('04-01-2024',style: TextStyle(fontSize: 11),),
                                  Text('01 PM - 02 PM',style: TextStyle(fontSize: 11,color: Color.fromRGBO(0, 63, 136, 1),),),
                                  customContainer(bRadius: 5,
                                      onTap: (){
        
                                      },
                                      containerColor: Color.fromRGBO(0, 63, 136, 1),
                                      hPadding: 8,
                                      vPadding: 2,
                                      child: Text('Enroll Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                                ],
                              ),
        
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}