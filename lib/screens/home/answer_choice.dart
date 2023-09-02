import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.choice_check,
    required this.answer,
    required this.choice,
  });
  final String choice_check;
  final String answer;
  final String choice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
        color: (choice == choice_check)? Colors.lightBlueAccent : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: (choice == choice_check)? Colors.pinkAccent : Colors.white,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Center(child: Text(choice,style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              SizedBox(width: 8.0,),
              Text(answer,style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Container(
              width: (choice == choice_check)? 20 : 0,
              height: 20,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(16),
                  color: (choice == choice_check)? Colors.lightGreenAccent : Colors.white
              ),
              child: Icon(Icons.check,size: (choice == choice_check)? 10 : 0,))

        ],
      ),
    );
  }
}