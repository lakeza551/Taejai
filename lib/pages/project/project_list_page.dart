import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:taejai/models/project.dart';
import 'package:intl/intl.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  final List<List<int>> matrix =
  [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
  ];
  int rows = 10;
  int rowLength = 15;

  int playerCurrentRow = 0;
  int playerCurrentColumn = 0;

  int foodCurrentRow = 5;
  int foodCurrentColumn = 5;

  int score = 0;

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    matrix[playerCurrentRow][playerCurrentColumn] = 1;
    matrix[foodCurrentRow][foodCurrentColumn] = 2;
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          if(playerCurrentColumn > 0) {
            setState(() {
              matrix[playerCurrentRow][playerCurrentColumn] = 0;
              -- playerCurrentColumn;
            });
          }
        }

        else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          if(playerCurrentColumn < rowLength - 1) {
            setState(() {
              matrix[playerCurrentRow][playerCurrentColumn] = 0;
              ++ playerCurrentColumn;
            });
          }
        }

        else if(event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
          if(playerCurrentRow > 0) {
            setState(() {
              matrix[playerCurrentRow][playerCurrentColumn] = 0;
              -- playerCurrentRow;
            });
          }
        }

        else if(event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
          if(playerCurrentRow < rows - 1) {
            setState(() {
              matrix[playerCurrentRow][playerCurrentColumn] = 0;
              ++ playerCurrentRow;
            });
          }
        }

        if(matrix[playerCurrentRow][playerCurrentColumn] == 2) {
          ++ score;
          foodCurrentRow = random.nextInt(rows);
          foodCurrentColumn = random.nextInt(rowLength);
        }
      },
      child: Row(
        children: [
          Column(
            children: <Widget>[
              for(var row in matrix ) Row(
                children: <Widget>[
                  for(var val in row) Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: val == 0 ? Colors.white : val == 1 ? Colors.black : Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: 50),
              Text('Your Score: '),
              Text('$score')
            ],
          )
        ]
      ),
    );
  }
}
