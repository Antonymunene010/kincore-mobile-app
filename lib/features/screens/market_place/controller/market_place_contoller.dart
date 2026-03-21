import 'package:get/get.dart';

class MarketplaceController extends GetxController {
  var isLoading = true.obs;
  // Default selection ko translation key banaya
  var selectedCategory = 'marketplace.catAll'.obs;
  var searchQuery = ''.obs;

  // Categories list mein translation keys use ki hain
  final List<String> categories = [
    'marketplace.catAll',
    'marketplace.catVehicles',
    'marketplace.catProperty',
    'marketplace.catElectronics',
    'marketplace.catFurniture',
    'marketplace.catFashion'
  ];

  List<Map<String, dynamic>> allProducts = [];
  var products = <Map<String, dynamic>>[].obs;

  var chatHistory = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));

    allProducts = [
      {
        'id': '1',
        'title': 'iPhone 14 Pro Max',
        'price': '850',
        'image': 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500',
        'location': 'New York, NY',
        'category': 'marketplace.catElectronics', // Key used for filtering
        'sellerName': 'Arthur Harrison',
        'description': 'Used for 6 months, perfect condition. Battery health 98%. Comes with original box and charger.'
      },
      {
        'id': '2',
        'title': 'Modern Wooden Sofa',
        'price': '320',
        'image': 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500',
        'location': 'Los Angeles, CA',
        'category': 'marketplace.catFurniture', // Key used for filtering
        'sellerName': 'Jessica Doe',
        'description': 'Comfortable 3-seater sofa. Moving out sale.'
      },
      {
        'id': '3',
        'title': 'Nike Air Jordan 1',
        'price': '150',
        'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
        'location': 'Chicago, IL',
        'category': 'marketplace.catFashion', // Key used for filtering
        'sellerName': 'Mike Smith',
        'description': 'Size 10, brand new without box. Authentic.'
      },
      {
        'id': '4',
        'title': '2018 Honda Civic',
        'price': '15,000',
        'image': 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=500',
        'location': 'Houston, TX',
        'category': 'marketplace.catVehicles', // Key used for filtering
        'sellerName': 'David Lee',
        'description': 'Clean title, 45k miles. Well maintained.'
      },
    ];

    chatHistory.assignAll([
      {
        'sellerName': 'Arthur Harrison',
        'sellerImage': 'https://i.pravatar.cc/150?u=Arthur Harrison',
        'productTitle': 'iPhone 14 Pro Max',
        'productPrice': '850',
        'productImage': 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500',
        'lastMessage': 'Yes, it is still available.', // API data, leave as is
        'time': '10:30 AM',
        'unread': 2,
      },
      {
        'sellerName': 'Jessica Doe',
        'sellerImage': 'https://i.pravatar.cc/150?u=Jessica Doe',
        'productTitle': 'Modern Wooden Sofa',
        'productPrice': '320',
        'productImage': 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500',
        'lastMessage': 'I can do \$300 if you pick it up today.', // API data, leave as is
        'time': 'marketplace.timeYesterday'.tr, // Translated
        'unread': 0,
      }
    ]);

    products.assignAll(allProducts);
    isLoading.value = false;
  }

  void changeCategory(String cat) {
    selectedCategory.value = cat;
    _applyFilters();
  }

  void searchProducts(String query) {
    searchQuery.value = query.toLowerCase();
    _applyFilters();
  }

  void _applyFilters() {
    var filteredList = allProducts;

    if (selectedCategory.value != 'marketplace.catAll') {
      filteredList = filteredList.where((p) => p['category'] == selectedCategory.value).toList();
    }

    if (searchQuery.value.isNotEmpty) {
      filteredList = filteredList.where((p) {
        final titleMatch = p['title'].toString().toLowerCase().contains(searchQuery.value);
        final descMatch = p['description'].toString().toLowerCase().contains(searchQuery.value);
        return titleMatch || descMatch;
      }).toList();
    }

    products.assignAll(filteredList);
  }

  // =========================================
  // [FIXED]: Ye raha startChat wala function
  // =========================================
  void startChat(Map<String, dynamic> product) {
    bool chatExists = chatHistory.any((chat) =>
    chat['productTitle'] == product['title'] &&
        chat['sellerName'] == product['sellerName']
    );

    if (!chatExists) {
      chatHistory.insert(0, {
        'sellerName': product['sellerName'],
        'sellerImage': "https://i.pravatar.cc/150?u=${product['sellerName']}",
        'productTitle': product['title'],
        'productPrice': product['productPrice'] ?? product['price'].toString(),
        'productImage': product['image'],
        // Naya message start karne par localized text bhejega
        'lastMessage': 'marketplace.msgAvailable'.tr,
        'time': 'marketplace.timeJustNow'.tr,
        'unread': 0,
      });
    }
  }
}