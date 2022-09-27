import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';

class EditItemProductPage extends AdminInterface{
  const EditItemProductPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SizedBox(
          height: 33, 
        ),
        IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: const BoxDecoration(
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage('https://www.mhany-store.com/IMG/VALO/004.jpg')
            ),
          ),
        ),
      ],
    );
  }
}