import 'package:flutter/material.dart';

//class Search extends StatelessWidget {
  //const Search({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//         IconButton( 
//           onPressed: () {
//             showSearch(
//               context: context,
//               delegate: MySearchDelegate()
//               );
//               },
//               icon: const Icon(Icons.search),
//               )
//               ),
//         body: const Center(
//           child: const Text("Search"),
//               ),
//               );
//           },
    //  }

class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);
 
  @override
  State<GFG> createState() => _GFGState();
}
 
class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
        ),
        actions: [
          IconButton(
            onPressed: () {null;},
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

// class MySearchDelegate extends SearchDelegate {

//   @override
//   Widget? buildLeading(BuildContext context) =>
//    IconButton(
//     onPressed: () => close(context, null), 
//     icon: const Icon(Icons.arrow_back)
//     );

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () =>
//         {if (query.isEmpty){
//           close(context, null)
//         } else
//           {query = ''}}
//     );
//   }
//   @override
//   Widget buildSuggestions(BuildContext context){
//     List<String> suggestions = [
//       'Adidas',
//       'Nike',
//       'puma'
//     ];

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder:  (context, index){
//         final suggestion = suggestions[index];

//         return ListTile(
//           title: Text(suggestion),
//         onTap: (){
//           query = suggestion;
//           showResults(context);
//         },);
//     }
//     );
//   }
// }
