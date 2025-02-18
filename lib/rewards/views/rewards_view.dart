import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/view/certificate_view.dart';
import 'package:flutter_application_1/rewards/views/claim_reward_view.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({super.key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///Center Text
              Center(child: Text('Complete tasks & get exclusive rewards',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
              SizedBox(height: height*0.04,),
        
              ///Banner
              customContainer(bRadius: 12,assetsImg: 'assets/rewards/img/banner_pizza.png',height: height*0.18),
              SizedBox(height: height*0.04,),
        
              ///Offer Text
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CircleAvatar(radius: height*0.04,backgroundImage: AssetImage('assets/rewards/img/avatar_pizza.png'),),
                 SizedBox(width: width*0.05,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dominos',style: TextStyle(fontSize: 16,),),
                        Text('Get 20% Discount on 2 Pizzas',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
        
              ///Eligibility Criteria
              customContainer(borderColor: Colors.grey.shade200, bRadius: 10, margin: width*0.01, hPadding: width*0.02, vPadding: height*0.01,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Eligibility Criteria',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor')
                  ],
                ),),
              SizedBox(height: height*0.02,),
        
              ///Claim Now
              customContainer(bRadius: width*0.05, vPadding: height*0.01, width: width*0.8, containerColor: Color.fromRGBO(0, 80,157, 1),
              child: Center(child: Text('Claim Now',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>ClaimRewardView()));
                  }),
              SizedBox(height: height*0.02,),
        
              ///Claim Rewards
              customContainer(borderColor: Colors.grey.shade300, bRadius: 15, vPadding: height*0.02, hPadding: width*0.01,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.hourglass_empty_sharp,size: height*0.02,color: Color.fromRGBO(0, 80, 157, 1),),
                            Text('30D 15H 42M',style: TextStyle(color: Color.fromRGBO(0, 80, 157, 1)),),
                          ],
                        ),
                        customContainer(bRadius: 0,
                        shadowColor: Colors.transparent,
                        margin: height*0.03,
                        child: Image.asset('assets/rewards/img/banner_tab.png',height: height*0.05,width: width*0.2,)
                        ),
                        customContainer(bRadius: 15,
                            onTap: (){},
                            containerColor: Colors.white24,
                            vPadding: height*0.01,
                            hPadding: width*0.02,
                            child: Row(
                          children: [
                            Icon(CupertinoIcons.lock,size: 16,),
                            Text('Claim Rewards',style: TextStyle(fontWeight: FontWeight.w600),),
                          ],
                        )
                        )
                      ],
                    ),
        
                    customContainer(bRadius: 1, margin: width*0.015,vPadding: 2,hPadding: 2, height: height*0.2, width: 1.2, containerColor: Colors.black),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lorem ipsum dolor sit amet',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui',style: TextStyle(fontSize: 14),),
                          Row(
                            children: [
                              CircleAvatar(radius:width*0.035, child: Icon(CupertinoIcons.checkmark_alt_circle,size: 18,)),

                              Text('Lorem ipsum dolor sit amet'),
                            ],
                          ),
                          _dash(width: width,height: height),
                          Row(
                            children: [
                              CircleAvatar(radius: width*0.035,child: Icon(CupertinoIcons.lock,size: 18,),),
                              Text('Lorem ipsum dolor sit amet'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: height*0.02,),
              
              customContainer(borderColor: Colors.grey.shade300, bRadius: 15, vPadding: height*0.026, hPadding: width*0.01,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.hourglass_empty_sharp,size: height*0.02,color: Color.fromRGBO(0, 80, 157, 1),),
                            Text('30D 15H 42M',style: TextStyle(color: Color.fromRGBO(0, 80, 157, 1)),),
                          ],
                        ),
                        customContainer(bRadius: 0,
                            shadowColor: Colors.transparent,
                            margin: height*0.03,
                            child: Image.asset('assets/rewards/img/banner_tab.png',height: height*0.05,width: width*0.2,)
                        ),
                        customContainer(bRadius: 15,
                            onTap: (){},
                            containerColor: Colors.white24,
                            vPadding: height*0.01,
                            hPadding: width*0.02,
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.lock,size: 16,),
                                Text('Claim Rewards',style: TextStyle(fontWeight: FontWeight.w600),),
                              ],
                            ),
                        ),
                      ],
                    ),
                    customContainer(bRadius: 1, margin: width*0.02, height: height*0.25, width: 1.15, hPadding: 1,containerColor: Colors.black),
                    Expanded(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lorem ipsum dolor sit amet',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui',style: TextStyle(fontSize: 14),),
                          Row(
                            children: [
                              CircleAvatar(radius:width*0.035, child: Icon(CupertinoIcons.checkmark_alt_circle,size: 18,)),

                              Text('Lorem ipsum dolor sit amet'),
                            ],
                          ),
                          _dash(width: width,height: height),
                          Row(
                            children: [
                              CircleAvatar(radius: width*0.035,child: Icon(CupertinoIcons.lock,size: 18,),),
                              Text('Lorem ipsum dolor sit amet'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: height*0.08,),

            ],
          ),
        ),
      ),
    );
  }
}
Widget _dash({required double width,required double height}){
  return Column(
    children: [
      customContainer(
        margin: 8,
          containerColor: Color.fromRGBO(0, 80, 157, 1),
          bRadius: 4,
          borderColor: Color.fromRGBO(0, 80, 157,1),
          width: width*0.01,
          height: height*0.065
      ),
    ],
  );
}
