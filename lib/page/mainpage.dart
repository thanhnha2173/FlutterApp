import 'package:flutter/material.dart';
import 'package:shoes_flutter_app/page/cart.dart';
import 'package:shoes_flutter_app/page/favorite.dart';
import 'package:shoes_flutter_app/page/history.dart';
import 'package:shoes_flutter_app/page/home.dart';
import 'package:shoes_flutter_app/page/profile.dart';
// Import các trang khác (FavoritesScreen, CartScreen, HistoryScreen, ProfileScreen)

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Chỉ số trang hiện tại

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row( // Sử dụng Row để sắp xếp các phần tử trong AppBar
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Chia đều khoảng cách giữa các phần tử
          children: [
            Builder( // Sử dụng Builder để lấy context của Scaffold
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu), // Biểu tượng 3 gạch
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Mở NavigationDrawer
                },
              ),
            ),
            Image.asset(
              'assets/logo/black_icon.png', // Thay bằng đường dẫn đến logo nhỏ của bạn
              height: 40, // Điều chỉnh kích thước logo
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                  },
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Hiển thị trang được chọn
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            const DrawerHeader(decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text('Danh mục sản phẩm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            ),
            ),
            ListTile(
              title: const Text("Giày nam"),
              onTap: () {

              },
            ),
            ListTile( 
              title: const Text("Giày nữ"),
              onTap: () {

              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Yêu thích',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Giỏ hàng',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Lịch sử',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
