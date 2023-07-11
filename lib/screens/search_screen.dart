import '../utils/export.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Ionicons.search),
                ),
              ),
            ),
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    // Simulated search results
    final List<String> searchResults = [
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 4',
    ];

    final List<String> filteredResults = searchResults
        .where((result) =>
            result.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final result = filteredResults[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            // Handle item selection
            // For example, navigate to product details page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProductDetailsPage(result),
            //   ),
            // );
          },
        );
      },
    );
  }
}

// class ProductDetailsPage extends StatelessWidget {
//   final String productName;

//   ProductDetailsPage(this.productName);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//       ),
//       body: Center(
//         child: Text('Product: $productName'),
//       ),
//     );
//   }
// }


