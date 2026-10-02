import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//////////////////// APP ////////////////////

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

//////////////////// LOGIN ////////////////////

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  void login(BuildContext context) {
    if (email.text.isNotEmpty && pass.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainScreen(userEmail: email.text)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter login details")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Travel App ✈️",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////// MAIN ////////////////////

class MainScreen extends StatefulWidget {
  final String userEmail;

  MainScreen({required this.userEmail});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List<Map<String, String>> favorites = [];

  void toggleFav(Map<String, String> place) {
    setState(() {
      favorites.contains(place)
          ? favorites.remove(place)
          : favorites.add(place);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(toggleFav: toggleFav, favorites: favorites),
      FavoritesScreen(favorites: favorites),
      ProfileScreen(email: widget.userEmail, favorites: favorites),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.teal,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

//////////////////// HOME ////////////////////

class HomeScreen extends StatefulWidget {
  final Function toggleFav;
  final List favorites;

  HomeScreen({required this.toggleFav, required this.favorites});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = "";
  final places = [
    {
      "name": "Goa",
      "image": "https://picsum.photos/id/1018/400/200",
      "rating": "4.7",
      "desc":
          "Goa is one of India’s most popular beach destinations, known for its golden sandy beaches, vibrant nightlife, and Portuguese heritage. Tourists enjoy water sports, beach parties, seafood, and relaxing sunsets along the Arabian Sea.",
    },
    {
      "name": "Paris",
      "image": "https://picsum.photos/id/1015/400/200",
      "rating": "4.8",
      "desc":
          "Paris, the capital of France, is famous for its romantic atmosphere, iconic Eiffel Tower, world-class museums like the Louvre, and charming streets. It offers a blend of art, fashion, history, and delicious cuisine.",
    },
    {
      "name": "Tokyo",
      "image": "https://picsum.photos/id/1011/400/200",
      "rating": "4.9",
      "desc":
          "Tokyo is a bustling metropolis blending ultra-modern technology with traditional culture. From neon-lit skyscrapers to historic temples, it offers shopping, anime culture, delicious sushi, and efficient transport.",
    },
    {
      "name": "New York",
      "image": "https://picsum.photos/id/1003/400/200",
      "rating": "4.6",
      "desc":
          "New York City is known as the city that never sleeps. It features iconic landmarks like Times Square, Central Park, and the Statue of Liberty, along with Broadway shows, shopping, and diverse culture.",
    },
    {
      "name": "Dubai",
      "image": "https://picsum.photos/id/1005/400/200",
      "rating": "4.7",
      "desc":
          "Dubai is a luxurious city in the UAE known for skyscrapers like Burj Khalifa, shopping malls, desert safaris, and modern lifestyle. It offers a mix of tradition and futuristic architecture.",
    },
    {
      "name": "London",
      "image": "https://picsum.photos/id/1016/400/200",
      "rating": "4.5",
      "desc":
          "London is a historic city featuring landmarks like Big Ben, Buckingham Palace, and the Thames River. It blends history, culture, theatre, and modern urban life.",
    },
    {
      "name": "Singapore",
      "image": "https://picsum.photos/id/1020/400/200",
      "rating": "4.8",
      "desc":
          "Singapore is a clean and futuristic city known for Marina Bay Sands, Gardens by the Bay, and its multicultural cuisine. It offers a perfect mix of nature and modern living.",
    },
    {
      "name": "Bali",
      "image": "https://picsum.photos/id/1025/400/200",
      "rating": "4.9",
      "desc":
          "Bali is a tropical paradise in Indonesia famous for beaches, temples, waterfalls, and lush greenery. It is ideal for relaxation, adventure, and cultural experiences.",
    },
    {
      "name": "Rome",
      "image": "https://picsum.photos/id/1031/400/200",
      "rating": "4.7",
      "desc":
          "Rome is a historic city filled with ancient landmarks like the Colosseum and Roman Forum. It offers rich culture, architecture, and world-famous Italian cuisine.",
    },
    {
      "name": "Sydney",
      "image": "https://picsum.photos/id/1035/400/200",
      "rating": "4.6",
      "desc":
          "Sydney is known for its Opera House, Harbour Bridge, and beautiful beaches like Bondi. It offers outdoor activities, coastal views, and vibrant city life.",
    },
    {
      "name": "Maldives",
      "image": "https://picsum.photos/id/1040/400/200",
      "rating": "4.9",
      "desc":
          "The Maldives is a group of tropical islands known for crystal-clear waters, luxury resorts, and underwater experiences. It’s perfect for honeymoon and relaxation.",
    },
    {
      "name": "Bangkok",
      "image": "https://picsum.photos/id/1043/400/200",
      "rating": "4.5",
      "desc":
          "Bangkok is Thailand’s capital, known for vibrant street life, temples, shopping markets, and delicious street food. It’s energetic and culturally rich.",
    },
    {
      "name": "Istanbul",
      "image": "https://picsum.photos/id/1050/400/200",
      "rating": "4.6",
      "desc":
          "Istanbul bridges Europe and Asia, offering historic mosques, bazaars, and cultural diversity. It is rich in history and architecture.",
    },
    {
      "name": "Barcelona",
      "image": "https://picsum.photos/id/1060/400/200",
      "rating": "4.7",
      "desc":
          "Barcelona is known for Gaudi’s architecture, beaches, and vibrant culture. It combines art, food, and seaside beauty.",
    },
    {
      "name": "Cape Town",
      "image": "https://picsum.photos/id/1070/400/200",
      "rating": "4.6",
      "desc":
          "Cape Town offers stunning coastal views, Table Mountain, and diverse wildlife. It’s a mix of nature and city life.",
    },
    {
      "name": "Los Angeles",
      "image": "https://picsum.photos/id/1080/400/200",
      "rating": "4.5",
      "desc":
          "Los Angeles is known for Hollywood, beaches, and entertainment industry. It offers sunny weather and celebrity culture.",
    },
    {
      "name": "Moscow",
      "image": "https://picsum.photos/id/1084/400/200",
      "rating": "4.4",
      "desc":
          "Moscow is Russia’s capital known for Red Square, Kremlin, and historic architecture. It blends tradition with modern life.",
    },
    {
      "name": "Seoul",
      "image": "https://picsum.photos/id/1081/400/200",
      "rating": "4.7",
      "desc":
          "Seoul is a high-tech city with palaces, markets, and K-pop culture. It offers both tradition and innovation.",
    },
    {
      "name": "Zurich",
      "image": "https://picsum.photos/id/1082/400/200",
      "rating": "4.6",
      "desc":
          "Zurich is a Swiss city known for scenic lakes, mountains, and cleanliness. It offers peaceful surroundings and luxury lifestyle.",
    },
    {
      "name": "Rio de Janeiro",
      "image": "https://picsum.photos/id/1083/400/200",
      "rating": "4.8",
      "desc":
          "Rio is famous for beaches like Copacabana, Christ the Redeemer statue, and Carnival festival. It’s vibrant and lively.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = places
        .where((p) => p["name"]!.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Explore 🌍")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search places...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (v) => setState(() => search = v),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final p = filtered[i];
                final fav = widget.favorites.contains(p);

                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.network(p["image"]!),
                      ),

                      ListTile(
                        title: Text(p["name"]!),
                        subtitle: Text("⭐ ${p["rating"]}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                fav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                widget.toggleFav(p);
                                setState(() {});
                              },
                            ),

                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailScreen(place: p),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////// DETAIL ////////////////////

class DetailScreen extends StatelessWidget {
  final Map<String, String> place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place["name"]!)),
      body: Column(
        children: [
          Image.network(place["image"]!),

          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  place["name"]!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                Text("⭐ ${place["rating"]}"),

                SizedBox(height: 10),

                Text(place["desc"]!),

                SizedBox(height: 20),

                ElevatedButton(
                  child: Text("Book Now"),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Booking Confirmed 🎉")),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////// FAVORITES ////////////////////

class FavoritesScreen extends StatelessWidget {
  final List favorites;

  FavoritesScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites ❤️")),
      body: favorites.isEmpty
          ? Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, i) {
                final p = favorites[i];
                return ListTile(
                  leading: Image.network(p["image"]!, width: 60),
                  title: Text(p["name"]!),
                  subtitle: Text("⭐ ${p["rating"]}"),
                );
              },
            ),
    );
  }
}

//////////////////// PROFILE ////////////////////

class ProfileScreen extends StatelessWidget {
  final String email;
  final List<Map<String, String>> favorites;

  ProfileScreen({required this.email, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile 👤")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),

            SizedBox(height: 10),

            Text(email, style: TextStyle(fontSize: 18)),

            SizedBox(height: 20),

            Text(
              "Saved Places ❤️",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: favorites.isEmpty
                  ? Center(child: Text("No saved places"))
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (_, i) {
                        final p = favorites[i];
                        return ListTile(
                          leading: Image.network(p["image"]!, width: 50),
                          title: Text(p["name"]!),
                          subtitle: Text("⭐ ${p["rating"]}"),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
