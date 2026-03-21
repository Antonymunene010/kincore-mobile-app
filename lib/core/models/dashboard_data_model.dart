class DashboardData {
  final String totalRevenue, revenueChange, orders, ordersChange, avgOrderValue, avgChange;
  final List<ProductModel> products;
  final List<OrderModel> recentOrders;

  DashboardData({
    required this.totalRevenue, required this.revenueChange,
    required this.orders, required this.ordersChange,
    required this.avgOrderValue, required this.avgChange,
    required this.products, required this.recentOrders,
  });
}

class ProductModel {
  final String name, price, imageUrl;
  ProductModel({required this.name, required this.price, required this.imageUrl});
}

class OrderModel {
  final String userName, orderId, amount;
  OrderModel({required this.userName, required this.orderId, required this.amount});
}