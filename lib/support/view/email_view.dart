import 'package:flutter/material.dart';

class EmailView extends StatelessWidget {
   EmailView({super.key});
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   
      ),
      body: Container(
        margin: EdgeInsets.only(left:15,top:10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text('Write to us at ',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)) ,
                    InkWell(
                        onTap: (){
                        showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Color.fromRGBO(0, 80,157 , 1))
                                ),)
                                ,onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text('Go Back',style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 80,157 , 1),fontWeight: FontWeight.bold))),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      elevation: 0,
                                      backgroundColor: Color.fromRGBO(0, 80,157 , 1)
                                    ),
                                    onPressed: (){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                         backgroundColor: Colors.white,
                                           content: Center(child: Text('Redirecting',style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 80,157 , 1),fontWeight: FontWeight.bold),))) ,
                                      );
                                    }, child: Text(' Allow ',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),))
                              ],
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(
                                  Radius.circular(10.0))),
                          content: Text("Bizbooster is asking to open your email app"),
                          title: Center(child: Text('Permission required',)),
                          titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 80,157 , 1)),
                        )
                        );
                    }, child: Text('support.bizbooster@gmail.com',style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.blue,color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500)))
                  ]
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 2),
              child: Text('or you can find resolution for your query from the commonly asked questions',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 16)
              ),
            ),
            SizedBox(height: 15,),
            Text('Common FAQs',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
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
          ],
        ),
      ),
    );
  }
}
