import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  void updateSearchQuery(String newQuery) {
    _searchQuery = newQuery;
    notifyListeners();
  }
}

// class SearchBox extends StatefulWidget {
//   @override
//   _SearchBoxState createState() => _SearchBoxState();
// }

// class _SearchBoxState extends State<SearchBox> {
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SearchProvider>(
//       builder: (context, searchProvider, child) {
//         return TextField(
//           focusNode: _focusNode,
//           decoration: InputDecoration(
//             hintText: "Search books...",
//             fillColor: Colors.white,
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             prefixIcon: Icon(Icons.search),
//           ),
//           onChanged: (value) {
//             searchProvider.updateSearchQuery(value);
//           },
//           textInputAction: TextInputAction.search,
//           onSubmitted: (_) => FocusScope.of(context).unfocus(),
//         );
//       },
//     );
//   }
// }
