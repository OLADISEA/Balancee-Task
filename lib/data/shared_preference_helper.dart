import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static const String _keyUserId = 'userId';
  static const String _keyUsername = 'username';
  static const String _keyUserEmail = 'userEmail';
  static const String _keyTotalCashback = 'totalCashback';
  static const String _keyAvailableCashback = 'availableCashback';
  static const String _keyIsInitialized = 'isInitialized'; // New flag to check initialization

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();

    // Initialize cashback values only once
    bool isInitialized = _preferences?.getBool(_keyIsInitialized) ?? false;
    if (!isInitialized) {
      // Set default values for total and available cashback
      await setTotalCashback(2000); // Set initial cashback amount
      await setAvailableCashback(2000);
      await _preferences?.setBool(_keyIsInitialized, true); // Mark as initialized
    }
  }

  // User-related functions
  static Future setUserId(String userId) async {
    await _preferences?.setString(_keyUserId, userId);
  }

  static String? getUserId() {
    return _preferences?.getString(_keyUserId);
  }

  static Future setUsername(String username) async {
    await _preferences?.setString(_keyUsername, username);
  }

  static String? getUsername() {
    return _preferences?.getString(_keyUsername);
  }

  static Future setUserEmail(String userEmail) async {
    await _preferences?.setString(_keyUserEmail, userEmail);
  }

  static String? getUserEmail() {
    return _preferences?.getString(_keyUserEmail);
  }

  // Cashback-related functions
  static Future setTotalCashback(double totalCashback) async {
    await _preferences?.setDouble(_keyTotalCashback, totalCashback);
  }

  static double getTotalCashback() {
    return _preferences?.getDouble(_keyTotalCashback) ?? 0.0;
  }

  static Future setAvailableCashback(double availableCashback) async {
    await _preferences?.setDouble(_keyAvailableCashback, availableCashback);
  }

  static double getAvailableCashback() {
    return _preferences?.getDouble(_keyAvailableCashback) ?? 0.0;
  }

  // Clear preferences
  static Future<void> clear() async {
    await _preferences?.clear();
  }
}
