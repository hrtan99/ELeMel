如果我的项目对你的学习有帮助，可以给个star～
- 语言：swift

- Xcode版本：11.5

ELeMei名字由来：饿了么（ELeMe）

IOS期末大作业项目，主要实现两个tab页面，首页和订单页。
项目演示：
![demo](https://s1.ax1x.com/2020/05/24/YzdEHf.gif)
文件树如下：

```
.
├── ELeMel
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Controller
│   │   ├── FrontPage
│   │   │   ├── FrontPageNavigationViewController.swift
│   │   │   ├── FrontPageTableViewController.swift
│   │   │   ├── MealInfoViewController.swift
│   │   │   ├── MealInfoViewController.xib
│   │   │   ├── OrderPageViewController.swift
│   │   │   └── RestaurantDetailPageViewController.swift
│   │   ├── OrderFormPage
│   │   │   ├── OrderFormPageNavigationViewController.swift
│   │   │   ├── OrderFormPageViewController.swift
│   │   │   └── OrderListViewController.swift
│   │   ├── RootTabBarViewController.swift
│   │   └── UserInfoPage
│   │       ├── UserInfoPageNavigationViewController.swift
│   │       └── UserInfoPageTableViewController.swift
│   ├── Info.plist
│   ├── Models
│   │   ├── OrderModel.swift
│   │   ├── ProductionModel.swift
│   │   ├── RestaurantModel.swift
│   │   ├── ToolClass.swift
│   │   └── UserModel.swift
│   ├── ORM
│   │   ├── DAO.swift
│   │   ├── DataInit.swift
│   │   ├── ELeMel-Bridging-Header.h
│   │   └── SqliteManager.swift
│   ├── SceneDelegate.swift
│   ├── ToolClass
│   │   └── UIViewControllerExtension.swift
│   └── View
│       ├── Cells
│       │   ├── FrontPage
│       │   │   ├── CommentTableViewCell.swift
│       │   │   ├── CommentTableViewCell.xib
│       │   │   ├── DishesTableViewCell.swift
│       │   │   ├── DishesTableViewCell.xib
│       │   │   ├── RestaurantIntroductionTableViewCell.swift
│       │   │   ├── RestaurantIntroductionTableViewCell.xib
│       │   │   ├── ShopCartListTableViewCell.swift
│       │   │   └── ShopCartListTableViewCell.xib
│       │   ├── OrderFormPage
│       │   └── UserInfoPage
│       └── Views
│           ├── FrontPage
│           │   ├── CreateOrderPage
│           │   │   ├── CreateOrderPageBarUIView.swift
│           │   │   ├── CreateOrderPageBarUIView.xib
│           │   │   ├── OrderDishList.xib
│           │   │   ├── OrderDishListUIView.swift
│           │   │   ├── OrderPageUIScrollView.swift
│           │   │   ├── paymentInfoCardUIView.swift
│           │   │   └── paymentInfoCardUIView.xib
│           │   ├── RestaurantPage
│           │   │   ├── DetailPage
│           │   │   │   ├── CommentListUITableView.swift
│           │   │   │   ├── DetailPageContentUIView.swift
│           │   │   │   ├── DetailPageTitleUIView.swift
│           │   │   │   ├── DetailPageTitleUIView.xib
│           │   │   │   ├── DetailPageUIView.swift
│           │   │   │   ├── DishesListUITableView.swift
│           │   │   │   ├── RestaurantInfoUIView.swift
│           │   │   │   ├── RestaurantInfoUIView.xib
│           │   │   │   └── RestaurantPhotosUICollectionView.swift
│           │   │   ├── RestaurantInfoCardUIView.swift
│           │   │   ├── RestaurantInfoCardUIView.xib
│           │   │   └── RestaurantPageUIScrollView.swift
│           │   └── ShopCart
│           │       ├── ShopCartListHeaderView.swift
│           │       ├── ShopCartListHeaderView.xib
│           │       ├── ShopCartListUITableView.swift
│           │       ├── ShopCartUIView.swift
│           │       └── ShopCartUIView.xib
│           ├── OrderFormPage
│           │   ├── OrderDetailCardUIView.swift
│           │   ├── OrderDetailCardUIView.xib
│           │   ├── OrderFormPageUIScrollView.swift
│           │   ├── OrderInfoCardUIView.swift
│           │   ├── OrderInfoCardUIView.xib
│           │   └── OrderListPageUIScrollView.swift
│           └── UserInfoPage
├── ELeMel.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   └── IDEWorkspaceChecks.plist
│   │   └── xcuserdata
│   │       └── thomas.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── thomas.xcuserdatad
│           ├── xcdebugger
│           │   └── Breakpoints_v2.xcbkptlist
│           └── xcschemes
│               └── xcschememanagement.plist
├── ELeMelTests
│   ├── ELeMelTests.swift
│   └── Info.plist
├── ELeMelUITests
│   ├── ELeMelUITests.swift
│   └── Info.plist
└── README.md

89 directories, 183 files

```



主要的文件夹有四个：**ORM、Models、Views、Controllers**

- ORM：数据持久层，实现对数据库底层的再次封装
- Models：存放项目中使用到的实体类
- Views：主要是项目中每个页面用到的一些视图组件
- Controllers：用于控制不同的页面之间的跳转和数据交互

Views和Controllers文件夹下又分为三个文件夹：FrontPage、（）、OrderPage、UserInfoPage，与四个tab一一对应



### 数据表设计

菜品信息表设计

dish

| 属性     | 类型  | 是否主键 | 是否主键 | 是否非空 |
| -------- | ----- | -------- | -------- | -------- |
| ID       | int   |          | 是，自增 | 是       |
| 品名     | text  |          | 否       | 是       |
| 单价     | float |          | 否       | 是       |
| 原料     | text  |          | 否       | 是       |
| 简介     | text  |          | 否       | 是       |
| 月销售量 | int   |          | 是       | 是       |
| 店铺ID   | int   |          | 外键     | 是       |
| 好评率   | float |          | 否       | 是       |



店铺信息表设计

resaturant

| 属性     | 类型  | 长度 | 是否主键 | 是否非空 |
| -------- | ----- | ---- | -------- | -------- |
| ID       | int   |      | 是，自增 | 是       |
| 店铺名   | text  |      | 否       | 是       |
| 公告     | text  |      | 否       | 否       |
| 品类     | text  |      | 否       | 是       |
| 地址     | text  |      | 否       | 是       |
| 电话     | text  |      | 否       | 是       |
| 营业时间 | text  |      | 否       | 是       |
| 评分     | float |      | 是       | 是       |
| 商品数   | int   |      | 否       | 是       |



图片信息表设计

image

| 属性     | 类型 | 长度 | 是否主键 | 是否非空 |
| -------- | ---- | ---- | -------- | -------- |
| ID       | int  |      | 是，自增 | 是       |
| 类型     | text |      | 否       | 是       |
| 菜品ID   | int  |      | 外键     | 是       |
| 店铺ID   | int  |      | 外键     | 是       |
| 图片数据 | blob |      | 否       | 是       |



订单信息表设计

order

| 属性     | 类型  | 长度 | 是否主键 | 是否非空 |
| -------- | ----- | ---- | -------- | -------- |
| ID       | int   |      | 是，自增 | 是       |
| 总价     | float |      | 否       | 是       |
| 创建时间 | text  |      | 否       | 是       |
| 支付方式 | text  |      | 否       | 是       |
| 用户ID   | int   |      | 是       | 是       |
| 店铺ID   | int   |      | 是       | 是       |



订单-菜品信息表

order2dish

| 属性     | 类型 | 长度 | 是否主键 | 是否非空 |
| -------- | ---- | ---- | -------- | -------- |
| 订单ID   | int  |      | 是       | 是       |
| 菜品ID   | int  |      | 是       | 否       |
| 菜品数量 | int  |      | 否       | 是       |



用户信息表设计

user

| 属性     | 类型 | 长度 | 是否主键 | 是否非空 |
| -------- | ---- | ---- | -------- | -------- |
| ID       | int  |      | 是，自增 | 是       |
| 用户名   | text |      | 否       | 是       |
| 密码     | text |      | 否       | 是       |
| 电话     | text |      | 否       | 否       |
| 邮箱     | text |      | 否       | 否       |
| 收货地址 | text |      | 否       | 是       |







### 实体类设计

实体类的设计如下：

菜品类：

```swift
class ProductionModel {
    var ID: Int?                        // 菜品ID
    var name: String?                   // 菜品名
    var price: Float?                   // 菜品单价
    var ingredients: String?            // 菜品原料
    var info: String?                   // 菜品简介
    var saleCount: Int?                 // 菜品月销售量
    var restaurantID: Int?              // 所属餐馆ID  外键
    var rates: Float?                   // 好评率
    var productionPhoto: UIImage?       // 菜品图片 就1张
    
    var imageChanged: Bool = false      // 图片修改标志
}
```

餐馆类：

```swift
class RestaurantModel {
    var ID: Int?                     // 店铺ID
    var name: String?                // 店铺名
    var notice: String?              // 公告
    var category: String?            // 品类
    var address: String?             // 地址
    var phoneNum: String?            // 电话
    var openTime: String?            // 营业时间
    var rates: Float?                // 评分
    var productionCount: Int?        // 商品数
    var restaurantIcon: UIImage?     // 餐馆的图标
    var restaurantPhoto: [UIImage]?  // 餐馆的图片
    var restaurantPoster: UIImage?   // 餐馆首页的海报
    var dishes: [ProductionModel]?   // 餐馆的菜品
}
```

订单类：

```swift
class OrderModel {
    var ID: Int?                   // 订单ID 由数据库自动生成
    var totalPrice: Float?         // 订单总价
    var createdTime: String?       // 创建时间
    var paymentMethod: String?     // 支付方式
    var userId: Int?               // 用户ID
    var restaurantID: Int?         // 餐馆ID
    var dishesInfo: [Int: Int]?    // 包含的菜品ID和对应菜品的数量
    
    var newInstance: Bool
}
```

用户类：

```swift
class UserModel {
    var userID: Int?                         // 用户ID
    var userName: String?                    // 用户名
    var userPassword: String?                // 用户密码
    var realName: String?                    // 真实姓名
    var phoneNumber: String?                 // 用户电话号码
    var email: String?                       // 邮箱
    var address: String?                     // 地址
    var orders: [OrderModel]?           // 用户名下的订单
    
    var newInstance: Bool
    
}
```



### 如何build这个项目

第一次build时，由于本地没有创建数据库，所以需要进行数据库的初始化。

数据库初始化的函数接口调用在AppDelegate.swift文件中。

```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DAO.initDB()
        return true
    }
```

build过一次之后，就可以将`DAO.initDB()`注释掉了。之后程序就会依靠本地数据库的数据运行

