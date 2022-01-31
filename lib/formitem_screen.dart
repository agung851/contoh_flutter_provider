import 'package:app_provider/provider/keranjang_provider.dart';
import 'package:flutter/material.dart'; 

class FormItemScreen extends StatelessWidget {
  late TextEditingController txtJudul, txtHarga;
  final KeranjangProvider? provider;
  
  FormItemScreen({ Key? key, this.provider }) : super(key: key){
     txtJudul = TextEditingController();
     txtHarga = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
         padding: const EdgeInsets.all(20),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             TextField( controller: txtJudul,
                decoration: const InputDecoration( label: Text('Nama Barang') ),
             ),

             TextField( controller: txtHarga,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration( label: Text('Harga') ),
             ),

             ElevatedButton.icon(onPressed: (){
                provider?.tambahItem({
                  'judul': txtJudul.text,
                  'harga': txtHarga.text
                });
                Navigator.pop(context);
             }, icon: const Icon(Icons.save), label: const Text('Simpan'))
             
           ],
         ), 
    );
  }
}



