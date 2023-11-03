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
import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('VitaBoost'),
        ),
        
        body: HomeScreen(),        
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VitaminButton(),
          BloodPressureButton(),
          // Add more buttons for other categories as needed
        ],
      ),
    );
  }
}

class VitaminButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      /*title: RoundedButton(
        text: "Vitamin",
        onPressed: () {
          // Handle what happens when the "Vitamin" button is pressed
        },
        buttonColor: Colors.pink,
      ),*/
      title: MenuButton(
        text: "Vitamin",
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
}

class SubcategoryListOfVitamin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0, // Adjust the height as needed
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

class BloodPressureButton extends StatelessWidget{
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

}
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
      angle: -pi / 6.0, // Rotate each button by 30 degrees (pi/6)
      child: Container(
        width: 100.0, // Set the desired width
        height: 100.0, // Set the same value as width to make it circular
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
                  color: Colors.white,   
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
