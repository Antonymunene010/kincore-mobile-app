import 'package:get/get.dart';
import '../../../../core/models/dashboard_data_model.dart';

class SellerDashboardController extends GetxController {
  var isLoading = true.obs;
  var dashboardData = Rxn<DashboardData>();

  @override
  void onInit() {
    fetchDashboardData();
    super.onInit();
  }

  void fetchDashboardData() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));

      dashboardData.value = DashboardData(
        totalRevenue: "\$12,345",
        revenueChange: "+12%",
        orders: "567",
        ordersChange: "-5%",
        avgOrderValue: "\$21.78",
        avgChange: "+8%",
        products: [
          // Real Image URLs use kiye hain yahan
          ProductModel(
              name: "Nike Shoes",
              price: "\$25",
              imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff"
          ),
          ProductModel(
              name: "Headphones",
              price: "\$20",
              imageUrl: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
          ),
        ],
        recentOrders: [
          OrderModel(userName: "Sarah Miller", orderId: "#12345", amount: "\$25"),
          OrderModel(userName: "David Chen", orderId: "#12346", amount: "\$20"),
        ],
      );
    } finally {
      isLoading(false);
    }
  }
}