import 'package:flutter/material.dart'; 

class KeranjangProvider with  ChangeNotifier{
   List item = [];

   void tambahItem(Map a){
      item.add(a);
      notifyListeners();
   }
}