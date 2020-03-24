import 'package:flutter/material.dart';
import 'package:thousand_bits/configs/AppColors.dart';
import 'package:thousand_bits/src/home/widgets/category_list.dart';
import 'package:thousand_bits/src/home/widgets/news_list.dart';
import 'package:thousand_bits/widgets/poke_container.dart';

class Home extends StatefulWidget {
  static const cardHeightFraction = 0.65;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController;
  double _cardHeight;
  bool _showTitle;
  bool _showToolbarColor;

  @override
  void initState() {
    _cardHeight = 0;
    _showTitle = false;
    _showToolbarColor = false;
    _scrollController = ScrollController()..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final showTitle = _scrollController.offset > _cardHeight - kToolbarHeight;

    final showToolbarColor = _scrollController.offset > kToolbarHeight;

    if (showTitle != _showTitle || showToolbarColor != _showToolbarColor) {
      setState(() {
        _showTitle = showTitle;
        _showToolbarColor = showToolbarColor;
      });
    }
  }

  Widget _buildCard() {
    return PokeContainer(
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      children: <Widget>[
        SizedBox(height: 117),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: Image(
              image: AssetImage("assets/images/thumbnail.png"),
              height: 55,
            )
            // Text(
            //   "What Pokemon\nare you looking for?",
            //   style: TextStyle(
            //     fontSize: 30,
            //     height: 0.9,
            //     fontWeight: FontWeight.w900,
            //   ),
            // ),
            ),
        SizedBox(height: 40),
        // SearchBar(),
        SizedBox(height: 42),
        CategoryList(),
      ],
    );
  }

  Widget _buildNews() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 28, right: 28, top: 0, bottom: 22),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Pokémon News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.indigo,
                ),
              ),
            ],
          ),
        ),
        NewsList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    _cardHeight = screenHeight * Home.cardHeightFraction;

    return Scaffold(
      backgroundColor: Colors.green[300],
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            expandedHeight: _cardHeight,
            floating: true,
            pinned: true,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              title: _showTitle
                  ? Text(
                      "Pokedext",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : null,
              background: _buildCard(),
            ),
          ),
        ],
        body: _buildNews(),
      ),
    );
  }
}