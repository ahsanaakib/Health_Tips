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
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:permission_handler/permission_handler.dart';

//import 'package:timezone/data/latest.dart' as tzdata;
//import 'package:timezone/timezone.dart' as tz;

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
        drawer: Drawer(      
          width: 200,      
          child: ListView(
            children: [
              SizedBox(
                height: 65,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber[800],
                  ),              
                  child: const Text(
                    'Health Tips',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ),              
              const ListTile(
                title: Text('About'),  
                dense: true,
                                         
              ),
            ],
          )        
          
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

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Health Tips'),
      //),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Articles and Tips'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticlesTips()));
              // Navigate to a list of health articles and tips.
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Video Resources'),
            onTap: () {
              // Navigate to a list of health-related videos.
            },
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text('First Aid Basics'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstAidbasics()));
            },
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes),
            title: Text('Wellness Quotes'),
            onTap: () {
              
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WellnessQuotes()));
            },
          ),
          
        ],
      ),
      
    );
  }
}

class ArticlesTips extends StatelessWidget{
  final List<String> categories = [
    'Nutrition Tips',
    'Mental Health',
    'Sleep Hygiene',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles and Tips'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(        

        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.article ),
              title: Text(categories[index]),
              subtitle: Text('Tap for info'),
              onTap: () {        
                if (index==0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NutritionTips()));
                }else if(index==2){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SleepHygiene()));
                }        
                // Add navigation or detailed information for each category
                // For simplicity, let's just print the selected category for now
               // print('Selected Category: ${categories[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

class NutritionTips extends StatefulWidget {
  @override
  _NutritionTipsState createState() => _NutritionTipsState();
}

class _NutritionTipsState extends State<NutritionTips> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/bg_image.jpg",
    "assets/plate.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Tips'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: SelectableText(                                                       
                'Proper nutrition helps keep energy levels up and protects against many age-related illnesses and diseases like heart disease, cancer, and diabetes.\n'
                'At the most basic level, nutrition is about eating a regular, balanced diet. Good nutrition helps fuel your body. The foods you eat supply the nutrients your body needs to maintain your brain, muscle, bone, nerves, skin, blood circulation, and immune system. Proper nutrition also helps protect you from illness and disease, such as heart disease, diabetes, cancer, and osteoporosis.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            
          ),
          Container(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
        
        ],
      ),
      ),
      
    );
  }
}

class SleepHygiene extends StatefulWidget {
  @override
  _SleepHygieneState createState() => _SleepHygieneState();
}

class _SleepHygieneState extends State<SleepHygiene> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/bg_image.jpg",
    "assets/plate.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Hygiene'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: const SelectableText(                                                       
                'Sleep hygiene refers to healthy sleep habits. Good sleep hygiene is important because of how crucial getting good sleep is for your mental and physical health, as well as your overall quality of life.\n'
                '\n10 tips to improve your sleep\n'
                '1. Keep a consistent sleep schedule\n'
                '2. Create a relaxing bedtime routine — and stick with it\n'
                '3. Turn off electronic devices before you go to sleep\n'
                '4. Exercise regularly\n'
                '5. \n'
                '6. Make your sleep environment work for you\n'
                '10. Manage stress before going to bed\n',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            
          ),
          Container(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
        
        ],
      ),
      ),
      
    );
  }
}
  

/*class NutritionTips extends StatelessWidget {
  // NutritionTips({Key? key}) : super(key: key);

  /*final List<String> images = [
    'assets/bg_image.jpg',
    'assets/plate.webp',
    //'assets/image3.jpg',
    // Add more images as needed
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Tips'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: PhotoView(
          imageProvider: AssetImage('assets/bg_image.jpg')
        ),
        /*child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotoViewGallery.builder(
                itemCount: images.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(images[index]),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    // enableRotation: true,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(),
              ),
              const SizedBox(height: 16.0),
              const SelectableText(
                'Proper nutrition helps keep energy levels up and protects against many age-related illnesses and diseases like heart disease, cancer, and diabetes.\n'
                'At the most basic level, nutrition is about eating a regular, balanced diet. Good nutrition helps fuel your body. The foods you eat supply the nutrients your body needs to maintain your brain, muscle, bone, nerves, skin, blood circulation, and immune system. Proper nutrition also helps protect you from illness and disease, such as heart disease, diabetes, cancer, and osteoporosis.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}*/

class FirstAidbasics extends StatelessWidget {
  final List<String> categories = [
    'Cardiopulmonary resuscitation (CPR)',
    'Bleeding and Wound Care',
    'Burns and Scalds',
    'Fractures and Sprains',
    'Choking',    
    'Conscious and Unconscious Patients',
    'Medical Emergencies',
    'First Aid Kit Essentials',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Basics'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(        

        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.healing ),
              title: Text(categories[index]),
              subtitle: Text('Tap for info'),
              onTap: () {
                if(index == 0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CardioRes()));
                }else if(index == 4){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Choking()));
                }else if(index == 7){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstAidKitEssentials()));
                }else if(index == 1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BleedingandWoundCare()));
                }
                
                // Add navigation or detailed information for each category
                // For simplicity, let's just print the selected category for now
                print('Selected Category: ${categories[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

class CardioRes extends StatefulWidget {
  @override
  _CardioResState createState() => _CardioResState();
}

class _CardioResState extends State<CardioRes> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPR'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: 'Learn the steps to perform this lifesaving technique on adults and children.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      '\nCardiopulmonary resuscitation (CPR) is a lifesaving technique that is useful in many emergencies in which someones breathing or heartbeat has stopped. For example, when someone has a heart attack or nearly drowns. The American Heart Association recommends starting CPR with hard and fast chest compressions. This hands-only CPR recommendation applies to both untrained bystanders and first responders.\n'
                      '\nIf you are afraid to do CPR or unsure how to perform CPR correctly, know that its always better to try than to do nothing at all. The difference between doing something and doing nothing could be someones life.\n'
                      '\nHere is advice from the American Heart Association:\n'
                      '\n-> Untrained: If you are not trained in CPR or worried about giving rescue breaths, then provide hands-only CPR. That means uninterrupted chest compressions of 100 to 120 a minute until paramedics arrive (described in more detail below). You dont need to try rescue breathing.\n'
                      '\n-> Trained and ready to go: If you are well-trained and confident in your ability, check to see if there is a pulse and breathing. If there is no pulse or breathing within 10 seconds, begin chest compressions. Start CPR with 30 chest compressions before giving two rescue breaths.\n'
                      '\n-> Trained but rusty: If you have previously received CPR training but you are not confident in your abilities, then just do chest compressions at a rate of 100 to 120 a minute. Details are described below.\n'
                      '\nThe above advice applies to situations in which adults, children and infants need CPR, but not newborns. Newborns are babies up to 4 weeks old.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),  
                    TextSpan(
                      text: '\nRemember to spell C-A-B\n'
                    ),
                    TextSpan(
                      text: 
                        '\n->C: compressions\n'
                        '->A: airway\n'
                        '->B: breathing\n'
                        ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ), 
                    TextSpan(
                      text: '\nCompressions: Restore blood flow\n'
                    ),
                    TextSpan(
                      text: 
                        'Compressions means you use your hands to push down hard and fast in a specific way on the persons chest. Compressions are the most important step in CPR. Follow these steps for performing CPR compressions:\n'
                        '1. Put the person on their back on a firm surface.\n'
                        '2. Kneel next to the persons neck and shoulders.\n'
                        '3. Place the lower palm of your hand over the center of the persons chest, between the nipples.\n'
                        '4. Place your other hand on top of the first hand. Keep your elbows straight. Place your shoulders directly above your hands.\n'
                        '5. Push straight down on the chest at least 2 inches (5 centimeters) but no more than 2.4 inches (6 centimeters). Use your entire body weight, not just your arms, when doing compressions.\n'
                        '6. Push hard at a rate of 100 to 120 compressions a minute. The American Heart Association suggests performing compressions to the beat of the song "Stayin Alive." Allow the chest to spring back after each push.\n'
                        '7. If you have not been trained in CPR, continue chest compressions until there are signs of movement or until emergency medical personnel take over. If you have been trained in CPR, go on to opening the airway and rescue breathing.\n'
                        ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nAirway: Open the airway\n'
                    ),
                    TextSpan(
                      text: 'If you are trained in CPR and you have performed 30 chest compressions, open the persons airway using the head-tilt, chin-lift maneuver. Put your palm on the persons forehead and gently tilt the head back. Then with the other hand, gently lift the chin forward to open the airway.\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nBreathing: Breathe for the person\n'
                    ),
                    TextSpan(
                      text: 'Rescue breathing can be mouth-to-mouth breathing or mouth-to-nose breathing if the mouth is seriously injured or cant be opened. Current recommendations suggest performing rescue breathing using a bag-mask device with a high-efficiency particulate air (HEPA) filter.\n'
                      '1. After opening the airway (using the head-tilt, chin-lift maneuver), pinch the nostrils shut for mouth-to-mouth breathing and cover the persons mouth with yours, making a seal.\n'
                      '2. Prepare to give two rescue breaths. Give the first rescue breath — lasting one second — and watch to see if the chest rises.\n'
                      '3. If the chest rises, give a second breath.\n'
                      '4. If the chest does not rise, repeat the head-tilt, chin-lift maneuver and then give a second breath. Thirty chest compressions followed by two rescue breaths is considered one cycle. Be careful not to provide too many breaths or to breathe with too much force.\n'
                      '5. Continue chest compressions to restore blood flow.\n'
                      '6. As soon as an automated external defibrillator (AED) is available, apply it and follow the prompts. Give one shock, then continue chest compressions for two more minutes before giving a second shock. If you are not trained to use an AED, a 911 operator or another emergency medical operator may be able to give you instructions. If an AED is not available, go to step 5 below.\n'
                      '7. Continue CPR until there are signs of movement or emergency medical personnel take over.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTo perform CPR on a child\n'
                    ),
                    TextSpan(
                      text: '\nThe procedure for giving CPR to a child age 1 through puberty is essentially the same as that for an adult — follow the C-A-B steps. The American Heart Association says you should not delay CPR and offers this advice on how to perform CPR on a child:\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCompressions: Restore blood flow\n'
                    ),
                    TextSpan(
                      text: '\nIf you are alone and did not see the child collapse, start chest compressions for about two minutes. Then quickly call 911 or your local emergency number and get the AED if one is available.\n'
                      'If you are alone and you did see the child collapse, call 911 or your local emergency number first. Then get the AED, if available, and start CPR. If another person is with you, have that person call for help and get the AED while you start CPR.\n'
                      '\n1. Place the child on their back on a firm surface.\n'
                      '2. Kneel next to the childs neck and shoulders.\n'
                      '3. Place two hands — or only one hand if the child is very small — on the lower half of the childs breastbone.\n'
                      '4. Using the heel of one or both hands, press straight down on the chest about 2 inches (approximately 5 centimeters) but not greater than 2.4 inches (approximately 6 centimeters). Push hard and fast — 100 to 120 compressions a minute.\n'
                      '5. If you have not been trained in CPR, continue chest compressions until the child moves or until emergency medical personnel take over. If you have been trained in CPR, open the airway and start rescue breathing.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nAirway: Open the airway\n'
                    ),
                    TextSpan(
                      text: '\nIf you are trained in CPR and you have performed 30 chest compressions, open the childs airway using the head-tilt, chin-lift maneuver.\n'                      
                      '\n-> Place your palm on the childs forehead and gently tilt their head back.\n'
                      '-> With the other hand, gently lift the chin forward to open the airway.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nBreathing: Breathe for the child\n'
                    ),
                    TextSpan(
                      text: '\nFollow these steps for mouth-to-mouth breathing for a child.\n'                      
                      '\n1. After using the head-tilt, chin-lift maneuver to open the airway, pinch the childs nostrils shut. Cover the childs mouth with yours, making a seal.\n'                      
                      '\n2. Breathe into the childs mouth for one second. Watch to see if the chest rises. If it rises, give a second breath. If the chest does not rise, repeat the head-tilt, chin-lift maneuver first. Then give the second breath. Be careful not to provide too many breaths or to breathe with too much force.\n'
                      '\n3. After the two breaths, immediately begin the next cycle of compressions and breaths. Note: If there are two people available to do CPR on the child, change rescuers every two minutes — or sooner if the rescuer is fatigued — and give one to two breaths every 15 compressions.\n'
                      '\n4. As soon as an AED is available, apply it and follow the prompts. As soon as an AED is available, apply it and follow the prompts. Use pediatric pads for children older than 4 weeks old and up to age 8. If pediatric pads aren not available, use adult pads. Give one shock, then restart CPR — starting with chest compressions — for two more minutes before giving a second shock. If you are not trained to use an AED, a 911 operator or another emergency medical operator may be able to give you directions.\n'
                      '\nContinue until the child moves or help arrives.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTo perform CPR on a baby 4 weeks old or older\n'
                    ),
                    TextSpan(
                      text: '\nCardiac arrest in babies is usually due to a lack of oxygen, such as from choking. If you know that the baby has an airway blockage, perform first aid for choking. If you dont know why the baby is not breathing, perform CPR.\n'
                      '\nFirst, evaluate the situation. Touch the baby and watch for a response, such as movement. Dont shake the baby.\n'                      
                      '\nIf there is no response, call 911 or your local emergency number, then immediately start CPR.\n'
                      '\nFollow the compressions, airway and breathing method for a baby under age 1. Do not follow this procedure for newborns, which include babies up to 4 weeks old.\n'
                      '\nIf you saw the baby collapse, get the AED, if one is available, before starting CPR. If another person is available, have that person call for help immediately and get the AED while you stay with the baby and perform CPR.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCompressions: Restore blood flow\n'
                    ),
                    TextSpan(
                      text: '\n1. Place the baby on their back on a firm, flat surface, such as a table or floor.\n'
                      '\n2. Imagine a horizontal line drawn between the babys nipples. Place two fingers of one hand just below this line, in the center of the chest.\n'
                      '\n3. Gently compress the chest about 1.5 inches, which is about 4 centimeters.\n'
                      '\n4. Count aloud as you push in a fairly rapid rhythm. You should push at a rate of 100 to 120 compressions a minute, just as you would when giving an adult CPR.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nAirway: Open the airway\n'
                    ),
                    TextSpan(
                      text: '\nAfter 30 compressions, gently tip the head back by lifting the chin with one hand and pushing down on the forehead with the other hand.\n'                                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nBreathing: Breathe for the baby\n'
                    ),
                    TextSpan(
                      text: '\n1. Cover the babys mouth and nose with your mouth.\n'
                      '\n2. Prepare to give two rescue breaths. Use the strength of your cheeks to deliver gentle puffs of air, instead of deep breaths from your lungs. Gently puff a breath into the babys mouth one time, taking one second for the breath. Watch to see if the babys chest rises. If it does, give a second rescue breath. If the chest does not rise, repeat the head-tilt, chin-lift maneuver and then give the second breath.\n'
                      '\n3. If the babys chest still doesn not rise, continue chest compressions.\n'
                      '\n4. Give two breaths after every 30 chest compressions. If two people are doing CPR, give one to two breaths after every 15 chest compressions.\n'                      
                      '\n5. Continue CPR until you see signs of life or until medical personnel arrive.'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),     
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.mayoclinic.org/first-aid/first-aid-cpr/basics/art-20056600]',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}


class BleedingandWoundCare extends StatefulWidget {
  @override
  _BleedingandWoundCareState createState() => _BleedingandWoundCareState();
}

class _BleedingandWoundCareState extends State<BleedingandWoundCare> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bledding and Wound Care'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nHome care for minor cuts:\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Here is what to do for a minor cut:\n'
                      '\n-> Stop bleeding by putting pressure on the area with a tissue, gauze pad, or clean cloth. The bleeding should stop after a few minutes. If the blood soaks through the gauze or cloth, add more gauze or another cloth and apply more pressure. Dont remove the gauze or cloth to check to see if it is still bleeding until you have kept the pressure for several minutes. (Removing the cloth too often will cause the clot that is forming to be broken.) If blood spurts from the wound, or it does not stop bleeding after 10 to 15 minutes of pressure, seek medical help. You may need stitches.\n'
                      '-> After bleeding stops, rinse the cut thoroughly with cool water. You can either hold the wound under running water or pour water from a cup over the wound. This may cause the bleeding to return. If so, hold pressure as you did before.\n'
                      '-> Use tweezers cleaned in rubbing alcohol to remove dirt, glass, gravel, or other foreign matter remaining in the wound.\n'
                      '-> Apply a butterfly bandage to a deeper cut after bleeding has stopped or slowed.\n'
                      '-> Apply a small amount of antibiotic ointment, unless a butterfly bandage was used. Ointment will loosen a butterfly bandage. These ointments may help prevent infection and keep the wound moist to help the healing process. Some people are sensitive to these products and may develop a rash.\n'
                      '\nIf a wound is in an area where it wont get dirty or be rubbed by clothing, it can be left uncovered except for the antibiotic ointment or butterfly bandage. If it’s in an area that will get soiled (like your hand), or an area that will be irritated by clothing (like your knee), cover it with an adhesive bandage. Change the bandage each day—or sooner, if it becomes dirty or wet—to keep the bandage clean and dry.\n'
                      '\nSome wounds, such as scrapes that cover a large area, should be kept moist to help reduce scarring. Sealed bandages work best for this purpose.\n'
                      ,

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),                                       
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.urmc.rochester.edu/encyclopedia/content.aspx?contenttypeid=1&contentid=2978]',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class Choking extends StatefulWidget {
  @override
  _ChokingState createState() => _ChokingState();
}

class _ChokingState extends State<Choking> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/composite-five-and-five-heimlich-8col.webp",
    "assets/self-heimlich-maneuver-8col.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choking'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nA step-by-step guide explaining what to do in a choking emergency.\n\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Choking happens when an object lodges in the throat or windpipe blocking the flow of air. In adults, a piece of food is usually to blame. Young children often choke on small objects. Choking is life-threatening. It cuts off oxygen to the brain. Give first aid as quickly as possible if you or someone else is choking.\n'
                      '\nWatch for these signs of choking:\n\n'
                      '->One or both hands clutched to the throat\n'
                      '->A look of panic, shock or confusion\n'
                      '->Inability to talk\n'
                      '->Strained or noisy breathing\n'
                      '->Squeaky sounds when trying to breathe\n'
                      '->Cough, which may either be weak or forceful\n'
                      '->Skin, lips and nails that change color turning blue or gray\n'
                      '->Loss of consciousness\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 
                      '\nIf a choking person can cough forcefully, let the person keep coughing.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: 
                      'Coughing might naturally remove the stuck object.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: 
                      '\nIf a person cant cough, talk, cry or laugh forcefully, give first aid to the person.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: 
                      '\nThe American Red Cross recommends the following steps:\n'
                      '\n->Give five back blows. Stand to the side and just behind a choking adult. For a child, kneel down behind. Place your arm across the persons chest to support the persons body. Bend the person over at the waist to face the ground. Strike five separate times between the persons shoulder blades with the heel of your hand.\n'
                      '\n->Give five abdominal thrusts. If back blows dont remove the stuck object, give five abdominal thrusts, also known as the Heimlich maneuver.\n'
                      '\n->Alternate between five blows and five thrusts until the blockage is dislodged.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text:
                        '\nSome sources only teach the abdominal thrust. Its OK not to use back blows if you havent learned the back-blow technique. Both approaches are acceptable for adults and children older than age 1.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: '\nTo give abdominal thrusts to someone else:\n'
                    ),
                    TextSpan(
                      text:
                        '\n->Stand behind the person. For a child, kneel down behind. Place one foot slightly in front of the other for balance. Wrap your arms around the waist. Tip the person forward slightly.\n'
                        '->Make a fist with one hand. Put it just above the persons navel.\n'
                        '->Grasp the fist with the other hand. Press into the stomach, also called the abdomen, with a quick, upward thrust — as if trying to lift the person up. For a child, use gentle yet firm pressure to avoid damaging the internal organs.\n'
                        '->Give five abdominal thrusts. Check if the blockage has been removed. Repeat as needed.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: '\nTo clear the airway of a choking infant younger than age 1:\n'
                    ),
                    TextSpan(
                      text:
                      '\n-> Sit and hold the infant facedown on your forearm. Rest your forearm on your thigh. Hold the infants chin and jaw to support the head. Place the head lower than the trunk.\n' 
                      '-> Thump the infant gently but firmly five times on the middle of the back. Use the heel of your hand. Point your fingers up so that you dont hit the back of the infants head. Gravity and the back thumps should release the blockage.\n'
                      '-> Turn the infant faceup on your forearm if breathing hasnt started. Rest your arm on your thigh. Place the infants head lower than the trunk.\n'
                      '-> Give five gentle but firm chest compressions with your fingers. Place two fingers just below the nipple line. Press down about 1 1/2 inches. Let the chest rise between each compression.\n'
                      '-> Repeat the back thumps and chest compressions if breathing doesnt start. Call for emergency medical help.\n'
                      '-> Begin infant CPR if the airway is clear but the infant doesnt start breathing.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: '\nIf you are alone and choking:\n',
                    ),
                    TextSpan(
                      text: 
                      '\nCall your local emergency number right away. Then, give yourself abdominal thrusts, also called the Heimlich maneuver, to remove the stuck object.\n'
                      '-> Place a fist slightly above your navel.\n'
                      '-> Grasp your fist with the other hand.\n'
                      '-> Bend over a hard surface. A countertop or chair will do.\n'
                      '-> Shove your fist inward and upward.\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),                     
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.mayoclinic.org/first-aid/first-aid-choking/basics/art-20056637]',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class FirstAidKitEssentials extends StatefulWidget {
  @override
  _FirstAidKitEssentialsState createState() => _FirstAidKitEssentialsState();
}

class _FirstAidKitEssentialsState extends State<FirstAidKitEssentials> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Aid Kits'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nThe specific items in a first aid kit may vary based on individual needs, but here is a general list of essential items:\n\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      '1. Adhesive bandages (assorted sizes): For covering small cuts, blisters, or abrasions.\n'
                      '2. Sterile gauze pads and adhesive tape: To dress larger wounds and control bleeding.\n'
                      '3. Antiseptic wipes or solution: For cleaning wounds and preventing infection.\n'
                      '4. Scissors and tweezers: For cutting tape, gauze, or clothing and removing splinters or ticks.\n'
                      '5. Disposable gloves: To protect the caregiver and the injured person from contamination.\n'
                      '6. Pain relievers: Over-the-counter pain medication like acetaminophen or ibuprofen.\n'
                      '7. Antibiotic ointment or cream: To apply to minor wounds to prevent infection.\n'
                      '8. Instant cold packs: For reducing swelling or providing relief for minor burns.\n'
                      '9. Thermometer: To monitor body temperature in case of fever or illness.\n'
                      '10. CPR face shield or mask: For performing CPR while providing a barrier between the rescuer and the person in need.\n'
                      '11. Elastic bandage (Ace bandage): For wrapping and supporting injured joints or limbs.\n'
                      '12. Triangular bandages: Can be used as slings or to secure dressings in place.\n'
                      '13.First aid manual or instruction booklet: A guide on how to administer basic first aid.\n',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),                    
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference:...... ]',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}


class WellnessQuotes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wellness Quotes'),
        backgroundColor: Colors.amber[800],
      ),
    );
  }

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
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth ~/ 60; // Adjust the maximum button width as needed

    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(6.0),
          child: FractionallySizedBox(
            widthFactor: 1.0, // Takes the full available width
            child: CustomOutlinedButton(
              text: letters[index],
              onPressed: () {
                if(letters[index]=='A'){            
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthA()));
              }else if(letters[index]=='B'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthB()));
              }else if(letters[index]=='C'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthC()));
              }else if(letters[index]=='D'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthD()));
              }else if(letters[index]=='E'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthE()));
              }else if(letters[index]=='F'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthF()));
              }
              else if(letters[index]=='O'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthO()));
              }
                // Your navigation logic here
              },
              buttonColor: Colors.amber,
            ),
          ),
        );
      },
    );
  }
}



class HealthA extends StatelessWidget {
  HealthA({Key? key}) : super(key: key);

  final List<String> buttonTexts = [
    'Abdominal Pain',
    'Acidity',
    'Button 3',
    'Button 4',
    'Adrenaline',
    'Button 6',
    'Anaemia',
    'Button 8',
    'Button 9',
    'Air Pollution',
  ];

  final List<String> specificTexts = [
    'Everybody experiences abdominal pain in their lifetime. Mostly, this crisis subsides on its own and does not require medical attention. But sometimes serious ailments also cause abdominal pain along with other symptoms. Such conditions need to be treated by intake of proper medicines. A few examples of such ailments are: ulcer, gall stone, kidney stone, urinary tract infection, endometriosis, appendicitis and many more.  Labour pain is also a type of abdominal pain. Treatment of abdominal pain depends on its proper cause. The mode of treatment may range from medication to surgery or some other procedures.',
    'Common Causes of Acidity:\n*Over-eating\n *Eating at odd times or skipping meals\n *Unhealthy eating habits like having too much tea, coffee, cold- drinks, junk, spicy, oily food etc.\n *Stomach ailments like Ulcers, Gastro-oesophageal Reflux Disease (GERD), etc.\n *A bad lifestyle like taking too much stress, sleeping less, smoking, drinking alcohol etc.\n',
    'Specific Text for Button 3',
    'Specific Text for Button 4',
    'Adrenaline is a hormone produced by the adrenal glands situated directly above the kidneys. It is released in response to stress. It is a part of "fight or flight" response system of the body. Actions: It increases blood flow to the muscles and oxygen to the lungs by •stimulating the heart rate •contracting blood vessels •dilating air passages When adrenaline is released during a potentially dangerous situation the body gets an instant physical boost with increased strength and speed, and decreased pain perception. It also enhances awareness and increases respiration. This sudden burst of energy is often referred to as an ‘adrenaline rush’. Uses: Adrenaline is added to injectable local anesthetics to prolong the action of the anesthetic agent by slowing its absorption. It is used as a drug to treat a number of conditions, some potentially life-threatening. •cardiac arrest •anaphylaxis •asthma •superficial bleeding Adrenaline secretion is increased in pheochromocytoma, hypoglycemia and myocardial infarction and decreased or absent in Addison’s disease, autonomic neuropathy, adrenal gland removal, etc.',
    'Specific Text for Button 6\nSpecific Text for Button 6\nSpecific Text for Button 6',
    'Anaemia is a condition in which the number of red blood cells or the haemoglobin concentration within them is lower than normal. Haemoglobin is needed to carry oxygen and if you have too few or abnormal red blood cells, or not enough haemoglobin, there will be a decreased capacity of the blood to carry oxygen to the body’s tissues. This results in symptoms such as fatigue, weakness, dizziness and shortness of breath, among others. The optimal haemoglobin concentration required to meet physiologic needs varies by age, sex, elevation of residence, smoking habits and pregnancy status.  Anaemia may be caused by several factors: nutrient deficiencies through inadequate diets or inadequate absorption of nutrients, infections (e.g. malaria, parasitic infections, tuberculosis, HIV), inflammation, chronic diseases, gynaecological and obstetric conditions, and inherited red blood cell disorders. The most common nutritional cause of anaemia is iron deficiency, although deficiencies in folate, vitamins B12 and A are also important causes.',
    'Specific Text for Button 8',
    'Specific Text for Button 9',
    'Air pollution is contamination of the indoor or outdoor environment by any chemical, physical or biological agent that modifies the natural characteristics of the atmosphere.Household combustion devices, motor vehicles, industrial facilities and forest fires are common sources of air pollution. Pollutants of major public health concern include particulate matter, carbon monoxide, ozone, nitrogen dioxide and sulfur dioxide. Outdoor and indoor air pollution cause respiratory and other diseases and are important sources of morbidity and mortality.',
  ];

  static final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health A'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int maxColumns = (screenWidth / 100).floor();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: buttonItems(maxColumns, context),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: specificTextWidget(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget specificTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(specificTexts.length, (index) {
        if (index == 0) {
          // Style for index 1
          return _buildStyledText(
            title: 'Abdominal Pain\n',
            text: specificTexts[index],
            image: 'assets/bg_image.jpg', // Set your image path
            titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            textStyle: TextStyle(fontSize: 18),
            titleBackgroundColor: Colors.grey[300], // Set your desired color
            textBackgroundColor: Colors.grey[200], // Set your desired color
          );
        } else if (index == 1) {
          // Style for index 1
            return _buildStyledText(
              title: 'Acidity',
              text: specificTexts[index],
              image: 'assets/bg_image.jpg', // Set your image path
              titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textStyle: TextStyle(fontSize: 18),
              titleBackgroundColor: Colors.transparent, // Set your desired color
              textBackgroundColor: Colors.transparent, // Set your desired color
            );
        } else if (index == 2) {
          // Style for index 2
          return _buildStyledText(
            title: 'Title for Button 2',
            text: specificTexts[index],
            image: 'assets/bg_image.jpg', // Set your image path
            titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textStyle: TextStyle(fontSize: 18),
            titleBackgroundColor: Colors.grey[300], // Set your desired color
            textBackgroundColor: Colors.grey[300], // Set your desired color
          );
        } else if (index == 3) {
          // Style for index 3
          return _buildStyledText(
            title: 'Title for Button 3',
            text: specificTexts[index],
            image: 'assets/bg_image.jpg', // Set your image path
            titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textStyle: TextStyle(fontSize: 18),
            titleBackgroundColor: Colors.transparent, // Set your desired color
            textBackgroundColor: Colors.transparent, // Set your desired color
          );
        } else if (index == 4) {
          // Style for index 4
          return _buildStyledText(
            title: 'Adrenaline\n',
            text: specificTexts[index],
            image: 'assets/bg_image.jpg', // Set your image path
            titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            textStyle: TextStyle(fontSize: 18),
            titleBackgroundColor: Colors.grey[300], // Set your desired color
            textBackgroundColor: Colors.grey[300], // Set your desired color
          );
        } else if (index == 6) {
          // Style for index 4
          return _buildStyledText(
            title: 'Anaemia\n',
            text: specificTexts[index],
            image: 'assets/bg_image.jpg', // Set your image path
            titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
            textStyle: TextStyle(fontSize: 18),
            titleBackgroundColor: Colors.grey[300], // Set your desired color
            textBackgroundColor: Colors.grey[300], // Set your desired color
          );
        } else if (index == 9) {
          // Style for index 1
            return _buildStyledText(
              title: 'Air Pollution\n',
              text: specificTexts[index],
              image: 'assets/bg_image.jpg', // Set your image path
              titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
              textStyle: TextStyle(fontSize: 18),
              titleBackgroundColor: Colors.grey[300], // Set your desired color
              textBackgroundColor: Colors.grey[200], // Set your desired color
            );
          }
        else {
          // Default style for other indices
          return _buildStyledText(
            text: specificTexts[index],
            textStyle: TextStyle(fontSize: 18),
            textBackgroundColor: Colors.transparent, // No background color
          );
        }
      }),
    );
  }

  Widget _buildStyledText({
    String? title,
    required String text,
    String? image,
    TextStyle? titleStyle,
    required TextStyle textStyle,
    Color? titleBackgroundColor,
    Color? textBackgroundColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Container(
            padding: EdgeInsets.all(10.0),
            color: titleBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                if (image != null)
                  Image.asset(
                    image,
                    height: 200, // Set your desired image height
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          ),
        Container(
          color: textBackgroundColor,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SelectableText(
              text,
              style: textStyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buttonItems(int maxColumns, BuildContext context) {
    return List.generate(buttonTexts.length, (index) {
      return ButtonTheme(
        minWidth: 0,
        child: MaterialButton(
          onPressed: () {
            scrollController.animateTo(
              MediaQuery.of(context).size.height * index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), 
            side: BorderSide(color: Colors.amber)       
          ),        
          child: Text(
            buttonTexts[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      );
    });
  }
}




class HealthB extends StatelessWidget {
  HealthB({Key? key}) : super(key: key);

  final List<String> buttonTexts = [
    'Back Pain',
    'Bacteria',
    'Bad Cholesterol',
    'Bird Flu',
    'Blood Platelet',
    'Brain Health',
    'Breathlessness',
    'Brittle Nails',
    'Brushing',
    'Burn',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health A-Z'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: buttonItems(context),
        ),
      ),
    );
  }

  List<Widget> buttonItems(BuildContext context) {
    return buttonTexts.asMap().entries.map((entry) {
      final index = entry.key;
      final text = entry.value;

      return ButtonTheme(
        alignedDropdown: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 50.0, // Minimum width for each button
          ),
          child: OutlinedButton(
            onPressed: () {
              performButtonAction(index, context);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(color: Colors.amber),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  void performButtonAction(int index, BuildContext context) {
    if (index == 0) {
      // Action for Button 1
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthBackPain()));
    } else if (index == 1) {
      // Action for Button 2
     
    } 
    // Add more else-if blocks for other buttons
  }
}
class HealthBackPain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back Pain'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Back pain is classified in terms of duration of symptoms.\n',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 
                ' 1. Acute back pain lasts <6 weeks\n'
                ' 2. Subacute back pain lasts between 6 and 12 weeks.\n'
                ' 3. Chronic back pain lasts for greater than 12 weeks.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '\n\nThere are many causes of back pain, including blood vessels, internal organs, infections, mechanical and autoimmune causes.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              // Add more TextSpans with different styles as needed
            ],
          ),
        ),
      ),
    );
  }
}


class HealthC extends StatelessWidget {
  HealthC({Key? key}) : super(key: key);

  final List<String> buttonTexts = [
    'Back Pain',
    'Bacteria',
    'Bad Cholesterol',
    'Bird Flu',
    'Blood Platelet',
    'Brain Health',
    'Breathlessness',
    'Brittle Nails',
    'Brushing',
    'Burn',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health A-Z'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int maxColumns = (screenWidth / 100).floor(); // Adjust the button width as needed

            return SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 4.0,
                runSpacing: 4.0,
                children: buttonItems(maxColumns, context),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> buttonItems(int maxColumns, BuildContext context) {
    return List.generate(buttonTexts.length, (index) {
      return FractionallySizedBox(
        widthFactor: 1.0 / maxColumns, // Distribute available width equally
        child: OutlinedButton(
          onPressed: () {
            performButtonAction(index, context);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            buttonTexts[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      );
    });
  }

  void performButtonAction(int index, BuildContext context) {
    if (index == 0) {
      // Action for Button 1
    
    } else if (index == 1) {
      // Action for Button 2
     
    } 
    // Add more else-if blocks for other buttons
  }
}

class HealthD extends StatelessWidget {
  final List<String> categories = [
    'Dengue Fever',
    'Dental Health',
    'Depression',
    'Diarrhea',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health D'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(        

        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.health_and_safety ),
              title: Text(categories[index]),
              subtitle: Text('Tap for info'),
              onTap: () {
                if(index == 0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DengueFever()));
                }else if(index == 1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Choking()));
                }else if(index == 2){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstAidKitEssentials()));
                }else if(index == 3){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BleedingandWoundCare()));
                }
                
                // Add navigation or detailed information for each category
                // For simplicity, let's just print the selected category for now
                print('Selected Category: ${categories[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

class DengueFever extends StatefulWidget {
  @override
  _DengueFeverState createState() => _DengueFeverState();
}

class _DengueFeverState extends State<DengueFever> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dengue Fever'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nSymptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Most people with dengue have mild or no symptoms and will get better in 1 to 2 weeks. Rarely, dengue can be severe and lead to death.\n'
                      '\nIf symptoms occur, they usually begin 4 to 10 days after infection and last for 2 to 7 days. Symptoms may include:\n'
                      '-> high fever (40°C/104°F)\n'
                      '-> severe headache\n'
                      '-> pain behind the eyes\n'
                      '-> muscle and joint pains\n'
                      '-> nausea\n'
                      '-> vomiting\n'
                      '-> swollen glands\n'
                      '-> rash.\n'
                      '\nIndividuals who are infected for the second time are at greater risk of severe dengue.\n'
                      '\nSevere dengue symptoms often come after the fever has gone away:\n'
                      '-> severe abdominal pain\n'
                      '-> persistent vomiting\n'
                      '-> rapid breathing\n'
                      '-> bleeding gums or nose\n'
                      '-> fatigue\n'
                      '-> restlessness\n'
                      '-> blood in vomit or stool\n'
                      '-> being very thirsty\n'
                      '-> pale and cold skin\n'
                      '-> feeling weak.\n'
                      '\nPeople with these severe symptoms should get care right away.\n'
                      '\nAfter recovery, people who have had dengue may feel tired for several weeks.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nDiagnostics and treatment\n'
                    ),
                    TextSpan(
                      text: '\nMost cases of dengue fever can be treated at home with pain medicine. Preventing mosquito bites is the best way to avoid getting dengue.'
                      '\nThere is no specific treatment for dengue. The focus is on treating pain symptoms.\n'
                      '\nAcetaminophen (paracetamol) is often used to control pain. Non-steroidal anti-inflammatory drugs like ibuprofen and aspirin are avoided as they can increase the risk of bleeding.\n'
                      '\nThere is a vaccine called Dengvaxia for people who have had dengue at least once and live in places where the disease is common.\n'
                      '\nFor people with severe dengue, hospitalization is often needed.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                      )
                    ),
                    TextSpan(
                      text: '\nPrevention and control\n'
                    ),
                    TextSpan(
                      text: '\nThe mosquitoes that spread dengue are active during the day.\n'
                      '\nLower the risk of getting dengue by protecting yourself from mosquito bites by using:\n'
                      '\n-->clothes that cover as much of your body as possible\n'
                      '-->mosquito nets if sleeping during the day, ideally nets sprayed with insect repellent\n'
                      '-->window screens\n'
                      '-->mosquito repellents (containing DEET, Picaridin or IR3535)\n'
                      '-->coils and vaporizers.\n'
                      '\nIf you get dengue, its important to:\n'
                      '\n-->rest'
                      '-->drink plenty of liquids\n'
                      '-->use acetaminophen (paracetamol) for pain\n'
                      '-->avoid non-steroidal anti-inflammatory drugs, like ibuprofen and aspirin\n'
                      '-->watch for severe symptoms and contact your doctor as soon as possible if you notice any.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                      )
                    ), 
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.who.int/news-room/fact-sheets/detail/dengue-and-severe-dengue#:~:text=Dengue%20(break%2Dbone%20fever),body%20aches%2C%20nausea%20and%20rash.',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthE extends StatelessWidget {
  final List<String> categories = [
    'Ear Infection',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health E'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(        

        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.health_and_safety ),
              title: Text(categories[index]),
              subtitle: Text('Tap for info'),
              onTap: () {
                if(index == 0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EarInfection()));
                }
                
                // Add navigation or detailed information for each category
                // For simplicity, let's just print the selected category for now
                print('Selected Category: ${categories[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

class EarInfection extends StatefulWidget {
  @override
  _EarInfectionState createState() => _EarInfectionState();
}

class _EarInfectionState extends State<EarInfection> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ear Infection'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nSymptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'The onset of signs and symptoms of ear infection is usually rapid.\n'                      
                      '\nSigns and symptoms common in children include:\n'
                      '--> Ear pain, especially when lying down\n'
                      '--> Tugging or pulling at an ear\n'
                      '--> Trouble sleeping\n'
                      '--> Crying more than usual\n'
                      '--> Fussiness\n'
                      '--> Trouble hearing or responding to sounds\n'
                      '--> Loss of balance\n'
                      '--> Fever of 100 F (38 C) or higher\n'
                      '--> Drainage of fluid from the ear\n'
                      '--> Headache\n'
                      '--> Loss of appetite\n'
                      '\nCommon signs and symptoms in adults include:\n'
                      '--> Ear pain\n'
                      '--> Drainage of fluid from the ear\n'
                      '--> Trouble hearing\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ), 
                    TextSpan(
                      text: '\nCauses',
                      style: TextStyle(
                        fontSize: 20
                      )
                    ),
                    TextSpan(
                      text: '\n\nAn ear infection is caused by a bacterium or virus in the middle ear. This infection often results from another illness — cold, flu or allergy — that causes congestion and swelling of the nasal passages, throat and eustachian tubes.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      'The following tips may reduce the risk of developing ear infections:\n'                      
                      '\n--> Prevent common colds and other illnesses. Teach your children to wash their hands frequently and thoroughly and to not share eating and drinking utensils. Teach your children to cough or sneeze into their elbow. If possible, limit the time your child spends in group child care. A child care setting with fewer children may help. Try to keep your child home from child care or school when ill.\n'
                      '--> Avoid secondhand smoke. Make sure that no one smokes in your home. Away from home, stay in smoke-free environments.\n'
                      '--> Breast-feed your baby. If possible, breast-feed your baby for at least six months. Breast milk contains antibodies that may offer protection from ear infections.\n'
                      '--> If you bottle-feed, hold your baby in an upright position. Avoid propping a bottle in your babys mouth while he or she is lying down. Dont put bottles in the crib with your baby.\n'
                      '--> Talk to your doctor about vaccinations. Ask your doctor about what vaccinations are appropriate for your child. Seasonal flu shots, pneumococcal and other bacterial vaccines may help prevent ear infections.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ), 
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/ear-infections/symptoms-causes/syc-20351616',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthF extends StatelessWidget {
  final List<String> categories = [
    'Frozen Shoulder',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health F'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(        

        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.health_and_safety ),
              title: Text(categories[index]),
              subtitle: Text('Tap for info'),
              onTap: () {
                if(index == 0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FrozenShoulder()));
                }
                
                // Add navigation or detailed information for each category
                // For simplicity, let's just print the selected category for now
                print('Selected Category: ${categories[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

class FrozenShoulder extends StatefulWidget {
  @override
  _FrozenShoulderState createState() => _FrozenShoulderState();
}

class _FrozenShoulderState extends State<FrozenShoulder> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frozen Shoulder'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nSymptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Frozen shoulder typically develops slowly in three stages.\n'
                      '--> Freezing stage. Any movement of the shoulder causes pain, and the shoulders ability to move becomes limited. This stage lasts from 2 to 9 months.\n'
                      '--> Frozen stage. Pain might lessen during this stage. However, the shoulder becomes stiffer. Using it becomes more difficult. This stage lasts from 4 to 12 months.\n'
                      '--> Thawing stage. The shoulders ability to move begins to improve. This stage lasts from 5 to 24 months.\n'
                      'For some people, the pain worsens at night, sometimes disrupting sleep.\n'                    
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ), 
                    TextSpan(
                      text: '\nCauses',
                      style: TextStyle(
                        fontSize: 20
                      )
                    ),
                    TextSpan(
                      text: '\n\nThe shoulder joint is enclosed in a capsule of connective tissue. Frozen shoulder occurs when this capsule thickens and tightens around the shoulder joint, restricting its movement.\n'
                      '\nIts unclear why this happens to some people. But its more likely to happen after keeping a shoulder still for a long period, such as after surgery or an arm fracture.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nOne of the most common causes of frozen shoulder is not moving a shoulder while recovering from a shoulder injury, broken arm or stroke. If you have had an injury that makes it difficult to move your shoulder, talk to your health care provider about exercises that can help you maintain your ability to move your shoulder joint.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ), 
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/ear-infections/symptoms-causes/syc-20351616',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthO extends StatelessWidget {
  final List<String> categories = [
    'Oral Health',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health O'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(        

        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.health_and_safety ),
              title: Text(categories[index]),
              subtitle: Text('Tap for info'),
              onTap: () {
                if(index == 0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OralHealth()));
                }
                
                // Add navigation or detailed information for each category
                // For simplicity, let's just print the selected category for now
                print('Selected Category: ${categories[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}
class OralHealth extends StatefulWidget {
  @override
  _OralHealthState createState() => _OralHealthState();
}

class _OralHealthState extends State<OralHealth> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oral Health'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                    }
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const SelectableText.rich(   
                TextSpan(
                  text: '\nHow can I protect my oral health?\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'To protect your oral health, practice good oral hygiene daily.\n'                      
                      '\n--> Brush your teeth at least twice a day for two minutes each time. Use a soft-bristled brush and fluoride toothpaste.\n'
                      '--> Floss daily.\n'
                      '--> Use mouthwash to remove food particles left after brushing and flossing.\n'
                      '--> Eat a healthy diet and limit sugary food and drinks.\n'
                      '--> Replace your toothbrush every three to four months, or sooner if bristles are splayed or worn.\n'
                      '--> Schedule regular dental checkups and cleanings.\n'
                      '--> Avoid tobacco use.\n'
                      '\nAlso, contact your dentist as soon as an oral health problem arises. Taking care of your oral health is an investment in your overall health.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),  
                  ] 
                ), 
                textAlign: TextAlign.justify,
              ),  
            ),
            SizedBox(
              height: 300,
              child: PhotoViewGallery.builder(
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imagePaths[1]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    basePosition: Alignment.center,
                  );
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                pageController: PageController(initialPage: currentImageIndex),
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const SelectableText.rich(
                TextSpan(
                  text: '\n[Reference: https://www.mayoclinic.org/healthy-lifestyle/adult-health/in-depth/dental/art-20047475',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

/*class HealthD extends StatelessWidget {
  HealthD({Key? key}) : super(key: key);

  final List<String> buttonTexts = [
    'Abdominal Pain',
    'Acidity',
    'Button 3',
    'Button 4',
    'Button 5',
    'Button 6',
    'Button 7',
    'Button 8',
    'Button 9',
    'Button 10',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health A-Z'),
        backgroundColor: Colors.amber[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int maxColumns = (screenWidth / 100).floor(); // Adjust the button width as needed

            return SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 4.0,
                runSpacing: 4.0,
                children: buttonItems(maxColumns, context),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> buttonItems(int maxColumns, BuildContext context) {
    return List.generate(buttonTexts.length, (index) {
      return FractionallySizedBox(
        widthFactor: 1.0 / maxColumns, // Distribute available width equally
        child: OutlinedButton(
          onPressed: () {
            performButtonAction(index, context);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            buttonTexts[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      );
    });
  }

  void performButtonAction(int index, BuildContext context) {
    if (index == 0) {
      // Action for Button 1
    
    } else if (index == 1) {
      // Action for Button 2
     
    } 
    // Add more else-if blocks for other buttons
  }
}*/


  



/*class VitaminButton extends StatelessWidget {
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
}*/

class SubcategoryScreen extends StatelessWidget {
  final List<String> subcategories;

  SubcategoryScreen(this.subcategories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategories'),
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcategories[index]),
          );
        },
      ),
    );
  }
}
/*class SubcategoryListOfVitamin extends StatelessWidget {
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
            //maxSize: 60,
            //minSize: 40,
            
          
          ),

          RoundedButton(
            text: "Vitamin B",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VitaminB()));
            
            },
            buttonColor: Colors.green,
            //maxSize: 60,
            //minSize: 40,
          ),

          RoundedButton(text: "Vitamin C", onPressed: () => print("Button 3 pressed"), buttonColor: Colors.blue,/*maxSize: 60,minSize: 40,*/),
          RoundedButton(text: "Vitamin D", onPressed: () => print("Button 4 pressed"), buttonColor: Colors.orange,/*maxSize: 60,minSize: 40,*/),
          RoundedButton(text: "Vitamin E", onPressed: () => print("Button 5 pressed"), buttonColor: Colors.purple,/*maxSize: 60,minSize: 40,*/),
          RoundedButton(text: "Vitamin K", onPressed: () => print("Button 6 pressed"), buttonColor: Colors.teal,/*maxSize: 60,minSize: 40,*/),
        ],
      ),
    );
  }
}*/

/*class BloodPressureButton extends StatelessWidget {
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
}*/
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

/*class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final double maxSize; // Specify the maximum size
  final double minSize; // Specify the minimum size

  const RoundedButton({
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.minSize,
    required this.maxSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the button size based on screen width while keeping it within the max and min bounds
    final buttonSize = screenWidth < minSize ? minSize : screenWidth > maxSize ? maxSize : screenWidth;

    return Transform.rotate(
      angle: -pi / 90.0, // Rotate each button by 30 degrees (pi/6)
      child: Container(
        //width: buttonSize,
        //height: buttonSize,
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
}*/


class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;

  CustomOutlinedButton({
    required this.text,
    required this.onPressed,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      side: BorderSide(color: buttonColor)
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;

  const RoundedButton({required this.text, required this.onPressed, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 90.0, // Rotate each button by 30 degrees (pi/6)
      child: SizedBox(
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
                children: const <TextSpan>[
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
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B2',
                  onPressed: (){},
                  buttonColor: Colors.green,
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B5',
                  onPressed: (){},
                  buttonColor: Colors.blueAccent,
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B7',
                  onPressed: (){},
                  buttonColor: Colors.yellow,
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B9',
                  onPressed: (){},
                  buttonColor: Colors.purple,
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B10',
                  onPressed: (){},
                  buttonColor: Colors.teal,
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B11',
                  onPressed: (){},
                  buttonColor: Colors.grey,
                  //maxSize: 60,
                  //minSize: 40,
                ),
                RoundedButton(
                  text: 'B12',
                  onPressed: (){},
                  buttonColor: Colors.deepPurple,
                  //maxSize: 60,
                  //minSize: 40,
                ),
              ],
            ),
        ),        
      ),                        
    ); 
  }
} 
