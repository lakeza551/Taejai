import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ProjectPageWidget {
  final Project project;

  ProjectPageWidget(this.project);

  Widget createWidget() {
    var numFormat = NumberFormat.decimalPattern();

    var receivedAndTargetRatio = project.receivedAmount / project.targetAmount;

    var projectDetail = Container(
      color: Color.fromRGBO(255, 252, 230, 1),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            project.title,
            style: TextStyle(
              fontSize: 20
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset('img1.jpg', fit: BoxFit.fitWidth),
              )
            ],
          ),
          SizedBox(height: 15),
          Text(project.description),
          SizedBox(height: 10),
          Text('ระยะเวลาโครงการ: ${project.durationDate}'),
          SizedBox(height: 10),
          Text('พื้นที่ดำเนินโครงการ: ${project.area}')
        ],
      ),
    );
    var donateDetail = Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: Colors.black12,
            style: BorderStyle.solid
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ยอดบริจาคขณะนี้'),
          Text(
              '${numFormat.format(project.receivedAmount)} บาท',
            style: TextStyle(
              fontSize: 22,
              color: Colors.orange
            ),
          ),
          SizedBox(height: 20),
          const Text('เป้าหมาย'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${numFormat.format(project.targetAmount)} บาท',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              Text('${receivedAndTargetRatio * 100}%')
            ],
          ),
          SizedBox(height: 5),
          _createChart(receivedAndTargetRatio),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${project.duration} วัน'),
              Row(
                children: [
                  Icon(Icons.person),
                  Text('${project.donateCount}')
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
                color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 0.5,
                  spreadRadius: 0.2
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                      'ร่วมบริจาค',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 3),
                      blurRadius: 0.5,
                      spreadRadius: 0.2
                  )
                ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                      'หยิบใส่ตะกร้า',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            projectDetail,
            donateDetail,
            SizedBox(height: 20),
            Text('แชร์ให้เพื่อน'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.line, size: 30),
                SizedBox(width: 20),
                Icon(FontAwesomeIcons.facebook, size: 30),
                SizedBox(width: 20),
                Icon(FontAwesomeIcons.twitter, size: 30)
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }

  Widget _createChart(double ratio) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: 8,
      color: Colors.black12,
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: ratio,
        child: Container(
          color: Colors.orange,
        ),
      ),
    );
  }
}