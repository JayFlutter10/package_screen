import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SemiCircleChart extends StatelessWidget {
    SemiCircleChart({super.key});
    final List<dynamic> data=[
  {
    'key':'Returns',
    'value':'4 Lakh'
  },
  {
    'key':'Leads',
    'value':'120 Leads'
  },
];

  @override
  Widget build(BuildContext context) {

    //Values of both variables [firstVal,secondVal] always should be less then 800 always
    final double firstVal=100;
    final double secondVal=400;

    final double value=firstVal*100/200;
    final double valueTwo=secondVal*100/200;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(2),
        child: SizedBox(
          height: 240,
          child: Stack(
            children: [
              //Big Arc Circle
              Stack(
                children:[
                  //Arc
                  Transform.rotate(
                  transformHitTests:false,
                  angle: 140.15,
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: 340,
                      sectionsSpace:0,
                      centerSpaceRadius: 100,
                      sections: [

                        PieChartSectionData(
                          value: 200,
                          color: Colors.transparent,
                          radius: 20,
                          showTitle: false,
                        ),

                        //Outlined
                        PieChartSectionData(
                          value:400-value,
                          color: Colors.transparent,
                          borderSide: BorderSide(

                              color: Color.fromRGBO(0, 63,136, 0.19)),
                          radius: 20,
                          showTitle: false,
                        ),
                        //Filled
                        PieChartSectionData(
                          value: value,
                          color:  Color.fromRGBO(0, 63, 136, 1),
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 200,
                          color: Colors.transparent,
                          radius: 20,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                ),
                ],
              ),

              //Small Arc Circle
              Stack(
                children:[
                  //Arc
                  Transform.rotate(
                    transformHitTests:false,
                    angle: 140.15,
                    child: PieChart(
                      PieChartData(
                        startDegreeOffset: 340,
                        sectionsSpace:0,
                        centerSpaceRadius: 50,
                        sections: [
                          PieChartSectionData(
                            value: 200,
                            color: Colors.transparent,
                            radius: 20,
                            showTitle: false,
                          ),
                          //Outlined
                          PieChartSectionData(
                            value:valueTwo,
                            color: Colors.green,
                            radius: 20,
                            showTitle: false,
                          ),
                          //Filled
                          PieChartSectionData(
                            value: 400-valueTwo,
                            color:  Colors.transparent,
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 63,136, 0.19)
                            ),
                            radius: 20,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: 200,
                            color: Colors.transparent,
                            radius: 20,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Arrow
                  // Transform.rotate(
                  //   transformHitTests:false,
                  //   angle: 140.15,
                  //   child: PieChart(
                  //     PieChartData(
                  //       startDegreeOffset: 340,
                  //       sectionsSpace:0,
                  //       centerSpaceRadius: 125,
                  //       sections: [
                  //         PieChartSectionData(
                  //           value: 200,
                  //           color: Colors.transparent,
                  //           radius: 2,
                  //           showTitle: false,
                  //         ),
                  //         //Outlined
                  //         PieChartSectionData(
                  //           value:valueTwo,
                  //           color: Colors.green,
                  //           radius: 2,
                  //           showTitle: false,
                  //         ),
                  //         //Filled
                  //         PieChartSectionData(
                  //           value: 400-valueTwo,
                  //           color:  Colors.transparent,
                  //           radius: 2,
                  //           showTitle: false,
                  //         ),
                  //         PieChartSectionData(
                  //           value: 200,
                  //           color: Colors.transparent,
                  //           radius: 2,
                  //           showTitle: false,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),

              //Text in Chart
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(''),
                    Column(
                      children: [
                        Text('5X',style: TextStyle(fontSize: 18),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Divider(thickness: 4,),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(data[0]['key'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            Text(data[0]['value'].toString()),
                          ],
                        ),
                        Column(
                          children: [
                            Text(data[1]['key'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            Text(data[1]['value'].toString()),
                          ],
                        ),
                      ],
                    )

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}