import 'package:end_game_demo/screen2.dart';
import 'package:end_game_demo/screen3.dart';
import 'package:flutter/material.dart';

final redShadeColor = Colors.red.shade500;
final greyShade = Colors.grey.shade800;
final textColor = Colors.white70;

void main() => runApp(MaterialApp(
      home: EndGame(),
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme().copyWith(color: redShadeColor)),
    ));

class EndGame extends StatefulWidget {
  @override
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  String ironManLabel = 'Iron Man';
  String thanosLabel = 'Thanos';
  String winner = '';
  String selectedPlayer = '';
  int ironManScore = 300;
  int thanosScore = 550;

  void calculateWinner() {
    setState(() {
      this.winner =
          this.ironManScore < this.thanosScore ? thanosLabel : ironManLabel;
    });
  }

  void playerSelected(String player) {
    setState(() {
      this.selectedPlayer = player == ironManLabel ? ironManLabel : thanosLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('End Game Demo'),
//        backgroundColor: redShadeColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateWinner();
        },
        backgroundColor: redShadeColor,
        child: Image.asset(
          'images/fight.png',
          height: 40.0,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PlayerProfile(
                  avatar: 'images/ironman.png',
                  playerName: ironManLabel,
                  playerScore: ironManScore,
                  playerSelected: playerSelected,
                  selected: this.selectedPlayer == ironManLabel ? true : false),
              Container(
                height: 200,
                child: VerticalDivider(
                  thickness: 3.0,
                  width: 20,
                  color: redShadeColor,
                ),
              ),
              PlayerProfile(
                  avatar: 'images/thanos.png',
                  playerName: thanosLabel,
                  playerScore: thanosScore,
                  playerSelected: playerSelected,
                  selected: this.selectedPlayer == thanosLabel ? true : false),
            ],
          ),
          Visibility(
            visible: this.winner != '',
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (winner == ironManLabel) {
                        return Screen2();
                      } else if (winner == thanosLabel) {
                        return Screen3();
                      }
                      return null;
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: greyShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$winner Wins!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: textColor),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: () {
              if (this.selectedPlayer == ironManLabel) {
                setState(() {
                  this.ironManScore += 100;
                });
              } else if (this.selectedPlayer == thanosLabel) {
                setState(() {
                  this.thanosScore += 100;
                });
              }
            },
            child: Image.asset(
              'images/boost.png',
              width: 100,
              height: 100,
              color: redShadeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerProfile extends StatelessWidget {
  final String avatar, playerName;
  final int playerScore;
  final bool selected;
  final Function playerSelected;
  PlayerProfile(
      {this.avatar,
      this.playerName,
      this.playerScore,
      this.playerSelected,
      this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.playerSelected(this.playerName);
      },
      child: Container(
          width: 180,
          height: 300,
          decoration: BoxDecoration(
            color: selected == true ? redShadeColor : greyShade,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(
                  avatar,
                ),
                radius: 50,
                backgroundColor: textColor,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                playerName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: textColor),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                playerScore.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: textColor),
              ),
              Text(
                'Points',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: textColor),
              ),
            ],
          )),
    );
  }
}
