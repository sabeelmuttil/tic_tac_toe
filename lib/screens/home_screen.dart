import 'package:flutter/material.dart';

import '../components/alert_dialog.dart';
import '../components/constants.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List<String> _xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _clearBoard();
            },
          )
        ],
        title: RichText(
          text: TextSpan(
            text: 'Tic Tac Toe',
            style: kCustomText(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildPointsTable() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Player O',
                    style: kCustomText(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: _scoreO.toString(),
                    style: kCustomText(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Player X',
                    style: kCustomText(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: _scoreX.toString(),
                    style: kCustomText(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _tapped(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade700,
                ),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: _xOrOList[index],
                    style: TextStyle(
                      color:
                          _xOrOList[index] == 'x' ? Colors.white : Colors.red,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTurn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: _turnOfO ? 'Turn of O' : 'Turn of X',
            style: kCustomText(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = 'o';
        _filledBoxes += 1;
        _turnOfO = !_turnOfO;
      } else if (!_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = 'x';
        _filledBoxes += 1;
        _turnOfO = !_turnOfO;
      }

      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    // check first row
    if (_xOrOList[0] == _xOrOList[1] &&
        _xOrOList[0] == _xOrOList[2] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second row
    if (_xOrOList[3] == _xOrOList[4] &&
        _xOrOList[3] == _xOrOList[5] &&
        _xOrOList[3] != '') {
      _showAlertDialog('Winner', _xOrOList[3]);
      return;
    }

    // check third row
    if (_xOrOList[6] == _xOrOList[7] &&
        _xOrOList[6] == _xOrOList[8] &&
        _xOrOList[6] != '') {
      _showAlertDialog('Winner', _xOrOList[6]);
      return;
    }

    // check first column
    if (_xOrOList[0] == _xOrOList[3] &&
        _xOrOList[0] == _xOrOList[6] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second column
    if (_xOrOList[1] == _xOrOList[4] &&
        _xOrOList[1] == _xOrOList[7] &&
        _xOrOList[1] != '') {
      _showAlertDialog('Winner', _xOrOList[1]);
      return;
    }

    // check third column
    if (_xOrOList[2] == _xOrOList[5] &&
        _xOrOList[2] == _xOrOList[8] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    // check diagonal
    if (_xOrOList[0] == _xOrOList[4] &&
        _xOrOList[0] == _xOrOList[8] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check diagonal
    if (_xOrOList[2] == _xOrOList[4] &&
        _xOrOList[2] == _xOrOList[6] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    if (_filledBoxes == 9) {
      _showAlertDialog('Draw', '');
    }
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
      context: context,
      title: title,
      content: winner == ''
          ? 'The match ended in a draw'
          : 'The winner is ${winner.toUpperCase()}',
      defaultActionText: 'OK',
      onOkPressed: () {
        _clearBoard();
        Navigator.pop(context);
      },
    );

    if (winner == 'o') {
      _scoreO += 1;
    } else if (winner == 'x') {
      _scoreX += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _xOrOList[i] = '';
      }
    });

    _filledBoxes = 0;
  }
}
