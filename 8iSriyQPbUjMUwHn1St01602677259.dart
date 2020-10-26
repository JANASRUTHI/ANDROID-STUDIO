import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Dice Game',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Dice(),
    ),
  ));
}


class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int left=1,right=1,score=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/${left}.png'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/${right}.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: RaisedButton(
            color: Colors.white,
            child: Text('Roll',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30.0),),
            onPressed: () async{
              setState(() {
                left=Random().nextInt(6)+1;
                right=Random().nextInt(6)+1;
              });
              if(score>=100)
                {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('You have won the Game'),
                          actions: [
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }
                  );
                  setState(() {
                    score=0;
                  });
                }
              if(left!=right)
                {
                  setState(() {
                    score=score+left+right;
                  });
                }
              else
                {
                   await showDialog(
                      context: context,
                    builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Game Over'),
                          content: Text('Your score is ${score}'),
                          actions: [
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                    }
                  );
                  setState(() {
                    score=0;
                  });
                }
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text('Score : ${score}',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
