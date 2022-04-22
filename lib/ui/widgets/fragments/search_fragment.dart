import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';

class SearchFragment extends StatelessWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _SearchBar(
                      onQueryChanged: (query) {
                        // todo: process query operation
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Search',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: kTextFontSize,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outlined,
                            size: kDefaultIconSize,
                            color: kSecondaryColor,
                          ),
                          splashRadius: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Search Result',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: kTextFontSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (int i = 0; i < 50; i++) _SearcchListItem(index: i)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearcchListItem extends StatelessWidget {
  const _SearcchListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: kSecondaryColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                searchList[index % searchList.length]['image'],
                width: 40,
                height: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search Result $index',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: kTextFontSize,
                  ),
                ),
                Text(
                  'Data $index',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
    required this.onQueryChanged,
  }) : super(key: key);
  final Function(String) onQueryChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onQueryChanged,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            size: kDefaultIconSize,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: kTitlesFontSize,
          ),
        ),
      ),
    );
  }
}
