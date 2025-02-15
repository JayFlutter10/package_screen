import 'package:flutter/material.dart';
import 'package:flutter_application_1/Support/view/phone_support_view.dart';
import '../../academy/view/certificate_view.dart';
import 'chat_view.dart';
import 'email_view.dart';

class SearchSupportView extends StatefulWidget {
  const SearchSupportView({super.key});

  @override
  State<SearchSupportView> createState() => _SearchSupportViewState();
}

class _SearchSupportViewState extends State<SearchSupportView> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('support'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:height*0.1,),
            customContainer(bRadius: 12,height: 300,width: width*0.6,child: Center(child: Text('Image here'))),
            Container(padding: EdgeInsets.all(20), child: Text(textAlign: TextAlign.center,"Your query is not covered in our FAQs, please feel free to reach out to us directly for support. We're here to assist you!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
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