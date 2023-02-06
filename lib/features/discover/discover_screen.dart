import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  final TextEditingController _textEditingController =
      TextEditingController(text: "initial Text");
  late TabController _tabController;
  int _currentPage = 0;

  void _onSearchChanged(String text) {
    // print(text);
  }

  void _onSearchSubmitted(String text) {
    // print("submitted Text : $text");
  }

  void _onUnfocusTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    _tabController.animation!.addListener(() {
      if ((_tabController.animation!.value - _currentPage).abs() > 0.2) {
        _onUnfocusTap();
        setState(() {
          _currentPage = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            const FaIcon(FontAwesomeIcons.chevronLeft),
            Gaps.h10,
            Expanded(
                child: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            )),
            Gaps.h10,
            const FaIcon(FontAwesomeIcons.sliders),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
          splashFactory: NoSplash.splashFactory,
          isScrollable: true,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
          tabs: [for (var tab in tabs) Tab(text: tab)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GestureDetector(
            onTap: _onUnfocusTap,
            child: GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.size10,
                    mainAxisSpacing: Sizes.size10,
                    childAspectRatio: 9 / 20),
                itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size4)),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/image/tree.jpg",
                              image:
                                  "https://images.unsplash.com/photo-1674653834059-1da760d2a3d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            ),
                          ),
                        ),
                        Gaps.v10,
                        const Text(
                          "This is very long caption for my tiktok that im upload jst now currently",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.v5,
                        DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1674674614404-604aad76d8a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1261&q=80"),
                                radius: Sizes.size12,
                              ),
                              Gaps.h4,
                              const Expanded(
                                child: Text(
                                  "My avartar text is very very long~~",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Gaps.h2,
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size14,
                                color: Colors.grey.shade600,
                              ),
                              Gaps.h2,
                              const Text("2.5M")
                            ],
                          ),
                        )
                      ],
                    )),
          ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(tab),
            ),
        ],
      ),
    );
  }
}
