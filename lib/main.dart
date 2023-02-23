import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:taejai/pages/project/project_list_page.dart';
import 'package:taejai/pages/project/project_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Project p = Project(
        title: 'อิ่มท้องน้องพิเศษ',
        description: 'ระดมทุนการศึกษา 1 ปีให้กับเด็กนักเรียนพิการจำนวน 150 คนๆ ละ 4,000 บาท ให้กับเด็กนักเรียนพิการที่กำลังศึกษาอยู่ในระดับชั้นประถมศึกษาถึงมัธยมศึกษาในจังหวัดต่างๆของภาคตะวันออกเฉียงเหนือ ภาคตะวันตกและภาคใต้ที่มีความพิการทางร่างกายหรือพัฒนาการช้าแต่สามารถสื่อสารและเรียนหนังสือได้ เพื่อส่งเสริมเด็กนักเรียนพิการเหล่านั้นได้เรียนร่วมในโรงเรียนปกติกับนักเรียนทั่วไป เสริมสร้างพัฒนาการทางร่างกาย สติปัญญา ส่งเสริมการเรียนรู้การเข้าสังคมและช่วยเหลือตนเองในสถานการณ์ต่างๆโดยไม่รู้สึกว่าตนเองเป็นภาระของครูและเพื่อนๆในโรงเรียน',
        targetAmount: 8000,
        duration: 90,
        receivedAmount: 8000,
        donateCount: 10,
        imageUrl: 'https://cdn.pixabay.com/photo/2021/10/01/18/53/corgi-6673343_1280.jpg',
        durationDate: '01 ก.พ. 2566 ถึง 30 มิ.ย. 2566',
        area: 'ภาคตะวันออกเฉียงเหนือ ภาคตะวันตกและภาคใต้ของประเทศไทย'
    );

    return MaterialApp(
      title: 'Taejai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProjectPageWidget(p).createWidget()
    );
  }
}