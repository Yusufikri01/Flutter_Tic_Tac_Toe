import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/Color_schemes.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  ColorSchemes get _colorschemes => ColorSchemes.instance;
  bool player = true;
  int opuan = 0;
  int xpuan = 0;

  int filledBoxed = 0;
  List<String> piyon = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Text(
                        "OYUNCU-O",
                        style:
                            TextStyle(color: _colorschemes.white, fontSize: 24),
                      ),
                      Text(
                        opuan.toString(),
                        style:
                            TextStyle(color: _colorschemes.white, fontSize: 24),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Text(
                        "OYUNCU-X",
                        style:
                            TextStyle(color: _colorschemes.white, fontSize: 24),
                      ),
                      Text(
                        xpuan.toString(),
                        style:
                            TextStyle(color: _colorschemes.white, fontSize: 24),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _oyna(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: _colorschemes.Glaucous),
                        ),
                        child: Center(
                          child: Text(
                            piyon[index],
                            style: TextStyle(
                                color: _colorschemes.white, fontSize: 24),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void _oyna(int index) {
    setState(() {
      if (player && piyon[index] == '') {
        piyon[index] = "O";
        filledBoxed += 1;
      } else if (!player && piyon[index] == '') {
        piyon[index] = "X";
        filledBoxed += 1;
      }
      player = !player;
      _kazanan();
    });
  }

  void _kazanan() {
    if (piyon[0] == piyon[1] && piyon[0] == piyon[2] && piyon[0] != "") {
      _showDialog(piyon[0]);
      return;
    }
    if (piyon[3] == piyon[4] && piyon[3] == piyon[5] && piyon[3] != "") {
      _showDialog(piyon[3]);
      return;
    }
    if (piyon[6] == piyon[7] && piyon[6] == piyon[8] && piyon[6] != "") {
      _showDialog(piyon[6]);
      return;
    }
    if (piyon[0] == piyon[3] && piyon[0] == piyon[6] && piyon[0] != "") {
      _showDialog(piyon[0]);
      return;
    }
    if (piyon[1] == piyon[4] && piyon[1] == piyon[7] && piyon[1] != "") {
      _showDialog(piyon[1]);
      return;
    }
    if (piyon[2] == piyon[5] && piyon[2] == piyon[8] && piyon[2] != "") {
      _showDialog(piyon[2]);
      return;
    }
    if (piyon[0] == piyon[4] && piyon[0] == piyon[8] && piyon[0] != "") {
      _showDialog(piyon[0]);
      return;
    }
    if (piyon[2] == piyon[4] && piyon[2] == piyon[6] && piyon[2] != "") {
      _showDialog(piyon[2]);
      return;
    } else if (filledBoxed == 9) {
      _showFullDialog();
    }
  }

  void _showFullDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Kazanan Yok'),
            content: const Text("İkinizde kazanamadınız"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  _cleanBoard();
                  Navigator.pop(context);
                },
                child: const Text("Tekrar Oyna"),
              ),
            ]);
      },
    );
  }

  void _showDialog(String kazananoyuncu) {
    if (kazananoyuncu == "O") {
      opuan += 1;
    } else {
      xpuan += 1;
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Kazanan'),
            content: Text(
                kazananoyuncu == "O" ? "OYUNCU-O kazandı" : "OYUNCU-X kazandı"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  _cleanBoard();
                  Navigator.pop(context);
                },
                child: const Text("Tekrar Oyna"),
              ),
            ]);
      },
    );
  }

  void _cleanBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        piyon[i] = "";
      }
    });
    filledBoxed = 0;
    player = true;
  }
}
