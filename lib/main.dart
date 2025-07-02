import 'package:flutter/material.dart';
import 'package:projeto/views/login.dart';

void main() {
  runApp(MaterialApp(
    home: LoginView(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false,
      primarySwatch: Colors.indigo,
      primaryColor: const Color(0xFF5E62DB),
    ),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('username', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
        
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.grey[700],
                    child: Icon(Icons.person, size: 48, color: Colors.grey[400]),
                  ),
                  const SizedBox(width: 24),
                 
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ProfileStat(title: 'Posts'),
                        _ProfileStat(title: 'Followers'),
                        _ProfileStat(title: 'Following'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Professional dashboard\n2.8K accounts reached in the last 30 days.',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white24),
                        backgroundColor: Colors.grey[850],
                      ),
                      onPressed: () {},
                      child: const Text('Edit profile'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white24),
                        backgroundColor: Colors.grey[850],
                      ),
                      onPressed: () {},
                      child: const Text('Share profile'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white24),
                      backgroundColor: Colors.grey[850],
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.person_add_alt, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  if (index < 4) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[800],
                          child: Icon(Icons.person, color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 4),
                        const Text('', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[800],
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        const Text('New', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    );
                  }
                },
              ),
            ),
            const Divider(color: Colors.white12, height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.grid_on, color: _selectedTab == 0 ? Colors.white : Colors.white38),
                  onPressed: () {
                    setState(() { _selectedTab = 0; });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person_pin_outlined, color: _selectedTab == 1 ? Colors.white : Colors.white38),
                  onPressed: () {
                    setState(() { _selectedTab = 1; });
                  },
                ),
              ],
            ),
          
            if (_selectedTab == 0)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.grey[900],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 500,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Informações da Foto',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 16),
                              const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut laoreet tincidunt, nunc nisl aliquam nunc, eget aliquam nunc nisl eu nunc.',
                                style: TextStyle(color: Colors.white70, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.grey[700],
                    ),
                  );
                },
              ),
            if (_selectedTab == 1)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[800],
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String title;
  const _ProfileStat({required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('∞', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 4),
       
        Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        SizedBox(height: 2),
       
        Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
