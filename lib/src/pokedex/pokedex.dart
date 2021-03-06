import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thousand_bits/data/pokemons.dart';
import 'package:thousand_bits/src/pokedex/widgets/generation_modal.dart';
import 'package:thousand_bits/src/pokedex/widgets/search_modal.dart';
import 'package:thousand_bits/src/product_home/widgets/singal_producr.dart';
import 'package:thousand_bits/widgets/fab.dart';
import 'package:thousand_bits/widgets/poke_container.dart';
import 'package:thousand_bits/widgets/pokemon_card.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _controller);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  void _showSearchModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchBottomModal(),
    );
  }

  void _showGenerationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GenerationModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Stack(
        children: <Widget>[
          PokeContainer(
            appBar: true,
            children: <Widget>[
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  "Freebies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                      productId: '122',
                      productName: pokemons[index].name,
                      productPicture: pokemons[index].image,
                      productPrice: '123456',
                      categoreName: pokemons[index].name,
                      inCart: true,
                      inLevel: true,
                      cartItemQuentity: '1',
                      attributes: null,
                      defaultAttributr: null,
                      description: 'Best',
                    );
                  },
                  // => PokemonCard(
                  //   pokemons[index],
                  //   index: index,
                  //   onPress: () {
                  //     print(index);
                  //     print(pokemons.length);
                  //     Navigator.of(context).pushNamed("/pokemon-info");
                  //   },
                  // ),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return IgnorePointer(
                ignoring: _animation.value == 0,
                child: InkWell(
                  onTap: () {
                    _controller.reverse();
                  },
                  child: Container(
                    color: Colors.black.withOpacity(_animation.value * 0.5),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: ExpandedAnimationFab(
        // Colors.green[200],
        items: [
          FabItem(
            "Favourite Pokemon",
            Icons.favorite,
            onPress: () {
              _controller.reverse();
            },
          ),
          FabItem(
            "All Type",
            Icons.filter_vintage,
            onPress: () {
              _controller.reverse();
            },
          ),
          FabItem(
            "All Gen",
            Icons.flash_on,
            onPress: () {
              _controller.reverse();
              _showGenerationModal();
            },
          ),
          FabItem(
            "Search",
            Icons.search,
            onPress: () {
              _controller.reverse();
              _showSearchModal();
            },
          ),
        ],
        animation: _animation,

        onPress: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
