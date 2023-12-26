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
              }else if(letters[index]=='H'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthH()));
              }else if(letters[index]=='I'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthI()));
              }else if(letters[index]=='K'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthK()));
              }else if(letters[index]=='L'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthL()));
              }else if(letters[index]=='M'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthM()));
              }else if(letters[index]=='N'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthN()));
              }else if(letters[index]=='O'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthO()));
              }else if(letters[index]=='P'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthP()));
              }else if(letters[index]=='Q'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthQ()));
              }else if(letters[index]=='R'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthR()));
              }else if(letters[index]=='S'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthS()));
              }else if(letters[index]=='T'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthT()));
              }else if(letters[index]=='U'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthU()));
              }else if(letters[index]=='V'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthV()));
              }else if(letters[index]=='W'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthW()));
              }else if(letters[index]=='X'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthX()));
              }else if(letters[index]=='Y'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthY()));
              }else if(letters[index]=='Z'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthZ()));
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



/*class HealthA extends StatelessWidget {
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
}*/

class HealthA extends StatelessWidget {
  final List<String> categories = [
    'Abdominal Pain',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health A'),
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

class HealthB extends StatelessWidget {
  final List<String> categories = [
    'Back Pain',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health B'),
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

/*class HealthBackPain extends StatelessWidget {
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
}*/


class HealthC extends StatelessWidget {
  final List<String> categories = [
    'Chest Pain',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health C'),
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/frozen-shoulder/symptoms-causes/syc-20372684#:~:text=Frozen%20shoulder%20occurs%20when%20the,within%201%20to%203%20years.',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthH extends StatelessWidget {
  final List<String> categories = [
    'Heart Attack',    
    
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeartAttack()));
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
class HeartAttack extends StatefulWidget {
  @override
  _HeartAttackState createState() => _HeartAttackState();
}

class _HeartAttackState extends State<HeartAttack> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Attack'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Common heart attack symptoms include:\n'
                      '\n--> Chest pain that may feel like pressure, tightness, pain, squeezing or aching\n'
                      '--> Pain or discomfort that spreads to the shoulder, arm, back, neck, jaw, teeth or sometimes the upper belly\n'
                      '--> Cold sweat\n'
                      '--> Fatigue\n'
                      '--> Heartburn or indigestion\n'
                      '--> Lightheadedness or sudden dizziness\n'
                      '--> Nausea\n'
                      '--> Shortness of breath\n'
                      '\nWomen may have atypical symptoms such as brief or sharp pain felt in the neck, arm or back. Sometimes, the first symptom sign of a heart attack is sudden cardiac arrest.\n'
                      '\nSome heart attacks strike suddenly. But many people have warning signs and symptoms hours, days or weeks in advance. Chest pain or pressure (angina) that keeps happening and doesnt go away with rest may be an early warning sign. Angina is caused by a temporary decrease in blood flow to the heart.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nCoronary artery disease causes most heart attacks. In coronary artery disease, one or more of the heart (coronary) arteries are blocked. This is usually due to cholesterol-containing deposits called plaques. Plaques can narrow the arteries, reducing blood flow to the heart.\n'
                      '\nIf a plaque breaks open, it can cause a blood clot in the heart.\n'
                      '\nA heart attack may be caused by a complete or partial blockage of a heart (coronary) artery. One way to classify heart attacks is whether an electrocardiogram (ECG or EKG) shows some specific changes (ST elevation) that require emergency invasive treatment. Your health care provider may use electrocardiogram (ECG) results to describe these types of heart attacks.\n'
                      '--> An acute complete blockage of a medium or large heart artery usually means you have had an ST elevation myocardial infarction (STEMI).\n'
                      '--> A partial blockage often means you have had a non-ST elevation myocardial infarction (NSTEMI). However, some people with non-ST elevation myocardial infarction (NSTEMI) have a total blockage.\n'
                      '\nNot all heart attacks are caused by blocked arteries. Other causes include:\n'
                      '\n--> Coronary artery spasm. This is a severe squeezing of a blood vessel thats not blocked. The artery generally has cholesterol plaques or there is early hardening of the vessel due to smoking or other risk factors. Other names for coronary artery spasms are Prinzmetals angina, vasospastic angina or variant angina.\n'
                      '--> Certain infections. COVID-19 and other viral infections may cause damage to the heart muscle.\n'
                      '--> Spontaneous coronary artery dissection (SCAD). This life-threatening condition is caused by a tear inside a heart artery.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nIts never too late to take steps to prevent a heart attack — even if you have already had one. Here are ways to prevent a heart attack.\n'
                      '\n--> Follow a healthy lifestyle. Dont smoke. Maintain a healthy weight with a heart-healthy diet. Get regular exercise and manage stress.\n'
                      '--> Manage other health conditions. Certain conditions, such as high blood pressure and diabetes, can increase the risk of heart attacks. Ask your health care provider how often you need checkups.\n'
                      '--> Take medications as directed. Your health care provider may prescribe drugs to protect and improve your heart health.\n'
                      '\nIts also a good idea to learn CPR properly so you can help someone who is having a heart attack. Consider taking an accredited first-aid training course, including CPR and how to use an automated external defibrillator (AED).'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/heart-attack/symptoms-causes/syc-20373106',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthI extends StatelessWidget {
  final List<String> categories = [
    'Insomnia',    
    
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Insomnia()));
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

class Insomnia extends StatefulWidget {
  @override
  _InsomniaState createState() => _InsomniaState();
}

class _InsomniaState extends State<Insomnia> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insomnia'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Insomnia symptoms may include:\n'
                      '\n--> Difficulty falling asleep at night\n'
                      '--> Waking up during the night\n'
                      '--> Waking up too early\n'
                      '--> Not feeling well-rested after a nights sleep\n'
                      '--> Daytime tiredness or sleepiness\n'
                      '--> Irritability, depression or anxiety\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nCommon causes of chronic insomnia include:\n'                      
                      '--> Stress. Concerns about work, school, health, finances or family can keep your mind active at night, making it difficult to sleep. Stressful life events or trauma — such as the death or illness of a loved one, divorce, or a job loss — also may lead to insomnia.\n'
                      '--> Travel or work schedule. Your circadian rhythms act as an internal clock, guiding such things as your sleep-wake cycle, metabolism and body temperature. Disrupting your bodys circadian rhythms can lead to insomnia. Causes include jet lag from traveling across multiple time zones, working a late or early shift, or frequently changing shifts.\n'
                      '--> Poor sleep habits. Poor sleep habits include an irregular bedtime schedule, naps, stimulating activities before bed, an uncomfortable sleep environment, and using your bed for work, eating or watching TV. Computers, TVs, video games, smartphones or other screens just before bed can interfere with your sleep cycle.\n'
                      '--> Eating too much late in the evening. Having a light snack before bedtime is OK, but eating too much may cause you to feel physically uncomfortable while lying down. Many people also experience heartburn, a backflow of acid and food from the stomach into the esophagus after eating, which may keep you awake.\n'
                      '\nAdditional common causes of insomnia include:\n'
                      '\n--> Mental health disorders. Anxiety disorders, such as post-traumatic stress disorder, may disrupt your sleep. Awakening too early can be a sign of depression. Insomnia often occurs with other mental health disorders as well.\n'
                      '--> Medications. Many prescription drugs can interfere with sleep, such as certain antidepressants and medications for asthma or blood pressure. Many over-the-counter medications — such as some pain medications, allergy and cold medications, and weight-loss products — contain caffeine and other stimulants that can disrupt sleep.\n'
                      '--> Medical conditions. Examples of conditions linked with insomnia include chronic pain, cancer, diabetes, heart disease, asthma, gastroesophageal reflux disease (GERD), overactive thyroid, Parkinsons disease and Alzheimers disease.\n'
                      '--> Sleep-related disorders. Sleep apnea causes you to stop breathing periodically throughout the night, interrupting your sleep. Restless legs syndrome causes unpleasant sensations in your legs and an almost irresistible desire to move them, which may prevent you from falling asleep.\n'
                      '--> Caffeine, nicotine and alcohol. Coffee, tea, cola and other caffeinated drinks are stimulants. Drinking them in the late afternoon or evening can keep you from falling asleep at night. Nicotine in tobacco products is another stimulant that can interfere with sleep. Alcohol may help you fall asleep, but it prevents deeper stages of sleep and often causes awakening in the middle of the night.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nGood sleep habits can help prevent insomnia and promote sound sleep:\n'
                      '\n--> Keep your bedtime and wake time consistent from day to day, including weekends.\n'
                      '--> Stay active — regular activity helps promote a good nights sleep.\n'
                      '--> Check your medications to see if they may contribute to insomnia.\n'
                      '--> Avoid or limit naps.\n'
                      '--> Avoid or limit caffeine and alcohol, and dont use nicotine.\n'
                      '--> Avoid large meals and beverages before bedtime.\n'
                      '--> Make your bedroom comfortable for sleep and only use it for sex or sleep.\n'
                      '--> Create a relaxing bedtime ritual, such as taking a warm bath, reading or listening to soft music.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/insomnia/symptoms-causes/syc-20355167',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthK extends StatelessWidget {
  final List<String> categories = [
    'Kidney Disease',    
    
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>KidneyDisease()));
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

class KidneyDisease extends StatefulWidget {
  @override
  _KidneyDiseaseState createState() => _KidneyDiseaseState();
}

class _KidneyDiseaseState extends State<KidneyDisease> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kidney Disease'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Signs and symptoms of chronic kidney disease develop over time if kidney damage progresses slowly. Loss of kidney function can cause a buildup of fluid or body waste or electrolyte problems. Depending on how severe it is, loss of kidney function can cause:\n'
                      '\n--> Nausea\n'
                      '--> Vomiting\n'
                      '--> Loss of appetite\n'
                      '--> Fatigue and weakness\n'
                      '--> Sleep problems\n'
                      '--> Urinating more or less\n'
                      '--> Decreased mental sharpness\n'
                      '--> Muscle cramps\n'
                      '--> Swelling of feet and ankles\n'
                      '--> Dry, itchy skin\n'
                      '--> High blood pressure (hypertension) thats difficult to control\n'
                      '--> Shortness of breath, if fluid builds up in the lungs\n'
                      '--> Chest pain, if fluid builds up around the lining of the heart\n'
                      '\nSigns and symptoms of kidney disease are often nonspecific. This means they can also be caused by other illnesses. Because your kidneys are able to make up for lost function, you might not develop signs and symptoms until irreversible damage has occurred.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nChronic kidney disease occurs when a disease or condition impairs kidney function, causing kidney damage to worsen over several months or years.\n'
                      'Diseases and conditions that cause chronic kidney disease include:\n'
                      '\n--> Type 1 or type 2 diabetes\n'
                      '--> High blood pressure\n'
                      '--> Glomerulonephritis (gloe-mer-u-low-nuh-FRY-tis), an inflammation of the kidneys filtering units (glomeruli)\n'
                      '--> Interstitial nephritis (in-tur-STISH-ul nuh-FRY-tis), an inflammation of the kidneys tubules and surrounding structures\n'
                      '--> Polycystic kidney disease or other inherited kidney diseases\n'
                      '--> Prolonged obstruction of the urinary tract, from conditions such as enlarged prostate, kidney stones and some cancers\n'
                      '--> Vesicoureteral (ves-ih-koe-yoo-REE-tur-ul) reflux, a condition that causes urine to back up into your kidneys\n'
                      '--> Recurrent kidney infection, also called pyelonephritis (pie-uh-low-nuh-FRY-tis)\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nTo reduce your risk of developing kidney disease:\n'
                      '\n--> Follow instructions on over-the-counter medications. When using nonprescription pain relievers, such as aspirin, ibuprofen (Advil, Motrin IB, others) and acetaminophen (Tylenol, others), follow the instructions on the package. Taking too many pain relievers for a long time could lead to kidney damage.\n'
                      '--> Maintain a healthy weight. If you are at a healthy weight, maintain it by being physically active most days of the week. If you need to lose weight, talk with your doctor about strategies for healthy weight loss.\n'
                      '--> Do not smoke. Cigarette smoking can damage your kidneys and make existing kidney damage worse. If you are a smoker, talk to your doctor about strategies for quitting. Support groups, counseling and medications can all help you to stop.\n'
                      '--> Manage your medical conditions with your doctors help. If you have diseases or conditions that increase your risk of kidney disease, work with your doctor to control them. Ask your doctor about tests to look for signs of kidney damage.\n'                      
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/chronic-kidney-disease/symptoms-causes/syc-20354521',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthL extends StatelessWidget {
  final List<String> categories = [
    'Low blood pressure (hypotension)',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health L'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LowBloodPressure()));
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

class LowBloodPressure extends StatefulWidget {
  @override
  _LowBloodPressureState createState() => _LowBloodPressureState();
}

class _LowBloodPressureState extends State<LowBloodPressure> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Low blood pressure (hypotension)'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Low blood pressure (hypotension) symptoms may include:\n'
                      '\n--> Blurred or fading vision\n'
                      '--> Dizziness or lightheadedness\n'
                      '--> Fainting\n'
                      '--> Fatigue\n'
                      '--> Trouble concentrating\n'
                      '--> Nausea\n'
                      '\nFor some people, low blood pressure may be a sign of an underlying health condition, especially when it drops suddenly or occurs with symptoms.\n'
                      '\nA sudden fall in blood pressure can be dangerous. A change of just 20 mm Hg — a drop from 110 mm Hg systolic to 90 mm Hg systolic, for example — can cause dizziness and fainting. And big drops, such as those caused by uncontrolled bleeding, severe infections or allergic reactions, can be life-threatening.\n'
                      '\nExtreme low blood pressure can lead to a condition known as shock. Symptoms of shock include:\n'
                      '\n--> Confusion, especially in older people\n'
                      '--> Cold, clammy skin\n'
                      '--> Decrease in skin coloration (pallor)\n'
                      '--> Rapid, shallow breathing\n'
                      '--> Weak and rapid pulse\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nBlood pressure is determined by the amount of blood the heart pumps and the amount of resistance to blood flow in the arteries. A blood pressure measurement is given in millimeters of mercury (mm Hg). It has two numbers:\n'
                      '\n--> Systolic pressure. The first (upper) number is the pressure in the arteries when the heart beats.\n'
                      '--> Diastolic pressure. The second (bottom) number is the pressure in the arteries when the heart rests between beats.\n'
                      '\nThe American Heart Association categorizes ideal blood pressure as normal. An ideal blood pressure is usually lower than 120/80 mm Hg.\n'
                      '\nBlood pressure varies throughout the day, depending on:\n'
                      '\n--> Body position\n'
                      '--> Breathing\n'
                      '--> Food and drink\n'
                      '--> Medications\n'
                      '--> Physical condition\n'
                      '--> Stress\n'
                      '--> Time of day\n'
                      '\nBlood pressure is usually lowest at night and rises sharply on waking. Certain health conditions and use of medications may cause low blood pressure.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nConditions that can cause low blood pressure\n'
                    ),
                    TextSpan(
                      text:
                      '\nMedical conditions that can cause low blood pressure include:\n'
                      '\n--> Pregnancy. Changes during pregnancy cause blood vessels to expand rapidly. The changes may cause blood pressure to drop. Low blood pressure is common in the first 24 weeks of pregnancy. Blood pressure usually returns to pre-pregnancy levels after giving birth.\n'
                      '--> Heart and heart valve conditions. A heart attack, heart failure, heart valve disease and an extremely low heart rate (bradycardia) can cause low blood pressure.\n'
                      '--> Hormone-related diseases (endocrine disorders). Conditions affecting the parathyroid or adrenal glands, such as Addisons disease, may cause blood pressure to drop. Low blood sugar (hypoglycemia) and, sometimes, diabetes also may lower blood pressure.\n'
                      '--> Dehydration. When the body does not have enough water, the amount of blood in the body (blood volume) decreases. This can cause blood pressure to drop. Fever, vomiting, severe diarrhea, overuse of diuretics and strenuous exercise can lead to dehydration.\n'
                      '--> Blood loss. Losing a lot of blood, such as from an injury or internal bleeding, also reduces blood volume, leading to a severe drop in blood pressure.\n'
                      '--> Severe infection (septicemia). When an infection in the body enters the bloodstream, it can lead to a life-threatening drop in blood pressure called septic shock.\n'
                      '--> Severe allergic reaction (anaphylaxis). Symptoms of a severe allergic reaction include a sudden and dramatic drop in blood pressure.\n'
                      '--> Lack of nutrients in the diet. Low levels of vitamin B-12, folate and iron can keep the body from producing enough red blood cells (anemia), which can lead to low blood pressure.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTreatment\n'
                    ),
                    TextSpan(
                      text:
                      '\nLow blood pressure (hypotension) without symptoms or with only mild symptoms rarely requires treatment.\n'
                      '\nIf low blood pressure is causing symptoms, the treatment depends on the cause. For instance, if medication causes low blood pressure, your health care provider may recommend changing or stopping the medication or lowering the dose. Do not change or stop taking your medication without first talking to your care provider.\n'
                      '\nIf its not clear whats causing low blood pressure or no treatment exists, the goal is to raise blood pressure and reduce symptoms. Depending on age, health and the type of low blood pressure, there are several ways to do this:\n'
                      '--> Use more salt. Experts usually recommend limiting salt (sodium) because it can raise blood pressure, sometimes dramatically. For people with low blood pressure, however, that can be a good thing. But too much sodium can lead to heart failure, especially in older adults. So its important to check with a health care provider before increasing salt.\n'
                      '--> Drink more water. Fluids increase blood volume and help prevent dehydration, both of which are important in treating hypotension.\n'
                      '--> Wear compression stockings. Also called support stockings, these elastic stockings are commonly used to relieve the pain and swelling of varicose veins. They improve blood flow from the legs to the heart. Some people tolerate elastic abdominal binders better than they do compression stockings.\n'
                      '--> Medications. Several drugs are available to treat low blood pressure that occurs when standing up (orthostatic hypotension). For example, the drug fludrocortisone boosts blood volume. Its often used to treat orthostatic hypotension.'
                      '\nIf you have long-term (chronic) orthostatic hypotension, midodrine (Orvaten) may be prescribed to raise standing blood pressure levels. This drug reduces the ability of the blood vessels to expand, which raises blood pressure.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nLifestyle and home remedies\n'
                    ),
                    TextSpan(
                      text:
                      '\nDepending on the reason for low blood pressure, the following steps might help reduce or prevent symptoms.\n'
                      '\n--> Drink more water, less alcohol. Alcohol is dehydrating and can lower blood pressure, even if drinking in moderation. Water increases the amount of blood in the body and prevents dehydration.\n'
                      '--> Pay attention to body positions. Gently move from lying flat or squatting to a standing position. Dont sit with legs crossed.\n'
                      '\nIf symptoms of low blood pressure begin while standing, cross the thighs like a pair of scissors and squeeze. Or put one foot on a ledge or chair and lean as far forward as possible. These moves encourage blood flow from the legs to the heart.\n'
                      '--> Eat small, low-carb meals. To help prevent blood pressure from dropping sharply after meals, eat small meals several times a day. Limit high-carbohydrate foods such as potatoes, rice, pasta and bread.\n'
                      '\nA health care provider also might recommend drinking one or two strong cups of caffeinated coffee or tea with breakfast. Caffeine can cause dehydration, however, so be sure to drink plenty of water and other fluids without caffeine.\n'
                      '--> Exercise regularly. As a general goal, aim for at least 30 minutes of moderate physical activity every day. Avoid exercising in hot, humid conditions.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/low-blood-pressure/symptoms-causes/syc-20355465',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthM extends StatelessWidget {
  final List<String> categories = [
    'Mumps',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health M'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Mumps()));
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

class Mumps extends StatefulWidget {
  @override
  _MumpsState createState() => _MumpsState();
}

class _MumpsState extends State<Mumps> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mumps'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Symptoms of mumps show up about 2 to 3 weeks after exposure to the virus. Some people may have no symptoms or very mild symptoms.\n'
                      '\nThe first symptoms may be similar to flu symptoms such as:\n'
                      '\n--> Fever\n'
                      '--> Headache\n'
                      '--> Muscle aches or pain\n'
                      '--> Not wanting to eat\n'
                      '--> Tiredness\n'
                      '\nSwelling of the salivary glands usually starts within a few days. Symptoms may include:\n'
                      '\n--> Swelling of one or both glands on the sides of the face\n'
                      '--> Pain or tenderness around the swelling\n'
                      '--> Less often, swelling of glands below the floor of the mouth\n'                    
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nMumps is caused by a type of germ called a virus. When someone has mumps, the virus is in saliva. Coughing or sneezing can release tiny droplets with the virus into the air.\n'
                      '\nYou can get the virus by breathing in tiny droplets. Or you can get the virus by touching a surface where droplets have landed and then touching your face. You also can pick up the virus from direct contact, such as kissing or sharing a water bottle.\n'
                      '\nOutbreaks in the United States most often happen where people live or work in close contact. These may include college campuses, summer camps and schools.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nMost people who have had the mumps vaccines, called fully vaccinated, are protected from mumps infections. People who are not vaccinated are more likely to get mumps.\n'
                      '\nFor some people, vaccine protection may go down over time. When fully vaccinated people get mumps, they usually have milder symptoms and fewer complications.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/mumps/symptoms-causes/syc-20375361',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}
class HealthN extends StatelessWidget {
  final List<String> categories = [
    'Neck Pain',    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health N'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NeckPain()));
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

class NeckPain extends StatefulWidget {
  @override
  _NeckPainState createState() => _NeckPainState();
}

class _NeckPainState extends State<NeckPain> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neck Pain'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Symptoms include:\n'                      
                      '\n--> Pain thats often worsened by holding the head in one place for long periods, such as when driving or working at a computer\n'
                      '--> Muscle tightness and spasms\n'
                      '--> Decreased ability to move the head\n'
                      '--> Headache\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nBecause the neck supports the weight of the head, it can be at risk of injuries and conditions that cause pain and restrict motion. Neck pain causes include:\n'
                      '\n--> Muscle strains. Overuse, such as too many hours hunched over a computer or a smartphone, often triggers muscle strains. Even minor things, such as reading in bed, can strain neck muscles.\n'
                      '--> Worn joints. As with other joints in the body, neck joints tend to wear with age. In response to this wear and tear, the body often forms bone spurs that can affect joint motion and cause pain.\n'
                      '--> Nerve compression. Herniated disks or bone spurs in the vertebrae of the neck can press on the nerves branching out from the spinal cord.\n'
                      '--> Injuries. Rear-end auto collisions often result in whiplash injury. This occurs when the head jerks backward and then forward, straining the soft tissues of the neck.\n'
                      '--> Diseases. Certain diseases, such as rheumatoid arthritis, meningitis or cancer, can cause neck pain.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nMost neck pain is associated with poor posture combined with age-related wear and tear. To help prevent neck pain, keep your head centered over your spine. Some simple changes in your daily routine may help. Consider trying to:\n'
                      '\n--> Use good posture. When standing and sitting, be sure your shoulders are in a straight line over your hips and your ears are directly over your shoulders. When using cell phones, tablets and other small screens, keep your head up and hold the device straight out rather than bending your neck to look down at the device.\n'
                      '--> Take frequent breaks. If you travel long distances or work long hours at your computer, get up, move around, and stretch your neck and shoulders.\n'
                      '--> Adjust your desk, chair and computer so that the monitor is at eye level. Knees should be slightly lower than hips. Use your chairs armrests.\n'
                      '--> If you smoke, quit. Smoking can increase the risk of developing neck pain.\n'
                      '--> Avoid carrying heavy bags with straps over your shoulder. The weight can strain your neck.\n'
                      '--> Sleep in a healthy position. Your head and neck should be aligned with your body. Use a small pillow under your neck. Try sleeping on your back with your thighs elevated on pillows, which will flatten your spinal muscles.\n'
                      '--> Stay active. If you do not move much, increase your activity level.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/neck-pain/symptoms-causes/syc-20375581',
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

class HealthP extends StatelessWidget {
  final List<String> categories = [
    'Pneumonia',    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health P'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Pneumonia()));
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

class Pneumonia extends StatefulWidget {
  @override
  _PneumoniaState createState() => _PneumoniaState();
}

class _PneumoniaState extends State<Pneumonia> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pneumonia'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'The signs and symptoms of pneumonia vary from mild to severe, depending on factors such as the type of germ causing the infection, and your age and overall health. Mild signs and symptoms often are similar to those of a cold or flu, but they last longer.\n'
                      '\nSigns and symptoms of pneumonia may include:\n'
                      '\n--> Chest pain when you breathe or cough\n'
                      '--> Confusion or changes in mental awareness (in adults age 65 and older)\n'
                      '--> Cough, which may produce phlegm\n'
                      '--> Fatigue\n'
                      '--> Fever, sweating and shaking chills\n'
                      '--> Lower than normal body temperature (in adults older than age 65 and people with weak immune systems)\n'
                      '--> Nausea, vomiting or diarrhea\n'
                      '--> Shortness of breath\n'
                      '\nNewborns and infants may not show any sign of the infection. Or they may vomit, have a fever and cough, appear restless or tired and without energy, or have difficulty breathing and eating.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nMany germs can cause pneumonia. The most common are bacteria and viruses in the air we breathe. Your body usually prevents these germs from infecting your lungs. But sometimes these germs can overpower your immune system, even if your health is generally good.\n'
                      '\nPneumonia is classified according to the types of germs that cause it and where you got the infection.\n'
                      '\nCommunity-acquired pneumonia\n'
                      '\nCommunity-acquired pneumonia is the most common type of pneumonia. It occurs outside of hospitals or other health care facilities. It may be caused by:\n'
                      '\n--> Bacteria. The most common cause of bacterial pneumonia in the U.S. is Streptococcus pneumoniae. This type of pneumonia can occur on its own or after you have had a cold or the flu. It may affect one part (lobe) of the lung, a condition called lobar pneumonia.\n'
                      '--> Bacteria-like organisms. Mycoplasma pneumoniae also can cause pneumonia. It typically produces milder symptoms than do other types of pneumonia. Walking pneumonia is an informal name given to this type of pneumonia, which typically is not severe enough to require bed rest.\n'
                      '--> Fungi. This type of pneumonia is most common in people with chronic health problems or weakened immune systems, and in people who have inhaled large doses of the organisms. The fungi that cause it can be found in soil or bird droppings and vary depending upon geographic location.\n'
                      '--> Viruses, including COVID-19. Some of the viruses that cause colds and the flu can cause pneumonia. Viruses are the most common cause of pneumonia in children younger than 5 years. Viral pneumonia is usually mild. But in some cases it can become very serious. Coronavirus 2019 (COVID-19) may cause pneumonia, which can become severe.\n'
                      '\nHospital-acquired pneumonia\n'
                      '\nSome people catch pneumonia during a hospital stay for another illness. Hospital-acquired pneumonia can be serious because the bacteria causing it may be more resistant to antibiotics and because the people who get it are already sick. People who are on breathing machines (ventilators), often used in intensive care units, are at higher risk of this type of pneumonia.\n'
                      '\nHealth care-acquired pneumonia\n'
                      '\nHealth care-acquired pneumonia is a bacterial infection that occurs in people who live in long-term care facilities or who receive care in outpatient clinics, including kidney dialysis centers. Like hospital-acquired pneumonia, health care-acquired pneumonia can be caused by bacteria that are more resistant to antibiotics.\n'
                      '\nAspiration pneumonia\n'
                      '\nAspiration pneumonia occurs when you inhale food, drink, vomit or saliva into your lungs. Aspiration is more likely if something disturbs your normal gag reflex, such as a brain injury or swallowing problem, or excessive use of alcohol or drugs.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nTo help prevent pneumonia:\n'
                      '\n--> Get vaccinated. Vaccines are available to prevent some types of pneumonia and the flu. Talk with your doctor about getting these shots. The vaccination guidelines have changed over time so make sure to review your vaccination status with your doctor even if you recall previously receiving a pneumonia vaccine.\n'
                      '--> Make sure children get vaccinated. Doctors recommend a different pneumonia vaccine for children younger than age 2 and for children ages 2 to 5 years who are at particular risk of pneumococcal disease. Children who attend a group child care center should also get the vaccine. Doctors also recommend flu shots for children older than 6 months.\n'
                      '--> Practice good hygiene. To protect yourself against respiratory infections that sometimes lead to pneumonia, wash your hands regularly or use an alcohol-based hand sanitizer.\n'
                      '--> Do not smoke. Smoking damages your lungs natural defenses against respiratory infections.\n'
                      '--> Keep your immune system strong. Get enough sleep, exercise regularly and eat a healthy diet.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/pneumonia/symptoms-causes/syc-20354204',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthQ extends StatelessWidget {
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
class HealthR extends StatelessWidget {
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

class HealthS extends StatelessWidget {
  final List<String> categories = [
    'Schizophrenia',    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health S'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Schizophrenia()));
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

class Schizophrenia extends StatefulWidget {
  @override
  _SchizophreniaState createState() => _SchizophreniaState();
}

class _SchizophreniaState extends State<Schizophrenia> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schizophrenia'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Schizophrenia involves a range of problems with thinking (cognition), behavior and emotions. Signs and symptoms may vary, but usually involve delusions, hallucinations or disorganized speech, and reflect an impaired ability to function. Symptoms may include:\n'                      
                      '\n--> Delusions. These are false beliefs that are not based in reality. For example, you think that you are being harmed or harassed; certain gestures or comments are directed at you; you have exceptional ability or fame; another person is in love with you; or a major catastrophe is about to occur. Delusions occur in most people with schizophrenia.\n'
                      '--> Hallucinations. These usually involve seeing or hearing things that do not exist. Yet for the person with schizophrenia, they have the full force and impact of a normal experience. Hallucinations can be in any of the senses, but hearing voices is the most common hallucination.\n'
                      '--> Disorganized thinking (speech). Disorganized thinking is inferred from disorganized speech. Effective communication can be impaired, and answers to questions may be partially or completely unrelated. Rarely, speech may include putting together meaningless words that can not be understood, sometimes known as word salad.\n'
                      '--> Extremely disorganized or abnormal motor behavior. This may show in a number of ways, from childlike silliness to unpredictable agitation. Behavior is not focused on a goal, so its hard to do tasks. Behavior can include resistance to instructions, inappropriate or bizarre posture, a complete lack of response, or useless and excessive movement.\n'
                      '--> Negative symptoms. This refers to reduced or lack of ability to function normally. For example, the person may neglect personal hygiene or appear to lack emotion (does not make eye contact, does not change facial expressions or speaks in a monotone). Also, the person may lose interest in everyday activities, socially withdraw or lack the ability to experience pleasure.\n'
                      '\nSymptoms can vary in type and severity over time, with periods of worsening and remission of symptoms. Some symptoms may always be present.\n'
                      '\nIn men, schizophrenia symptoms typically start in the early to mid-20s. In women, symptoms typically begin in the late 20s. Its uncommon for children to be diagnosed with schizophrenia and rare for those older than age 45.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nSymptoms in teenagers\n'
                      ,
                    ),
                    TextSpan(
                      text:
                      '\nSchizophrenia symptoms in teenagers are similar to those in adults, but the condition may be more difficult to recognize. This may be in part because some of the early symptoms of schizophrenia in teenagers are common for typical development during teen years, such as:\n'
                      '\n--> Withdrawal from friends and family\n'
                      '--> A drop in performance at school\n'
                      '--> Trouble sleeping\n'
                      '--> Irritability or depressed mood\n'
                      '--> Lack of motivation\n'
                      '\nAlso, recreational substance use, such as marijuana, methamphetamines or LSD, can sometimes cause similar signs and symptoms.\n'
                      '\nCompared with schizophrenia symptoms in adults, teens may be:\n'                      
                      '\n--> Less likely to have delusions\n'
                      '--> More likely to have visual hallucinations\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nIts not known what causes schizophrenia, but researchers believe that a combination of genetics, brain chemistry and environment contributes to development of the disorder.\n'
                      '\nProblems with certain naturally occurring brain chemicals, including neurotransmitters called dopamine and glutamate, may contribute to schizophrenia. Neuroimaging studies show differences in the brain structure and central nervous system of people with schizophrenia. While researchers are not certain about the significance of these changes, they indicate that schizophrenia is a brain disease.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nThere is no sure way to prevent schizophrenia, but sticking with the treatment plan can help prevent relapses or worsening of symptoms. In addition, researchers hope that learning more about risk factors for schizophrenia may lead to earlier diagnosis and treatment.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/schizophrenia/symptoms-causes/syc-20354443',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}


class HealthT extends StatelessWidget {
  final List<String> categories = [
    'Typhoid fever',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health S'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TyphoidFever()));
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
class TyphoidFever extends StatefulWidget {
  @override
  _TyphoidFeverState createState() => _TyphoidFeverState();
}

class _TyphoidFeverState extends State<TyphoidFever> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typhoid Fever'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Symptoms are likely to start slowly, often showing up 1 to 3 weeks after exposure to the bacteria.\n'                      
                      '\nEarly symptoms include:\n'
                      '\n--> Fever that starts low and increases throughout the day, possibly reaching as high as 104 degrees Fahrenheit (40 degrees Celsius)\n'
                      '--> Chills\n'
                      '--> Headache\n'
                      '--> Weakness and fatigue\n'
                      '--> Muscle aches\n'
                      '--> Stomach pain\n'
                      '--> Diarrhea or constipation\n'
                      '--> Rash\n'
                      '\nPeople also may have a cough, loss of appetite and sweating.\n'
                      '\nA few weeks after symptoms start, the illness can cause problems in the intestines. People may have:\n'
                      '\n--> Stomach pain\n'
                      '--> Very swollen stomach\n'
                      '--> An infection caused by gut bacteria spreading throughout the body, called sepsis\n'
                      '\nIn very serious cases, people may:\n'
                      '--> Become confused\n'
                      '--> Not be able to pay attention to anything around them\n'
                      '--> Not be able to react to the world around them\n'
                      '\nIn some people, symptoms may return up to a few weeks after the fever has gone away.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),                    
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nA bacteria strain called Salmonella enterica serotype typhi causes typhoid fever. Other strains of salmonella bacteria cause a similar disease called paratyphoid fever.\n'
                      '\nPeople pick up the bacteria most often in places where outbreaks are common. The bacteria passes out of the body in the stool and urine of people who are carrying the bacteria. Without careful hand-washing after going to the bathroom, the bacteria can move from the hands to objects or other people.\n'
                      '\nThe bacteria also can spread from a person who carries the bacteria. It can spread on food that is not cooked, such as raw fruits without a peel. In places where water is not treated to kill germs, you can pick up the bacteria from that source. This includes drinking water, using ice made from untreated water, or by drinking unpasteurized milk or juice.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTyphoid carriers\n'
                    ),
                    TextSpan(
                      text:
                      'Even after antibiotic treatment, a small number of people who recover from typhoid fever still have the bacteria living in their bodies. These people are known as chronic carriers. They no longer have symptoms of the disease. But they still shed the bacteria in their stools and spread it.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                    ),
                    TextSpan(
                      text:
                      '\nPeople can get a vaccination against typhoid fever. This is an option if you live where typhoid fever is common. It is also an option if you plan to travel to a place where the risk is high.\n'
                      '\nWhere typhoid fever is common, access to treated water helps avoid contact with the Salmonella enterica serotype typhi bacteria. Management of human waste also helps people avoid the bacteria. And careful hand-washing for people who prepare and serve food is also important.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nVaccines\n'
                    ),
                    TextSpan(
                      text:
                      'Two vaccines are available in the United States for people age 2 and older.\n'
                      '\n--> One is given as a single shot at least one week before travel.\n'
                      '--> One is given orally in four capsules, with one capsule to be taken every other day.\n'
                      '\nThe effectiveness of these vaccines wears off over time. So repeat immunization is needed.\n'
                      '\nBecause the vaccine wont provide complete protection, follow these guidelines when traveling to high-risk areas:\n'
                      '\n--> Wash your hands. Frequent hand-washing in hot, soapy water is the best way to control infection. Wash before eating or preparing food and after using the toilet. Carry an alcohol-based hand sanitizer for times when soap and water are not available.\n'
                      '--> Avoid using untreated water. Contaminated drinking water is a problem in areas where typhoid fever is common. For that reason, drink only bottled water or canned or bottled carbonated beverages, wine and beer. Carbonated bottled water is safer than noncarbonated bottled water. Ask for drinks without ice. Use bottled water to brush your teeth, and try not to swallow water in the shower.\n'
                      '--> Avoid raw fruits and vegetables. Because raw produce may have been washed in contaminated water, avoid fruits and vegetables that you cant peel, especially lettuce. To be safe, you may want to avoid raw foods.\n'
                      '--> Choose hot foods. Avoid food thats stored or served at room temperature. Freshly made, steaming hot foods may be less risky than uncooked foods.\n'
                      '--> Know where the health care providers are. Find out about medical care in the areas you will visit. Carry a list of the names, addresses and phone numbers of health care providers.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevent infecting others\n'
                    ),
                    TextSpan(
                      text:
                      'If you are recovering from typhoid fever, these measures can help keep others safe:\n'
                      '\n--> Take your antibiotics. Follow your health care providers instructions for taking your antibiotics and be sure to finish the entire prescription.\n'
                      '--> Wash your hands often. This is the single most important thing you can do to keep from spreading the infection to others. Use hot, soapy water and scrub thoroughly for at least 30 seconds, especially before eating and after using the toilet.\n'                      
                      '--> Avoid handling food. Avoid preparing food for others until your health care provider says you are no longer contagious. If you work with food, you may need to take a test to show you are not shedding typhoid bacteria. If you work in health care, you also may need to show you are not shedding the bacteria.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/typhoid-fever/symptoms-causes/syc-20378661',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthU extends StatelessWidget {
  final List<String> categories = [
    'Ulcerative colitis',    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health U'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UlcerativeColitis()));
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

class UlcerativeColitis extends StatefulWidget {
  @override
  _UlcerativeColitisState createState() => _UlcerativeColitisState();
}

class _UlcerativeColitisState extends State<UlcerativeColitis> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulcerative Colitis'),
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
                  text: 'Symptoms\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Ulcerative colitis symptoms can vary, depending on the severity of inflammation and where it occurs. Signs and symptoms may include:\n'                      
                      '\n--> Diarrhea, often with blood or pus\n'
                      '--> Rectal bleeding — passing small amount of blood with stool\n'
                      '--> Abdominal pain and cramping\n'
                      '--> Rectal pain\n'
                      '--> Urgency to defecate\n'
                      '--> Inability to defecate despite urgency\n'
                      '--> Weight loss\n'
                      '--> Fatigue\n'
                      '--> Fever\n'
                      '--> In children, failure to grow\n'                      
                      '\nMost people with ulcerative colitis have mild to moderate symptoms. The course of ulcerative colitis may vary, with some people having long periods when it goes away. This is called remission.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTypes\n'
                      ,
                    ),
                    TextSpan(
                      text:
                      '\nHealth care providers often classify ulcerative colitis according to its location. Symptoms of each type often overlap. Types of ulcerative colitis include:\n'
                      '\n--> Ulcerative proctitis. Inflammation is confined to the area closest to the anus, also called the rectum. Rectal bleeding may be the only sign of the disease.\n'
                      '--> Proctosigmoiditis. Inflammation involves the rectum and sigmoid colon — the lower end of the colon. Symptoms include bloody diarrhea, abdominal cramps and pain, and an inability to move the bowels despite the urge to do so. This is called tenesmus.\n'
                      '--> Left-sided colitis. Inflammation extends from the rectum up through the sigmoid and descending portions of the colon. Symptoms include bloody diarrhea, abdominal cramping and pain on the left side, and urgency to defecate.\n'
                      '--> Pancolitis. This type often affects the entire colon and causes bouts of bloody diarrhea that may be severe, abdominal cramps and pain, fatigue, and significant weight loss.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nCauses\n'
                    ),
                    TextSpan(
                      text:
                      '\nThe exact cause of ulcerative colitis remains unknown. Previously, diet and stress were suspected. However, researchers now know that these factors may aggravate but do not cause ulcerative colitis.\n'
                      '\nOne possible cause is an immune system malfunction. When your immune system tries to fight off an invading virus or bacterium, an irregular immune response causes the immune system to attack the cells in the digestive tract, too.\n'
                      '\nHeredity also seems to play a role in that ulcerative colitis is more common in people who have family members with the disease. However, most people with ulcerative colitis do not have this family history.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nComplications\n'
                    ),
                    TextSpan(
                      text:
                      '\nPossible complications of ulcerative colitis include:\n'
                      '\n--> Severe bleeding\n'
                      '--> Severe dehydration\n'
                      '--> A rapidly swelling colon, also called a toxic megacolon\n'
                      '--> A hole in the colon, also called a perforated colon\n'
                      '--> Increased risk of blood clots in veins and arteries\n'
                      '--> Inflammation of the skin, joints and eyes\n'
                      '--> An increased risk of colon cancer\n'
                      '--> Bone loss, also called osteoporosis\n'                      
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
                  text: '\n[Reference: https://www.mayoclinic.org/diseases-conditions/ulcerative-colitis/symptoms-causes/syc-20353326',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthV extends StatelessWidget {
  final List<String> categories = [
    'Vitamin A',
    'Vitamin B',
    'Vitamin C',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health V'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UlcerativeColitis()));
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
class HealthW extends StatelessWidget {
  final List<String> categories = [
    'Water',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health W'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Water()));
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

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water'),
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
                  text: 'What are the health benefits of water?\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      'Water is your bodys principal chemical component and makes up about 50% to 70% of your body weight. Your body depends on water to survive.\n'
                      '\nEvery cell, tissue and organ in your body needs water to work properly. For example, water:\n'
                      '\n--> Gets rid of wastes through urination, perspiration and bowel movements\n'
                      '--> Keeps your temperature normal\n'
                      '--> Lubricates and cushions joints\n'
                      '--> Protects sensitive tissues\n'
                      '\nLack of water can lead to dehydration — a condition that occurs when you do not have enough water in your body to carry out normal functions. Even mild dehydration can drain your energy and make you tired.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nHow much water do you need?\n'
                      ,
                    ),
                    TextSpan(
                      text:
                      '\nEvery day you lose water through your breath, perspiration, urine and bowel movements. For your body to function properly, you must replenish its water supply by consuming beverages and foods that contain water.\n'
                      '\nSo how much fluid does the average, healthy adult living in a temperate climate need? The U.S. National Academies of Sciences, Engineering, and Medicine determined that an adequate daily fluid intake is:\n'
                      '--> About 15.5 cups (3.7 liters) of fluids a day for men\n'
                      '--> About 11.5 cups (2.7 liters) of fluids a day for women\n'
                      '\nThese recommendations cover fluids from water, other beverages and food. About 20% of daily fluid intake usually comes from food and the rest from drinks.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nWhat about the advice to drink 8 glasses a day?\n'
                    ),
                    TextSpan(
                      text:
                      '\nYou have probably heard the advice to drink eight glasses of water a day. Thats easy to remember, and its a reasonable goal.\n'
                      '\nMost healthy people can stay hydrated by drinking water and other fluids whenever they feel thirsty. For some people, fewer than eight glasses a day might be enough. But other people might need more.\n'
                      '\nYou might need to modify your total fluid intake based on several factors:\n'
                      '\n--> Exercise. If you do any activity that makes you sweat, you need to drink extra water to cover the fluid loss. Its important to drink water before, during and after a workout.\n'
                      '--> Environment. Hot or humid weather can make you sweat and requires additional fluid. Dehydration also can occur at high altitudes.\n'
                      '--> Overall health. Your body loses fluids when you have a fever, vomiting or diarrhea. Drink more water or follow a doctors recommendation to drink oral rehydration solutions. Other conditions that might require increased fluid intake include bladder infections and urinary tract stones.\n'
                      '--> Pregnancy and breast-feeding. If you are pregnant or breast-feeding, you may need additional fluids to stay hydrated.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nHow do I know if I am drinking enough?\n'
                    ),
                    TextSpan(
                      text:
                      '\nYour fluid intake is probably adequate if:\n'
                      '\n--> You rarely feel thirsty\n'
                      '--> Your urine is colorless or light yellow\n'
                      '\nYour doctor or dietitian can help you determine the amount of water thats right for you every day.\n'
                      '\nTo prevent dehydration and make sure your body has the fluids it needs, make water your beverage of choice. Its a good idea to drink a glass of water:\n'
                      '\n--> With each meal and between meals\n'
                      '--> Before, during and after exercise\n'
                      '--> If you feel thirsty\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nShould I worry about drinking too much water?\n'
                    ),
                    TextSpan(
                      text:
                      '\nDrinking too much water is rarely a problem for healthy, well-nourished adults. Athletes occasionally may drink too much water in an attempt to prevent dehydration during long or intense exercise. When you drink too much water, your kidneys can not get rid of the excess water. The sodium content of your blood becomes diluted. This is called hyponatremia and it can be life-threatening.\n'
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
                  text: '\n[Reference: https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/water/art-20044256',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

class HealthX extends StatelessWidget {
  final List<String> categories = [
    'X-Ray',    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health X'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UlcerativeColitis()));
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
class HealthY extends StatelessWidget {
  final List<String> categories = [
    'Yellow Fever',    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Y'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>YellowFever()));
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

class YellowFever extends StatefulWidget {
  @override
  _YellowFeverState createState() => _YellowFeverState();
}

class _YellowFeverState extends State<YellowFever> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulcerative Colitis'),
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
                  text: 'Key facts\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      '--> Yellow fever is an infectious disease transmitted by mosquitoes that bite mostly during the day.\n'                      
                      '--> As of 2023, 34 countries in Africa and 13 countries in Central and South America are either endemic for, or have regions that are endemic for, yellow fever.\n'
                      '--> Yellow fever is prevented by a vaccine, which is safe and affordable. A single dose of yellow fever vaccine is sufficient to grant life-long protection.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nSymptoms\n'
                      ,
                    ),
                    TextSpan(
                      text:
                      '\nThe incubation period for yellow fever is 3 to 6 days. Many people do not experience symptoms. Common symptoms include fever, muscle pain, headache, loss of appetite, nausea or vomiting. In most cases, symptoms disappear after 3 to 4 days.\n'
                      '\nA small percentage of patients enter a second, more toxic phase within 24 hours of recovering from initial symptoms. High fever returns and several body systems are affected, usually the liver and the kidneys. In this phase, people are likely to develop jaundice (yellowing of the skin and eyes, hence the name yellow fever), dark urine, and abdominal pain with vomiting. Bleeding can occur from the mouth, nose, eyes, or stomach. Half of the patients who enter the toxic phase die within 7 to 10 days.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTreatment\n'
                    ),
                    TextSpan(
                      text:
                      '\nThere is no specific anti-viral drug for yellow fever. Patients should rest, stay hydrated and seek medical advice. Depending on the clinical manifestations and other circumstances, patients may be sent home, be referred for in-hospital management, or require emergency treatment and urgent referral. Treatment for dehydration, liver and kidney failure, and fever improves outcomes. Associated bacterial infections can be treated with antibiotics.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'
                        '1. Vaccination\n'
                    ),
                    TextSpan(
                      text:
                      '\nVaccination is the most important means of preventing yellow fever. The yellow fever vaccine is safe, affordable and a single dose provides life-long protection against yellow fever disease. A booster dose of yellow fever vaccine is not needed.\n'
                      '\nThe vaccine provides effective immunity within 10 days for 80 to 100% of people vaccinated, and within 30 days for more than 99% of people vaccinated.\n'
                      '\nSide-effects from the yellow fever vaccine are rare. People who are usually excluded from vaccination include:\n'
                      '\n--> infants aged less than 9 months;\n'
                      '--> pregnant women except during a yellow fever outbreak when the risk of infection is high;\n'
                      '--> people with severe allergies to egg protein; and\n'
                      '--> people with severe immunodeficiency due to symptomatic HIV/AIDS or other causes, or who have a thymus disorder.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text:
                        '\n2. Vector control\n'
                    ),
                    TextSpan(
                      text:
                      '\nThe risk of yellow fever transmission in urban areas can be reduced by eliminating potential mosquito breeding sites, including by applying larvicides to water storage containers and other places where standing water collects.\n'
                      '\nPreventive measures, such as wearing clothing to minimize skin exposure and repellents are recommended to avoid mosquito bites. The use of insecticide-treated bed nets is limited by the fact that Aedes mosquitos bite during the daytime.\n'
                      '\nBoth vector surveillance and control are components of the prevention and control of vector-borne diseases, especially for transmission control in epidemic situations. For yellow fever, vector surveillance targeting Aedes aegypti and other Aedes species will help inform where there is a risk of an urban outbreak.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text:
                        '\n3. Epidemic preparedness and response\n'
                    ),
                    TextSpan(
                      text:
                      '\nPrompt detection of yellow fever and rapid response through emergency vaccination campaigns are essential for controlling outbreaks. However, underreporting is a concern; WHO estimates the true number of cases to be 10 to 250 times what is now being reported.\n'
                      '\nWHO recommends that every at-risk country has at least one national laboratory where basic yellow fever blood tests can be performed.  A confirmed case of yellow fever in an unvaccinated population is considered an outbreak. A confirmed case in any context must be fully investigated. Investigation teams must assess and respond to the outbreak with both emergency measures and longer-term immunization plans.\n'
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
                  text: '\n[Reference: https://www.who.int/news-room/fact-sheets/detail/yellow-fever',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}
class HealthZ extends StatelessWidget {
  final List<String> categories = [
    'Zika Virus',    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Z'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ZikaVirus()));
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

class ZikaVirus extends StatefulWidget {
  @override
  _ZikaVirusState createState() => _ZikaVirusState();
}

class _ZikaVirusState extends State<ZikaVirus> {
  int currentImageIndex = 0;
  List<String> imagePaths = [
    "assets/fake.jpg",
    "assets/wirral-first-aid.webp", // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulcerative Colitis'),
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
                  text: 'Key facts\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children:<TextSpan>[
                    TextSpan(
                      text:
                      '--> Zika virus is transmitted primarily by Aedes mosquitoes, which bite mostly during the day.\n'                      
                      '--> Most people with Zika virus infection do not develop symptoms; those who do typically have symptoms including rash, fever, conjunctivitis, muscle and joint pain, malaise and headache that last for 2 to 7 days.\n'
                      '--> Zika virus infection during pregnancy can cause infants to be born with microcephaly and other congenital malformations as well as preterm birth and miscarriage.\n'
                      '--> Zika virus infection is associated with Guillain-Barré syndrome, neuropathy and myelitis in adults and children.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nSymptoms\n'
                      ,
                    ),
                    TextSpan(
                      text:
                      '\nMost people infected with Zika virus do not develop symptoms. Among those who do, they typically start 3–14 days after infection, are generally mild including rash, fever, conjunctivitis, muscle and joint pain, malaise and headache, and usually last for 2–7 days. These symptoms are common to other arboviral and non-arboviral diseases; thus, the diagnosis of Zika virus infection requires laboratory confirmation.\n'                      
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nTreatment\n'
                    ),
                    TextSpan(
                      text:
                      '\nThere is no specific treatment available for Zika virus infection or disease.\n'
                      '\nPeople with symptoms such as rash, fever or joint pain should get plenty of rest, drink fluids, and treat symptoms with antipyretics and/or analgesics. Nonsteroidal anti-inflammatory drugs should be avoided until dengue virus infections are ruled out because of bleeding risk. If symptoms worsen, patients should seek medical care and advice.\n'
                      '\nPregnant women living in areas with Zika transmission or who develop symptoms of Zika virus infection should seek medical attention for laboratory testing, information, counselling and other clinical care.\n'
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '\nPrevention\n'                        
                    ),
                    TextSpan(
                      text:
                      '\nNo vaccine is yet available for the prevention or treatment of Zika virus infection. Development of a Zika vaccine remains an active area of research.\n'
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
                  text: '\n[Reference: https://www.who.int/news-room/fact-sheets/detail/zika-virus?gclid=Cj0KCQiAkKqsBhC3ARIsAEEjuJi6GFzZg2BxcTiuGciUr0cpf93vekUzwmn3qg7GqMwkAXyS_FRAMBYaArgKEALw_wcB',
                ), 
              ),
            ), 
          ],
        ),
      ),     
    );
  }
}

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
