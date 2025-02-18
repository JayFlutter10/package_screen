import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/academy/view/certificate_view.dart';

class ClaimRewardView extends StatefulWidget {
  const ClaimRewardView({super.key});

  @override
  State<ClaimRewardView> createState() => _ClaimRewardViewState();

}

class _ClaimRewardViewState extends State<ClaimRewardView> {
  final List<dynamic> data=[
    {
      'icon':CupertinoIcons.calendar,
      'title':'Expires on 00-00-0000, 11:59 PM',
      'subtitle':'',
    },
    {
      'icon':CupertinoIcons.bag,
      'title':'Offer Details',
      'subtitle':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt',
    },
    {
      'icon':CupertinoIcons.doc,
      'title':'Terms And Conditions',
      'subtitle':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt',
    },
  ];
  final TextEditingController _controller = TextEditingController(text: "Fixed Text");
  int selection =0;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ///AppBar
            SliverAppBar.large(
              floating: false,
              pinned: true,
              expandedHeight: height*0.3,
              flexibleSpace:
              FlexibleSpaceBar(
                background: Image.asset('assets/rewards/img/pizza.png',fit: BoxFit.cover,),
              ),
            ),

            ///Like Dislike
            SliverToBoxAdapter(
              child:Padding(
                padding:  EdgeInsets.all(width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: height*0.04,backgroundImage: AssetImage('assets/rewards/img/avatar_pizza.png'),),
                        SizedBox(width: width*0.05,),
                        Text('Dominos',style: TextStyle(fontSize: 16,),),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Color.fromRGBO(0, 80, 157, 0.3),child: Icon(CupertinoIcons.hand_thumbsup,color: Colors.white,),),
                        SizedBox(width: width*0.05,),
                        CircleAvatar(backgroundColor: Color.fromRGBO(0, 80, 157, 0.3), child: Icon(CupertinoIcons.hand_thumbsdown,color: Colors.white,))
                      ],
                    )
                  ],
                ),
              ),
            ),

            ///Offer Description
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.only(left:width*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get 20% Discount on 2 Pizzas',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                    Text('+ Free delivery on orders above 199'),
                  ],
                ),
              ),
            ),

            ///Copy Redeem Code
            SliverToBoxAdapter(
              child: customContainer(
                borderColor: Colors.grey.shade500,
                margin: 10,
                bRadius: 20,
                child: TextFormField(

                  decoration: InputDecoration(

                    contentPadding:EdgeInsets.only(left:width*0.05,top: height*0.015),
                    border: InputBorder.none,
                    suffixIcon: IconButton(onPressed: (){
                      Clipboard.setData(ClipboardData(text: _controller.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Center(child: Text("Copied to clipboard!",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),)),backgroundColor: Color.fromRGBO(0, 80, 157, 1),),
                      );
                    }, icon: Icon(Icons.copy))
                  ),
                  controller:_controller,
                  readOnly: true,
                  obscureText: true,
                ),
              )
              ),

            ///Expiry,Offer Details & Terms and Conditions
            SliverToBoxAdapter(
              child: customContainer(
                borderColor: Colors.grey.shade200,
                bRadius: 18,
                margin: height*0.01,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: selection==0? BorderRadius.circular(15):BorderRadius.circular(0),
                    border: Border.all(color: Colors.grey.shade200)
                  ),child: _expansion(headline: data[index]['title'], icon: data[index]['icon'], selection: index==0?false:true, data: data[index]['subtitle'], width: width*0.02));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget _expansion({required String headline,required IconData icon,required bool selection,required String data,required double width}){
  return ExpansionTile(
    shape: RoundedRectangleBorder(

      side: BorderSide(color: Colors.grey.shade300,)
    ),
      title:Row(
        children: [
          Icon(icon),
          SizedBox(width: width,),
          Text(headline),
        ],
      ),

      childrenPadding: EdgeInsets.all(12),
      showTrailingIcon: selection,
      children:[ 
        Text(data),
      ]
  );
}