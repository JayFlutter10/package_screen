import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/view/two_min_gyan_view.dart';

class LiveWebinarView extends StatelessWidget {
  const LiveWebinarView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Webinar"),centerTitle: true,),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,),
                  hintText: 'Search by name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: height*0.02,),
              SizedBox(
              height: height*0.5,
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
              Text('Attend at least 3 live webinar to move forward ',style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
              Container(
                margin: EdgeInsets.all(5),
                height: height*0.6,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context,index){
                      int reqIndex=index+1;
                      return customContainer(
                        margin: 5,
                        vPadding: 8,
                        hPadding: 0,
                        bRadius: 10,
                        child: ListTile(
                          leading: customContainer(bRadius: 12,height: height*0.1,width: width*0.25,containerColor: Color.fromRGBO(177, 223, 233, 1),
                            child: Center(child: Text('W1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),),
                          title: Text('Live Webinar $reqIndex'),
                          subtitle: Text("Lorem ipsum dolor sit amet, consectetur...",maxLines: 1,overflow: TextOverflow.ellipsis,),
                          trailing: Icon(Icons.check_circle_outlined,color: Color.fromRGBO(0, 63,136, 1),),
                        ),
                      );
                    }
                ),
              ),],
          ),
        ),
      )

    );
  }
}
