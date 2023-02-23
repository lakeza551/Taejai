import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:intl/intl.dart';

class ProjectWidget {
  final Project project;

  ProjectWidget({required this.project});

  final numFormat = NumberFormat.decimalPattern();

  Widget createWidget() {
    var donateAndTargetRatio = (project.receivedAmount / project.targetAmount);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  project.imageUrl,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      project.description,
                      style: const TextStyle(
                          fontSize: 20,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'เป้าหมาย',
                      style: TextStyle(
                        fontSize: 17,
                          color: Colors.black54
                      ),
                    ),
                    Text(
                      '${numFormat.format(project.targetAmount)} บาท',
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                      ),
                    )
                  ],
                ),
                Text(
                    '${(donateAndTargetRatio * 100).toStringAsFixed(0)} %',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            createBarChart(donateAndTargetRatio),
            const SizedBox(
                height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${project.duration} วัน'),
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${project.donateCount}')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget createBarChart(donateAndTargetRatio) {
    return Container(
      alignment: Alignment.topLeft,
      height: 10,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: donateAndTargetRatio,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
      ),
    );
  }
}

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> projectList = [
    Project(
        title: 'อิ่มท้องน้องพิเศษ',
        description: 'ชวนมอบมื้ออาหารกลางวันให้เด็กพิเศษ 240 คน',
        targetAmount: 8000,
        duration: 90,
        receivedAmount: 4000,
        donateCount: 10,
        imageUrl: 'https://cdn.pixabay.com/photo/2021/10/01/18/53/corgi-6673343_1280.jpg',
        durationDate: '',
        area: ''
    ),
    Project(
        title: 'I’m ABLE “โอกาสจากพี่ ช่วยหนูได้เรียนร่วม”',
        description: 'ระดมทุนการศึกษา 1 ปีให้กับเด็กนักเรียนพิการจำนวน 150 คนๆ ละ 4,000 บาท',
        targetAmount: 12000,
        duration: 150,
        receivedAmount: 800,
        donateCount: 25,
        imageUrl: 'https://cdn.pixabay.com/photo/2023/01/24/13/23/viet-nam-7741017_1280.jpg',
        durationDate: '',
        area: ''
    ),
    Project(
        title: 'พาพญาแร้งที่สูญพันธุ์จากธรรมชาติกลับคืนป่าเมืองไทย',
        description: 'เกือบ 30 ปี ที่พญาแร้งหายไปจากป่าเมืองไทย ในวันนี้พวกเราพยายามวางแผนเพาะพันธุ์พญาแร้งที่เหลือ',
        targetAmount: 4000,
        duration: 60,
        receivedAmount: 1600,
        donateCount: 4,
        imageUrl: 'https://cdn.pixabay.com/photo/2023/01/21/02/40/cat-7732877_1280.jpg',
        durationDate: '',
        area: ''
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เทใจ')),
      body: ListView.separated(
        padding: EdgeInsets.all(50),
        itemBuilder: (BuildContext context, int index) {
          return ProjectWidget(project: projectList[index]).createWidget();
        },
        itemCount: projectList.length,
        separatorBuilder: (context, index) => SizedBox(height: 50),
      )
    );
  }
}
