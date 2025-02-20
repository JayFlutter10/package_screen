import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/academy/view/certificate_view.dart';
import 'package:flutter_application_1/constants/style/text_styles.dart';
import 'package:flutter_application_1/rewards/views/claim_reward_view.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

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
    ///user_recruited_franchise_members must not exceed 20
  final int user_recruited_franchise_members=10;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.02),
          child: Column(
            children: [
              ///Center Text
              Center(child: Text('Complete tasks & get exclusive rewards',style: textStyle18(context))),
              SizedBox(height: height*0.04,),
        
              ///Banner
              customContainer(bRadius: 12,assetsImg: 'assets/rewards/img/banner_pizza.png',height: height*0.2),
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
                        Text('Dominos',style: textStyle16(context),),
                        Text('Get 20% Discount on 2 Pizzas',style: textStyle18(context),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
        
              ///Eligibility Criteria and Linear Progress Bar
              customContainer(borderColor: Colors.grey.shade200, bRadius: 10, margin: width*0.01, hPadding: width*0.02, vPadding: height*0.02,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Eligibility Criteria',style: textStyle16(context,fontWeight: FontWeight.w600)),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor',style: textStyle14(context),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(user_recruited_franchise_members.toString(),style: textStyle16(context)),
                        //   customContainer(bRadius: width*0.2,height: height*0.015,width: width*0.8, borderColor: Colors.grey.shade200, containerColor: Colors.white,
                    //   child: Padding(
                    //     //Value of right padding must be above or equal to width*0.78
                    //     padding:  EdgeInsets.only(right: width-width*0.9),
                    //     child: customContainer(bRadius: width*0.2,height: height*0.015,gradient: LinearGradient(colors: [Color.fromRGBO(255, 0, 0, 1),Color.fromRGBO(8, 135, 8, 1),Color.fromRGBO(8, 135, 8, 1)]),width: width*0.5),
                    // )),
                        customContainer(bRadius: width*0.5, width: width*0.8, height: height*0.009,
                          child: LinearProgressBar(
                            progressColor: Colors.red,
                            borderRadius: BorderRadius.circular(width*0.05),
                            maxSteps: 20,
                            currentStep: user_recruited_franchise_members,
                          ),
                        ),
                        Text('20',style: textStyle16(context),),
                      ],
                    )
                  ],
                ),),
              SizedBox(height: height*0.02,),
        
              ///Claim Now
              customContainer(bRadius: width*0.05, vPadding: height*0.01, width: width*0.8, containerColor: Color.fromRGBO(0, 80,157, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(CupertinoIcons.lock,color: Colors.white,),
                    SizedBox(
                      width: width*0.06,
                    ),
                    Text('Claim Now',style: textStyle18(context,color: Colors.white),),
                ],
              ),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>ClaimRewardView()));}),
              SizedBox(height: height*0.02,),

              /// Builder for Locked Rewards
              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context,index){
                  return  Column(
                    children: [
                      customContainer(borderColor: Colors.grey.shade300, bRadius: 15, vPadding: height*0.02, hPadding: width*0.01,margin: width*0.02,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.hourglass_empty_sharp,size: height*0.02,color: Color.fromRGBO(0, 80, 157, 1),),
                                    Text('30D 15H 42M',style: textStyle14(context,color: Color.fromRGBO(0, 80, 157, 1)),),
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
                                        Text('Claim Rewards',style: textStyle14(context),),
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
                                  Text('Lorem ipsum dolor sit amet',style: textStyle16(context),),
                                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui',style: textStyle14(context,fontWeight: FontWeight.w400),),
                                  Row(
                                    children: [
                                      CircleAvatar(radius:width*0.035, child: Icon(CupertinoIcons.checkmark_alt_circle,size: 18,)),
                                      Text('Lorem ipsum dolor sit amet',style: textStyle14(context),),
                                    ],
                                  ),
                                  _dash(width: width,height: height*0.8),
                                  Row(
                                    children: [
                                      CircleAvatar(radius: width*0.035,child: Icon(CupertinoIcons.lock,size: width*0.05,),),
                                      Text('Lorem ipsum dolor sit amet',style: textStyle14(context),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),),
                      SizedBox(height: height*0.05,)
                    ],
                  );
              }),

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
