import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreGames extends StatelessWidget {
  const MoreGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 0, 28, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(11, 0, 28, 1),

        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(context);
          },
            child: const Icon(Icons.arrow_back_ios_new_sharp,color: Colors.white)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Games',style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2, crossAxisCount: 2,childAspectRatio: 2
                ),
                itemCount: 20,
                itemBuilder: (context,index) {
                  return const Card(
                    margin: EdgeInsets.all(8),
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/game.png'),
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
