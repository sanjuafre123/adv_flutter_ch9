import 'package:flutter/material.dart';
import 'dart:convert';
import '../Api_helper/Api_helper.dart';
import '../model/model.dart';

class BeautyProvider extends ChangeNotifier
{
  BeautyModal? beautyModal;
  int selectedIndex = 0;
  int selectedProIndex = 0,quantity = 1;
  List cart = [];
  double shippingFee = 1.50;
  double price = 0;
  double discountPercentage = 16;
  double discount = 0;
  double discountPrice = 0;
  double totalPrice = 0;

  BeautyProvider()
  {
    fromMap();
  }

  void selectedCon(int index)
  {
    selectedIndex = index;
    quantity = 1;
    calPrice();
    notifyListeners();
  }

  void selectedPro()
  {
    selectedProIndex;
    notifyListeners();
  }

  void deleteP(int index)
  {
    cart.removeAt(index);
    calPrice();
    TotalPrice();
    notifyListeners();
  }
  void qty(String op,int index)
  {
    if (index < 0 || index >= cart.length) return;

    if (op == 'inc') {
      cart[index]['quantity']++;
    } else if (op == 'dec') {
      if (cart[index]['quantity'] > 1) {
        cart[index]['quantity']--;
      }
    }

    calPrice();
    notifyListeners();
  }
  void calPrice() {
    price = 0;
    for(int i=0; i<cart.length; i++)
    {
      price += cart[i]['price'] * cart[i]['quantity'];
    }
    TotalPrice();
  }

  void cartAdd()
  {
    bool qty = false;
    int index =0;

    for(int i=0; i<cart.length; i++)
    {
      if(cart[i]['title'] == beautyModal!.product[selectedIndex].title)
      {
        index =i;
        qty = true;
        break;
      }
    }
    if(qty)
    {
      cart[index]['quantity']++;
    }
    else {
      var productToAdd = beautyModal!.product[selectedIndex];
      cart.add({'title': productToAdd.title, 'price': productToAdd.price, 'quantity': quantity,'images': productToAdd.images,'discountPercentage' : productToAdd.discountPercentage});
    }
    calPrice();
    notifyListeners();
  }

  void TotalPrice() {
    for(int i=0; i<cart.length; i++)
    {
      discount = (price * discountPercentage) / 100;
      discountPrice = price - discount;
      shippingFee = 1.50;
      totalPrice = discountPrice + shippingFee;
      notifyListeners();
    }
  }
  Future<void> fromMap()
  async {
    ApiHelper apiHelper = ApiHelper();
    String? data = await apiHelper.fetchApiData();
    Map json = jsonDecode(data!);
    if(json.isNotEmpty)
    {
      beautyModal = BeautyModal.fromJson(json);
      notifyListeners();
    }
  }
}