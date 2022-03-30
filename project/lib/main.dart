import 'package:flutter/material.dart';
import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes to Remember',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.pink,
      ),
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes to Remember'),
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: FittedBox(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/home.jpg'),
            ),
            Container(
              height: 60.0,
              width: 120.0,
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('  START  '),
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            )
          ],
        ),
        fit: BoxFit.contain,
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipes to Remember'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),

      // -------------------------------------

      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  Item(
    "https://tastedrecipes.com/wp-content/uploads/2020/09/Maggi-Omelette-Recipe-Card.png",
    "Maggi Omelette",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://tastedrecipes.com/wp-content/uploads/2018/12/Korean-Egg-Roll-Recipe-Card.jpg",
    "Korean Egg Roll",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/a0/7e/f4/a07ef47f78e1572e642c89b167f3844a.jpg",
    "Hakka Noodles",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://tastedrecipes.com/wp-content/uploads/2020/12/Chicken-Pizza-Rice-Recipe-Card-1.png",
    "Chicken Pizza Rice",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/b8/96/92/b89692404e2a0f4613ee1a33c05cded4.jpg",
    "Desi Chana Masala",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://miro.medium.com/max/1400/1*fJ93TN-s7D6XhN3Hfgze-A.jpeg",
    "Panja Chicken Gravy",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://tastedrecipes.com/wp-content/uploads/2018/08/Kashmiri-Rogan-Josh-Recipe-Card.jpg",
    "Kashmiri Rogan Josh",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/93/40/60/93406063a95196ea74725d7ae0651e9a.jpg",
    "Succulent Chicken Chilli ",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://integrisok.com/-/media/Blog/20%20Jan/OYH_HealthierHoneySesameChicken.jpg",
    "Honey Sesame Chicken",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/3e/b5/1c/3eb51cf38337538f5e340b6d2c072485.jpg",
    "Chicken Bread Pockets ",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/64/a7/1a/64a71a19b4de9dcd395abc37f4095ed4.jpg",
    "Bitter Gaurd Poriyal",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/45/06/ba/4506baa9778411321c342cb4199e08b6.jpg",
    "Veg Makhanwala",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/5e/0e/7c/5e0e7c437ced62119e7625cd254a9034.jpg",
    "Chinese Mutton Cubes",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/c5/11/07/c51107acc8ce64ca1e132a6dacc610e2.jpg",
    "Crispy Chicken Fingers",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/e5/b8/e9/e5b8e9bd9fead39fe7560fc4e5854f0b.jpg",
    "Palak Paneer Cheese Dosa",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/76/85/73/768573b0bd62defc5f918a57590234b9.jpg",
    "Coconut Couscous Salad",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/originals/f3/6a/e2/f36ae2f4c87cd62244bf0cae7e40040b.jpg",
    "Russian Salad",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/f7/8f/a6/f78fa65c6cfbde12c6cf1c5a9a0a5b9b.jpg",
    "Bombay Sandwich",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/ad/54/71/ad54712e7ec3408a7c2061d0cf74ea33.jpg",
    "Shahi Tukra",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
  Item(
    "https://i.pinimg.com/736x/16/8e/97/168e97a7174cc8b4b15b788639d2b6cd.jpg",
    "King Fish Shallow Fry",
    """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodoconsequat.""",
  ),
];
