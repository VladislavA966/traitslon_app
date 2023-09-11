import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор зон'),
      ),
      body: const Center(
        child: CyclingZonesScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.abc,
              color: Colors.deepOrange,
            ),
            label: 'Плавание',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.send,
              color: Colors.deepOrange,
            ),
            label: 'Велосипед',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dangerous,
              color: Colors.deepOrange,
            ),
            label: 'Бег рамп',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_alarm_rounded,
              color: Colors.deepOrange,
            ),
            label: 'Бег 5км',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

class CyclingZonesScreen extends StatelessWidget {
  const CyclingZonesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    List<DataModel> data = [
      DataModel(
        nameZone: 'Восстановительная',
        color: Colors.grey,
        hightZone: '100',
        lowZone: '120',
      ),
      DataModel(
        nameZone: 'Аэробная',
        color: Colors.lightBlue,
        hightZone: '121',
        lowZone: '140',
      ),
      DataModel(
        nameZone: 'Темповая',
        color: Colors.green,
        hightZone: '141',
        lowZone: '155',
      ),
      DataModel(
        nameZone: 'Пороговая',
        color: Colors.orange,
        hightZone: '156',
        lowZone: '165',
      ),
      DataModel(
        nameZone: 'VO2Max',
        color: Colors.red,
        hightZone: '166',
        lowZone: '>',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ZonesContainer(model: data[index]);
        },
      ),
    );
  }
}

class ZonesContainer extends StatelessWidget {
  const ZonesContainer({
    Key? key,
    required this.model,
  });

  final DataModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: model.color,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.nameZone),
            Text('${model.lowZone} - ${model.hightZone}'),
          ],
        ),
      ),
    );
  }
}

class DataModel {
  DataModel({
    required this.nameZone,
    required this.color,
    required this.hightZone,
    required this.lowZone,
  });

  String nameZone;
  String lowZone;
  String hightZone;
  Color color;
}


