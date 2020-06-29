import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: BurgerHouse(),
    ),
  );
}

class BurgerHouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18191A),
      appBar: AppBar(
        backgroundColor: Color(0xff18191A),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.person_outline),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.bookmark_border),
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Center(
              child: Text(
                'BURGER',
                style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
                ),
              ),
            ),
            Text(
              'HOUSE',
              style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
              ),
            ),
            SizedBox(height:20),

            Container(
              height: MediaQuery.of(context).size.height,
              child: GridCard()),
          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: AlignmentDirectional.bottomCenter,
        child: FloatingActionButton(
          mini:true,
          backgroundColor: Colors.yellow,
          child: Icon(Icons.arrow_downward),
          onPressed: (){}),
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final _cards = [
    {
      'name' : 'Burger Combo',
      'price' : '\$${11.99}',
      'picture' : 'images/4.png'
    },
    {
      'name' : 'Chicken Burger',
      'price' : '\$${9.99}',
      'picture' : 'images/burger1.png'
    },
    {
      'name' : 'Classic Burger',
      'price' : '\$${12.99}',
      'picture' : 'images/burger2.png'
    },
    {
      'name' : 'Double Burger',
      'price' : '\$${20.99}',
      'picture' : 'images/burger3.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       itemBuilder: (BuildContext context, int index){
         return MyCards(
           image: _cards[index]['picture'],
           price: _cards[index]['price'],
           name: _cards[index]['name'],
         );
       });
  }
}

class MyCards extends StatelessWidget {
  final image;
  final name;
  final price;

  MyCards({this.name, this.image, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20)),
        ),
        color: Colors.black,
        child: GridTile(
          child: Image.asset(image, fit: BoxFit.cover,),
          footer: Container(
            color: Colors.black,
            height: 45,
            child: Column(
              children: [
                Text(name, style: TextStyle(
                color: Colors.white,
              ),),

              Text(price, style: TextStyle(
                color: Colors.white,
              ),),
              ],
            ),
          ),
      ),
      ),
    );
  }
}
