import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mauritania Booking App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int selectedCategory = 0;
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
    ? _buildHomeContent()
    : _selectedIndex == 1
        ? const FavoritesPage()
        : _selectedIndex == 2
            ? const AddPage()
            : _selectedIndex == 3
                ? const ChatPage()
                : const MenuPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,

        selectedItemColor: const Color(0xFF2C3E50),
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),

              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            label: '',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat),
            label: '',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: '',
          ),
        ],
      ),
    );
  }

  // ================= HOME PAGE =================

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),

            // HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Text(
                      'Find your',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'best place to stay',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFE5E5E5),

                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // SEARCH
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search location...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // CATEGORIES
            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SingleChildScrollView(
  scrollDirection: Axis.horizontal,

  child: Row(
    children: [

      _buildCategoryItem(
        "Home",
        Icons.home,
        Colors.orange,
        0,
      ),

      _buildCategoryItem(
        "Hotel",
        Icons.hotel,
        Colors.red,
        1,
      ),

      _buildCategoryItem(
        "Apartment",
        Icons.apartment,
        Colors.blueGrey,
        2,
      ),

    ],
  ),
),  
            const SizedBox(height: 30),

            // TITLE
            const Text(
              "Nearby for you",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            if (selectedCategory == 0) ...
            [
               _buildPropertyCard(
               "Modern Family House",
               "Nouakchott",
               "1000 MRU",
               4.8,
               "assets/images/house1.jpeg",
              ),

              const SizedBox(height: 20),

               _buildPropertyCard(
                "Luxury Villa",
                "Tevragh Zeina",
                 "2500 MRU",
                 4.9,
                 "assets/images/house2.jpeg",
              ),
           ],

           if (selectedCategory == 1) ...
           [
             _buildPropertyCard(
               "Royal Hotel",
               "Nouakchott",
               "700 MRU",
               4.7,
               "assets/images/house2.jpeg",
              ),

              
            const SizedBox(height: 20),

              _buildPropertyCard(
                "Sun Hotel",
                "Nouadhibou",
                "650 MRU",
                4.5,
                "assets/images/house1.jpeg",
              ),
           ],

           if (selectedCategory == 2) ...
           [
              _buildPropertyCard(
                "Modern Apartment",
                "Nouakchott",
                "950 MRU",
                 4.6,
                "assets/images/house1.jpeg",
              ),

            const SizedBox(height: 20),

              _buildPropertyCard(
                "City Apartment",
                "Tevragh Zeina",
                "850 MRU",
                 4.4,
                "assets/images/house2.jpeg",
              ),
          ],

            const SizedBox(height: 30),


          ],
        ),
      ),
    );
  }
  // ================= CATEGORY =================

 Widget _buildCategoryItem(
  String title,
  IconData icon,
  Color color,
  int index,
) {
  bool isSelected = selectedCategory == index;

  return GestureDetector(
    onTap: () {
      setState(() {
        selectedCategory = index;
      });
    },

    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      margin: const EdgeInsets.only(right: 12),

      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: isSelected ? color : Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : color,
          ),

          const SizedBox(width: 8),

          Text(
            title,

            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

  // ================= FEATURE =================

  Widget _buildFeatureIcon(
    IconData icon,
    String label,
  ) {
    return Container(
      width: 65,

      padding: const EdgeInsets.symmetric(vertical: 8),

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ================= PROPERTY CARD =================

  Widget _buildPropertyCard(
    String title,
    String location,
    String price,
    double rating,
    String image,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),

            child: Image.asset(
              image,

              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Text(
                          title,

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            Text(
                              location,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(width: 8),

                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),

                            Text(" $rating"),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.end,

                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        Text(
                          price,

                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    _buildFeatureIcon(
                      Icons.bed,
                      'Beds',
                    ),

                    _buildFeatureIcon(
                      Icons.bathtub,
                      'Bath',
                    ),

                    _buildFeatureIcon(
                      Icons.local_parking,
                      'Parking',
                    ),

                    _buildFeatureIcon(
                      Icons.wifi,
                      'Wifi',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= FAVORITES PAGE =================

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),

      body: const Center(
        child: Text(
          "No favorites yet ❤️",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// ================= ADD PAGE =================

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,

        title: const Text(
          "Add Property",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),

        centerTitle: false,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // IMAGE BOX
            Container(
              height: 220,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: const [

                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.orange,

                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Upload Property Images",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Add beautiful photos",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // PROPERTY NAME
            _buildInputField(
              "Property Name",
              Icons.home_work,
            ),

            const SizedBox(height: 20),

            // LOCATION
            _buildInputField(
              "Location",
              Icons.location_on,
            ),

            const SizedBox(height: 20),

            // PRICE
            _buildInputField(
              "Price",
              Icons.attach_money,
            ),

            const SizedBox(height: 20),

            // DESCRIPTION
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: const TextField(
                maxLines: 5,

                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Property Description",
                  icon: Icon(Icons.description),
                ),
              ),
            ),

            const SizedBox(height: 35),

            // BUTTON
            Container(
              width: double.infinity,
              height: 60,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                gradient: const LinearGradient(
                  colors: [
                    Colors.orange,
                    Color(0xFFFFA726),
                  ],
                ),
              ),

              child: const Center(
                child: Text(
                  "Add Property",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _buildInputField(
    String hint,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),

      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          icon: Icon(icon),
        ),
      ),
    );
  }
}

// ================= CHAT PAGE =================

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          _buildChatTile(
            "محمد الأمين",
            "السلام عليكم، المنزل مازال متوفر؟",
            "2 min",
            "assets/images/person1.jpeg",
          ),

          const SizedBox(height: 15),

          _buildChatTile(
            "مريم بنت أحمد",
            "شكراً على الحجز 👍",
            "5 min",
            "assets/images/person2.jpeg",
          ),

          const SizedBox(height: 15),

          _buildChatTile(
            "سيدي محمد",
            "متى يمكنني زيارة الشقة؟",
            "12 min",
            "assets/images/person1.jpeg",
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(
    String name,
    String message,
    String time,
    String image,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),

      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  message,

                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          Text(
            time,

            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= MENU PAGE =================

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF182848),
                      Color(0xFF1F3B73),
                    ],
                  ),
                ),

                child: Row(
                  children: [

                    Container(
                      padding: const EdgeInsets.all(14),

                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.workspace_premium,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Go Premium",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Unlock exclusive benefits",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "General",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _buildMenuItem(
                Icons.home,
                Colors.orange,
                "My Properties",
              ),

              _buildMenuItem(
                Icons.favorite,
                Colors.red,
                "Favorites",
              ),

              _buildMenuItem(
                Icons.calendar_month,
                Colors.blue,
                "My Bookings",
              ),

              _buildMenuItem(
                Icons.wallet,
                Colors.green,
                "Payments",
              ),

              _buildMenuItem(
                Icons.notifications,
                Colors.deepPurple,
                "Notifications",
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1F1),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),

                    SizedBox(width: 10),

                    Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildMenuItem(
    IconData icon,
    Color color,
    String title,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}