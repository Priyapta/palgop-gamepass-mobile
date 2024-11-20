import 'package:e_commerce/screens/form.dart';
import 'package:e_commerce/screens/list_product.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class HomeButtons {
  final String name;
  final IconData icon;
  final Color color;

  HomeButtons(this.name, this.icon, this.color);
}

class ButtonCard extends StatelessWidget {
  final HomeButtons item;

  const ButtonCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));
          if (item.name == "Add Products") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ItemEntryFormPage()));
          } else if (item.name == "See Products") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const productEntry()),
            );
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginApp()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 35.0,
                ),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
