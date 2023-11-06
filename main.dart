/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rounded Buttons Example'),
        ),
        body: Center(
          child: RoundedButtons(),
        ),
      ),
    );
  }
}

class RoundedButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedButton(label: "Button 1", onPressed: () => print("Button 1 pressed")),
        RoundedButton(label: "Button 2", onPressed: () => print("Button 2 pressed")),
        RoundedButton(label: "Button 3", onPressed: () => print("Button 3 pressed")),
        RoundedButton(label: "Button 4", onPressed: () => print("Button 4 pressed")),
        RoundedButton(label: "Button 5", onPressed: () => print("Button 5 pressed")),
        RoundedButton(label: "Button 6", onPressed: () => print("Button 6 pressed")),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  RoundedButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Adjust button width as needed
      height: 50, // Adjust button height as needed
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(label, style: TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Adjust border radius for rounded corners
          ),
        ),
      ),
    );
  }
}*/




//import 'package:flutter/gestures.dart';
//import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math';

//import 'package:flutter/services.dart';
//import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp( HealthApp());
}

/*class HealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your App Title'),
        ),
        body: AppsBottomNavigationBar(), // Add your bottom navigation bar here
      ),
    );
  }
}*/
class HealthApp extends StatelessWidget {
   HealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Tips'),
          backgroundColor: Colors.amber[800],
        ),
        //body: SafeArea(child: HomeScreen()),
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top), // Add top padding
          child: const AppsBottomNavigationBar(),
        ),
        
      ),
    );
  }
}

class AppsBottomNavigationBar extends StatefulWidget {
  const AppsBottomNavigationBar({super.key});

  @override
  State<AppsBottomNavigationBar> createState() =>
      _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<AppsBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Health Tips'),
        backgroundColor: Colors.amber[800],
      ),*/
      body: SafeArea( // Wrap the content with SafeArea
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Health A-Z',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        
        selectedItemColor: Colors.amber[800],
        selectedIconTheme: const IconThemeData(size: 30),
        //unselectedIconTheme: const IconThemeData(size: 24),
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> _widgetOptions = [
    SafeArea(child: HomeScreen()), // Wrap with SafeArea
    SafeArea(child: HealthAtoZ()), // Wrap with SafeArea
    SafeArea(child: HealthAtoZ()), // Wrap with SafeArea
  ];
}



/*class MyTabController extends StatefulWidget {
  const MyTabController({Key? key}) : super(key: key);

  @override
  MyTabControllerState createState() => MyTabControllerState();
}
class MyTabControllerState extends State<MyTabController>
  with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 2, vsync: this);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarApp()));
            }, 
            icon: Icon(Icons.search)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.home, color: Colors.white),
              text: 'HOME',
            ),
            Tab(
              icon: Icon(Icons.health_and_safety, color: Colors.white),
              text: 'Health A-Z',
            ),            
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(
            //onPressed: () => _tabController.index = 1,
          ),
          HealthAtoZ(
            // onNext: () => _tabController.index = 2,
          ),   
        ],
      ),
    );
  } 
}*/

/*class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                Tooltip(
                  message: 'Change brightness mode',
                  child: IconButton(
                    isSelected: isDark,
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                    selectedIcon: const Icon(Icons.brightness_2_outlined),
                  ),
                )
              ],
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        ),
      ),
    );
  }
}*/


class HealthAtoZ extends StatelessWidget {
  final List<String> letters = List.generate(26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5 columns
      ),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(6.0),
          child: RoundedButton(
          text: letters[index],
          onPressed: () {
            if(letters[index]=='A'){            
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthA()));
            }
            // Add your navigation logic here to open a new page for each button.
            // You can use Navigator.push to navigate to a new page.
            //Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage(letter: letters[index]));
          },
          buttonColor: Colors.amber,
          ),
        );
        
      },
    );
  }
}
  
class HealthA extends StatelessWidget{
  const HealthA({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health A-Z'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        height: 40,
                        width: 60,
                        child: OutlinedButton(
                          onPressed: () {
                          // Add your button 1 action here
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Change the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)                          
                            ),
                          ),
                          child: Text(
                            'Abdominal Pain\n(পেটে ব্যথা)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              
                            ),
                          ),
                        ),
                      ),                      
                    ),                    
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        height: 40,
                        width: 60,
                        child: OutlinedButton(
                          onPressed: () {
                          // Add your button 1 action here
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Change the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)                          
                            ),
                          ),
                          child: Text(
                            'Acidity\n(গ্যাস্ট্রিক)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              
                            ),
                          ),
                        ),
                      ),                      
                    ),
                    
                  ),
                ],
              ),
              // Add more rows of buttons for class HealthA as needed
            ],
          ),
        ),
      ),
    );
  }
}
  

/*class HealthSection extends StatelessWidget {
  final String name;

  HealthSection({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Adjust the height as needed
      color: Colors.blue, // Change the section's background color
      alignment: Alignment.center,
      child: Text(
        'Health Section $name',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}*/

/*class HealthAtoZ extends StatelessWidget{
  const HealthAtoZ({super.key});

   @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical, // Vertical scrolling
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: 26,
          itemBuilder: (context, index) {
            final alphabet = String.fromCharCode('A'.codeUnitAt(0) + index);
            return RoundedButton(
              text: alphabet,
              onPressed: () {
                // Define different actions for each button
                switch (alphabet) {
                  case 'A':
                    // Action for button A
                    print('Button A pressed');
                    // Add your specific action for A
                    break;
                  case 'B':
                    // Action for button B
                    print('Button B pressed');
                    // Add your specific action for B
                    break;
                  // Add cases for other buttons (C, D, etc.) as needed
                }
              },
              buttonColor: Colors.purple,
            );
          },
        ),
      ],
    );
  }
}*/

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
          VitaminButton(),
          BloodPressureButton(),
          //AppsBottomNavigationBar(),
          // Add more buttons for other categories as needed
          ],
        ),
      ),
    );
    
  }
}

class VitaminButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Card(
        elevation: 4, // Add elevation for a card-like appearance
        margin: EdgeInsets.all(8.0), // Add margin for spacing
        child: Column(
          children: <Widget>[
            ListTile(
              tileColor: Colors.cyan.withOpacity(0.6), // Transparent background color
              title: Text(
                "Vitamin",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Handle what happens when the "Vitamin" card is pressed
              },
            ),
            Image.asset(
              'assets/bg_image.jpg', // Replace with your image path
              width: double.infinity, // Set the image width to fill the card
              height: 200.0, // Set the image height as needed
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ],
        ),
      ),
      children: [
        SubcategoryListOfVitamin(),
      ],
    );
  }
}


class SubcategoryListOfVitamin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0, // Adjust the height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RoundedButton(
            text: "Vitamin A",
            //Image.asset('name'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminA()));
            },
            buttonColor: Colors.red,
          
          ),

          RoundedButton(
            text: "Vitamin B",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminB()));
            
            },
            buttonColor: Colors.green,
          ),

          RoundedButton(text: "Vitamin C", onPressed: () => print("Button 3 pressed"), buttonColor: Colors.blue),
          RoundedButton(text: "Vitamin D", onPressed: () => print("Button 4 pressed"), buttonColor: Colors.orange),
          RoundedButton(text: "Vitamin E", onPressed: () => print("Button 5 pressed"), buttonColor: Colors.purple),
          RoundedButton(text: "Vitamin K", onPressed: () => print("Button 6 pressed"), buttonColor: Colors.teal),
        ],
      ),
    );
  }
}

class BloodPressureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Card(
        elevation: 4, // Add elevation for a card-like appearance
        margin: EdgeInsets.all(8.0), // Add margin for spacing
        child: Column(
          children: <Widget>[
            ListTile(
              tileColor: Colors.cyan.withOpacity(0.6), // Transparent background color
              title: Text(
                "Blood Pressure",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Handle what happens when the "Vitamin" card is pressed
              },
            ),
            Image.asset(
              'assets/bg_image.jpg', // Replace with your image path
              width: double.infinity, // Set the image width to fill the card
              height: 200.0, // Set the image height as needed
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ],
        ),
      ),
      children: [
        SubcategoryListOfVitamin(),
      ],
    );
  }
}
/*class BloodPressureButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      /*title: RoundedButton(
        text: 'Blood Pressure',
        onPressed: () {

        }, buttonColor: Colors.amberAccent,
      )*/
      title: MenuButton(
        text: "Blood Pressure",
        onPressed: () {
          // Handle what happens when the "Vitamin" button is pressed
        },
        buttonColor: Colors.green,
      ),
      children: [
        SubcategoryListOfVitamin(),
      ],
    );
  }

}*/
////
/*class VitaminButton extends StatelessWidget {
  const VitaminButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: 'Vitamin', 
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RoundedButtons()));
      }, 
      buttonColor: Colors.red,
    );
  }
}*/


class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;

  const RoundedButton({required this.text, required this.onPressed, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 90.0, // Rotate each button by 30 degrees (pi/6)
      child: Container(
        width: 80.0, // Set the desired width
        height: 80.0, // Set the same value as width to make it circular
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(), // Make the button circular
            backgroundColor: buttonColor, // Set the background color
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text, 
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.black87,   
                ),       
              ),
            ),                       
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;

  const  MenuButton({
    required this.text, 
    required this.onPressed, 
    required this.buttonColor});

    @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}


/////
/*class RoundedButtons extends StatelessWidget {
  const RoundedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20.0, // Adjust the spacing between buttons
        runSpacing: 20.0, // Adjust the spacing between rows of buttons
        alignment: WrapAlignment.center,
        children: [
          RoundedButton(
            text: "Vitamin A",
            //Image.asset('name'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminA()));
            },
            buttonColor: Colors.red,
          
          ),

          RoundedButton(
            text: "Vitamin B",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminB()));
            
            },
            buttonColor: Colors.green,
          ),

          RoundedButton(text: "Vitamin C", onPressed: () => print("Button 3 pressed"), buttonColor: Colors.blue),
          RoundedButton(text: "Vitamin D", onPressed: () => print("Button 4 pressed"), buttonColor: Colors.orange),
          RoundedButton(text: "Vitamin E", onPressed: () => print("Button 5 pressed"), buttonColor: Colors.purple),
          RoundedButton(text: "Vitamin K", onPressed: () => print("Button 6 pressed"), buttonColor: Colors.teal),
        ],
      ),
    );
  }
}*/

/*class RoundedButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedButton(
          text: "Vitamin A",
        //  Image.asset('name'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminA()));
          },
          buttonColor: Colors.red,
          
        ),
            
        RoundedButton(
          text: "Vitamin B",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminB()));
            
          },
          buttonColor: Colors.red,
        ),
        
        
        RoundedButton(text: "Vitamin C", onPressed: () => print("Button 3 pressed")),
        RoundedButton(text: "Vitamin D", onPressed: () => print("Button 4 pressed")),
        RoundedButton(text: "Vitamin E", onPressed: () => print("Button 5 pressed")),
        RoundedButton(text: "Vitamin K", onPressed: () => print("Button 6 pressed")),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color buttonColor;
  

  RoundedButton({
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue, //default color is blue
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
          child: ElevatedButton(
            onPressed: () => onPressed(),
            
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,)
            ),
            
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), 
              ),
              minimumSize: Size(150, 50.0),
              backgroundColor: buttonColor,
            ),
            
            
          ),
        ),
    );
  }
}*/

class VitaminA extends StatelessWidget{
  const VitaminA({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Vitamin A'),
    ),
   
    body: Column(
      
      children: <Widget>[
        
      // child: SingleChildScrollView(
        Image.asset(
          'assets/bg_image.jpg', // Replace with your image path
           width: 200, // Set the image width as per your requirements
           height: 200, // Set the image height as per your requirements
        ),
       Expanded(        
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: RichText(             
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'শরীরে ভিটামিন ‘এ’ ',
                    
                    style: TextStyle(
                      fontSize:  18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                       
                    ),   
                   
                  ),
                  TextSpan(
                    text: 'প্রয়োজন অনুযায়ী থাকা দরকার। একজন পূর্ণবয়স্ক মহিলার শরীরে ভিটামিন ‘এ’ দিনে কম করে ৭০০ মাইক্রোগ্রাম থাকা উচিত। পূর্ণবয়স্ক পুরুষদের শরীরে দিনে কম করে ৯০০ মাইক্রোগ্রাম ভিটামিন ‘এ’ থাকা দরকার। মহিলাদের খাবারে ঊর্ধ্বসীমা দৈনিক সর্বাধিক ৩০০০ মাইক্রোগ্রাম ও পুরুষদেরও ৩০০০ মাইক্রোগ্রাম ভিটামিন ‘এ’ থাকা দরকার।',
                    
                    style: TextStyle(
                      fontSize:  17,
                      color: Colors.black,
                    ),                                        
                  ),
                  
                  TextSpan(
                    text: '\n\nভিটামিন ‘এ’ শরীরের রোগ প্রতিরোধ ক্ষমতা বাড়ায়। ভিটামিন ‘এ’ চোখের জন্য খুবই প্রয়োজনীয়। শরীরের বিকাশে ভিটামিন ‘এ’ র ভূমিকা আছে। বাহ্যিক আবরণের কোষ, ত্বক, দাঁত, ও অস্থির গঠনের জন্য ভিটামিন ‘এ’ জরুরী। ভিটামিন ‘এ’ নানা রকমের সংক্রামক রোগ থেকে শরীরকে রক্ষা করে থাকে। শরীরে প্রাপ্ত লৌহের স্বাভাবিক ব্যবহারের ঘাটতি হয় না ভিটামিন ‘এ’ শরীরে থাকলে। ফলে রক্ত স্বল্পতা দেখা দেয়না। শরীর সুস্থ্য থাকে। ভিটামিন ‘এ’ বার্ধক্য রোধ করতে সহায়ক। ত্বকের শুষ্কতা বা বলিরেখা ভিটামিন ‘এ’ র দ্বারা থাকে না। ত্বক সতেজ রাখে। টিউমার ও ক্যান্সার থেকে রক্ষা করে ভিটামিন ‘এ’। লিভার ভালো রাখে। ভিটামিন আমাদের নাকের শ্লেষাঝিল্লিকেও সুস্থ রাখে। ভিটামিন ‘এ’ শরীরের রোগ প্রতিরোধ ক্ষমতা বাড়ায়। ভিটামিন ‘এ’ চোখের জন্য খুবই প্রয়োজনীয়। শরীরের বিকাশে ভিটামিন ‘এ’ র ভূমিকা আছে। বাহ্যিক আবরণের কোষ, ত্বক, দাঁত, ও অস্থির গঠনের জন্য ভিটামিন ‘এ’ জরুরী। ভিটামিন ‘এ’ নানা রকমের সংক্রামক রোগ থেকে শরীরকে রক্ষা করে থাকে। শরীরে প্রাপ্ত লৌহের স্বাভাবিক ব্যবহারের ঘাটতি হয় না ভিটামিন ‘এ’ শরীরে থাকলে। ফলে রক্ত স্বল্পতা দেখা দেয়না। শরীর সুস্থ্য থাকে। ভিটামিন ‘এ’ বার্ধক্য রোধ করতে সহায়ক। ত্বকের শুষ্কতা বা বলিরেখা ভিটামিন ‘এ’ র দ্বারা থাকে না। ত্বক সতেজ রাখে। টিউমার ও ক্যান্সার থেকে রক্ষা করে ভিটামিন ‘এ’। লিভার ভালো রাখে। ভিটামিন আমাদের নাকের শ্লেষাঝিল্লিকেও সুস্থ রাখে। ভিটামিন ‘এ’ শরীরের রোগ প্রতিরোধ ক্ষমতা বাড়ায়। ভিটামিন ‘এ’ চোখের জন্য খুবই প্রয়োজনীয়। শরীরের বিকাশে ভিটামিন ‘এ’ র ভূমিকা আছে। বাহ্যিক আবরণের কোষ, ত্বক, দাঁত, ও অস্থির গঠনের জন্য ভিটামিন ‘এ’ জরুরী। ভিটামিন ‘এ’ নানা রকমের সংক্রামক রোগ থেকে শরীরকে রক্ষা করে থাকে। শরীরে প্রাপ্ত লৌহের স্বাভাবিক ব্যবহারের ঘাটতি হয় না ভিটামিন ‘এ’ শরীরে থাকলে। ফলে রক্ত স্বল্পতা দেখা দেয়না। শরীর সুস্থ্য থাকে। ভিটামিন ‘এ’ বার্ধক্য রোধ করতে সহায়ক। ত্বকের শুষ্কতা বা বলিরেখা ভিটামিন ‘এ’ র দ্বারা থাকে না। ত্বক সতেজ রাখে। টিউমার ও ক্যান্সার থেকে রক্ষা করে ভিটামিন ‘এ’। লিভার ভালো রাখে। ভিটামিন আমাদের নাকের শ্লেষাঝিল্লিকেও সুস্থ রাখে।',
                    style: TextStyle(fontSize:  17, color: Colors.black,),
                  )  

                ],
                  
              ),                     
            ),
          )         
        )
      ],
    )
  );
  }
}

class VitaminB extends StatelessWidget{
  const VitaminB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VitaminB'),
        actions: <Widget> [
          TextButton(
            onPressed: (){},
            child: Text('test'),
          ),
        ],
      ),     
      body: Center(
        child: Transform.rotate(
          angle:  -pi / 180.0,
          child: Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                RoundedButton(
                  text: 'B1',
                  onPressed: (){},
                  buttonColor: Colors.red,
                ),
                RoundedButton(
                  text: 'B2',
                  onPressed: (){},
                  buttonColor: Colors.green,
                ),
                RoundedButton(
                  text: 'B5',
                  onPressed: (){},
                  buttonColor: Colors.blueAccent,
                ),
                RoundedButton(
                  text: 'B7',
                  onPressed: (){},
                  buttonColor: Colors.yellow,
                ),
                RoundedButton(
                  text: 'B9',
                  onPressed: (){},
                  buttonColor: Colors.purple,
                ),
                RoundedButton(
                  text: 'B10',
                  onPressed: (){},
                  buttonColor: Colors.teal,
                ),
                RoundedButton(
                  text: 'B11',
                  onPressed: (){},
                  buttonColor: Colors.grey,
                ),
                RoundedButton(
                  text: 'B12',
                  onPressed: (){},
                  buttonColor: Colors.deepPurple,
                ),
              ],
            ),
        ),
        
      ),
         
                /*ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B1', style: TextStyle(fontSize: 18),),
                  //color: Colors.accents,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    minimumSize: Size(100, 100.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B2'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    minimumSize: Size(100, 100.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B3'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), 
                  ),
                  minimumSize: Size(100, 100.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B5'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), 
                    ),
                  minimumSize: Size(100, 100.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B6'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    minimumSize: Size(100, 100.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B7'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    minimumSize: Size(100, 100.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B9'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    minimumSize: Size(100, 100.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('B12'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    minimumSize: Size(100, 100.0),
                  ),
                ),*/       
    ); 
  }
} 
