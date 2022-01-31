import 'package:app_provider/formitem_screen.dart';
import 'package:app_provider/provider/keranjang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItemScreen extends StatelessWidget {
  const ListItemScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_)=>KeranjangProvider(),
      builder: (context,w) {
        return Scaffold(
              appBar: AppBar(
                title: const Text('Daftar isi Keranjang'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                    showDialog(context: context, builder: (c){
                      return Dialog(
                        child: FormItemScreen(
                          provider: context.read<KeranjangProvider>(),
                        ),
                      );
                    });
                },
                child: const Icon(Icons.add),
              ),
              body:Consumer<KeranjangProvider>(
                builder: (c,p,w){
                  return ListView(
                    children: [
                      for( var a in p.item)
                          ListTile(
                            title: Text('${a['judul']}'),
                            subtitle: Text('${a['harga']}'),
                          )
                    ],
                  );
                }
              )  
        );
      }
    );
  }
}