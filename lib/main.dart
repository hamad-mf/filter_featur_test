import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  // Define the tabs and their content
  final List<String> _tabs = ['Sort', 'Veg/Non-Veg', 'Ratings', 'Cost For Two'];
  final List<Widget> _tabContents = [
    TabContent1(),
    TabContent2(),
    TabContent3(),
    TabContent4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return SizedBox(
                      height: 700, // Adjust height as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Close button and title

                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Filter Page',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),

                          Stack(children: [
                            Row(
                              children: [
                                // Left side: Vertical Tabs
                                Container(
                                  height: 620,
                                  width: 180, // Fixed width for vertical tabs
                                  color: Colors.white,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _tabs.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedTabIndex = index;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              right: 16, left: 0),
                                          color: _selectedTabIndex == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 70,
                                                color:
                                                    _selectedTabIndex == index
                                                        ? Colors.orange.shade600
                                                        : Colors.transparent,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                _tabs[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: _selectedTabIndex ==
                                                          index
                                                      ? Colors.orange.shade900
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Right side: Tab Content
                                Container(
                                  height: 620,
                                  width: 212.7,
                                  padding: const EdgeInsets.all(0),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      _tabContents[_selectedTabIndex],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 85,
                                width: 392.7,
                                color: Colors.amber,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text("data"),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {}, child: Text("data"))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          child: const Text('Show Filter Page'),
        ),
      ),
    );
  }
}

class TabContent1 extends StatefulWidget {
  @override
  State<TabContent1> createState() => _TabContent1State();
}

class _TabContent1State extends State<TabContent1> {
  String? sortBy = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort By'),

          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Relevence",
                style: TextStyle(
                    color: (sortBy == "Relevence")
                        ? Colors.black
                        : Colors.grey, // Conditional text color

                    fontWeight: (sortBy == "Relevence")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "Relevence",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),

          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Delivery time",
                style: TextStyle(
                    color: (sortBy == "Delivery time")
                        ? Colors.black
                        : Colors.grey, // Conditional text color
                    fontWeight: (sortBy == "Delivery time")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "Delivery time",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),

          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Rating",
                style: TextStyle(
                    color: (sortBy == "Rating")
                        ? Colors.black
                        : Colors.grey, // Conditional text color
                    fontWeight: (sortBy == "Rating")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "Rating",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),
          RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Cost Low To High",
                style: TextStyle(
                    color: (sortBy == "cost L2H")
                        ? Colors.black
                        : Colors.grey, // Conditional text color
                    fontWeight: (sortBy == "cost L2H")
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              value: "cost L2H",
              groupValue: sortBy,
              onChanged: (value) {
                sortBy = value;
                setState(() {});
              }),
          RadioListTile(
            activeColor: Colors.orange,
            title: Text(
              "Cost High To Low",
              style: TextStyle(
                  color: (sortBy == "Cost H2L")
                      ? Colors.black
                      : Colors.grey, // Conditional text color
                  fontWeight: (sortBy == "Cost H2L")
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
            value: "Cost H2L",
            groupValue: sortBy,
            onChanged: (value) {
              setState(() {
                sortBy = value;
              });
            },
          ),
          // More widgets here...
        ],
      ),
    );
  }
}

class TabContent2 extends StatefulWidget {
  @override
  State<TabContent2> createState() => _TabContent2State();
}

class _TabContent2State extends State<TabContent2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Large content for Tab 2'),
          // More widgets here...
        ],
      ),
    );
  }
}

class TabContent3 extends StatefulWidget {
  @override
  State<TabContent3> createState() => _TabContent3State();
}

class _TabContent3State extends State<TabContent3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Large content for Tab 3'),
          // More widgets here...
        ],
      ),
    );
  }
}

class TabContent4 extends StatefulWidget {
  @override
  State<TabContent4> createState() => _TabContent4State();
}

class _TabContent4State extends State<TabContent4> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Large content for Tab 4'),
          // More widgets here...
        ],
      ),
    );
  }
}
