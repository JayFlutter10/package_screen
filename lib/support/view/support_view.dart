import 'package:flutter/material.dart';
import 'package:flutter_application_1/Support/view/phone_support_view.dart';

import 'chat_view.dart';
import 'email_view.dart';

class SupportView extends StatelessWidget {
   SupportView({super.key});
final List<dynamic> faq=[
  {
    'Ques':'1. How can I reset my password?',
    'Ans':'To reset your password:\n1.Click on the "Forgot Password" link on the login page.\n2.Enter the email address associated with your account.\n3.Check your email inbox for a password reset link.\n4.Follow the instructions in the email to create a new password.\nIf you don’t receive the email within a few minutes, check your spam folder or contact support for assistance.'
  },
  {
    'Ques':'2. How can I contact customer support?',
    'Ans':'You can contact customer support in the following ways:\nEmail:Send us an email at support@example.com.Live \nChat: Use the chat feature on our website (available 24/7).\nPhone: Call our customer service team at 1-800-123-4567 during business hours.\nOur team is here to assist you with any issues or questions you may have!'
  },
  {
    'Ques':'3. How can I get help with an issue?',
        'Ans':'You can get help by:\nVisiting our Help Center for articles and guides.\nContacting our support Team through email, chat, or phone. We’re here to assist with any questions or concerns you have.'
  },
  {
    'Ques':'4.What should I do if I encounter a technical problem?',
        'Ans':''
  },
  {
    'Ques':'5.Where can I find more information about your services?',
        'Ans':''
  },
];
final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('support'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: height*0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ///On search if the query is not available show th following page = SearchSupportView();
          TextField(
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,),
            hintText: 'Search your query',
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
            Text("Common FAQs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10,),
                  itemCount: faq.length,
                  itemBuilder: (context,index){
                return  Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.all(5),
                  child: ExpansionTile(
                    shape:RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.zero
                    ) ,
                    collapsedShape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.zero
                    ),
                    childrenPadding: EdgeInsets.only(left: 10),


                    title: Text(faq[index]['Ques'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:16.0,),
                      child: Text(faq[index]['Ans']),
                    ),
                  ],),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _supportColumn(
                    icon:Icons.wechat_outlined,
                    text: 'Chat with us',
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatView()));
                    }
                ),
                _supportColumn(
                    icon:Icons.call,
                    text: 'Phone support',
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneSupportView()));
                    }
                ),
                _supportColumn(
                    icon:Icons.email_rounded,
                    text: 'Email support',
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailView()));
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget _supportColumn({IconData? icon, String? text, VoidCallback? onTap}){
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
    ),
    child: InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon,size: 40,color: Color.fromRGBO(0,84,182, 1),),
          Text(text!,style: TextStyle(fontSize: 14,color: Colors.black87,fontWeight: FontWeight.w500),),
        ],
      ),
    ),
  );
}