import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    Widget contentSection = Container(
      margin: EdgeInsetsDirectional.only(top: 16),
      child: Column(
        children: [
          _buildContentHeader(),
          _buildContentList(),
        ],
      ),
    );

    final List _imageUrls = [
      'images/banner1.jpg',
      'images/banner2.jpg',
      'images/banner3.jpg',
    ];

    Widget swiperSection = Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 144,
              width: double.maxFinite,
              child: PhysicalModel(
                  color: Colors.transparent, //设置背景底色透明
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAlias, //注意这个属性
                  child: SizedBox(
                    height: 144,
                    width: double.maxFinite,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          _imageUrls[index],
                          fit: BoxFit.fitWidth,
                        );
                      },
                      pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white,
                        color: Colors.grey,
                      )),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            swiperSection,
            contentSection,
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text("圈子")),
            BottomNavigationBarItem(
                icon: Icon(Icons.near_me), title: Text("商城")),
            BottomNavigationBarItem(
                icon: Icon(Icons.near_me), title: Text("我的"))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF007AFF),
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildContentHeader() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 15),
      decoration: ShapeDecoration(
          color: Color(0xffe0e0e0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)))),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '设计大家说',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF333333),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '查看更多',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF666666),
                  ),
                ),
                Container(
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/right.png'),
                          fit: BoxFit.fitWidth),
                      shape: RoundedRectangleBorder()),
                  width: 12,
                  height: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContentList() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      decoration: ShapeDecoration(
          color: Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _buildContentListRow(
            1,
            'Jennie Perkins',
            '但无论是哪种类型用户，都一定会有同种共性——好奇心。好奇心足以牵引着一个人对所产生事物的关注程度和好感度。',
            '1984/02/11'),
        _buildContentListRow(
            2,
            'Noah Wise',
            '品牌也远不是强调名称，标志，符号或者商标。它融合了一系列定义其形象的独特价值，并作为一份不成文的合同。',
            '1987/04/01'),
        _buildContentListRow(3, 'Olive Palmer',
            '根据对比来思考并不会让人逻辑混乱，因为即使是对比也可以联结称一个和谐的整体。有些概念只有通过。', '2009/11/26'),
        _buildContentListRow(4, 'Rosa Clayton',
            '好的界面设计并不始于图片，而是始于对人的理解，比如人们喜欢什么，为什么人们会试用某种特定的软件。', '1984/04/07'),
        _buildContentListRow(5, 'Harriet Edwards',
            '套用模型省时省力，不用冥思苦想，但是，每一个需要设计的内容和体系应该是迥然不同的。', '1980/11/08'),
      ]),
    );
  }

  Widget _buildContentListRow(
      int rowIndex, String author, String content, String time) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/row$rowIndex.jpg'),
                      fit: BoxFit.fitWidth),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(4))),
              width: 80,
              height: 80,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$author',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF333333),
                              ),
                            ),
                            Text(
                              '$time',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF999999),
                              ),
                            ),
                          ]),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 8),
                        child: Text(
                          '$content',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Test Demo',
    home: MyApp(),
  ));
}
