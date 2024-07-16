import 'package:s_store/featues/personalization/models/user_model.dart';
import 'package:s_store/featues/shop/models/category_model.dart';
import 'package:s_store/utils/constants/image_strings.dart';

class DummyData {
  //banner

//user
  static final UserModel user = UserModel(
    firstname: 'Sushil',
    lastname: 'Dawadi',
    username: 'Sushil01',
    email: 'Sushildawadi4@gmail.com',
    phoneNumber: '9825157838',
    profilePicture: Images.profileImage,
  );

  static final List<CategoryModel> categories = [
    CategoryModel(id: "1", name: 'Laptops', image: '', isFeatured: true),
    CategoryModel(id: "2", name: 'Mobiles', image: '', isFeatured: true),
    CategoryModel(id: "3", name: 'Tablets', image: '', isFeatured: true),
    CategoryModel(id: "4", name: 'Accessories', image: '', isFeatured: true),
    CategoryModel(id: "5", name: 'Smart Watches', image: '', isFeatured: true),
    CategoryModel(id: "6", name: 'Headphones', image: '', isFeatured: true),
    CategoryModel(id: "7", name: 'Cameras', image: '', isFeatured: true),

    //subcategories
    //laptops
    CategoryModel(
        id: "8",
        name: 'Gaming Laptops',
        image: '',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: "9",
        name: 'Business Laptops',
        image: '',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: "10",
        name: 'Student Laptops',
        image: '',
        parentId: '1',
        isFeatured: false),

    //mobiles
    CategoryModel(
        id: "11", name: 'Android', image: '', parentId: '2', isFeatured: false),
    CategoryModel(
        id: "12", name: 'IOS', image: '', parentId: '2', isFeatured: false),
    CategoryModel(
        id: "13", name: 'Windows', image: '', parentId: '2', isFeatured: false),
    //tablets
    CategoryModel(
        id: "14",
        name: 'Samsung Tablet',
        image: '',
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: "15",
        name: 'Apple Tablet',
        image: '',
        parentId: '3',
        isFeatured: false),
    //accessories
    CategoryModel(
        id: "16",
        name: 'Laptop Accessories',
        image: '',
        parentId: '4',
        isFeatured: false),
    CategoryModel(
        id: "17",
        name: 'Mobile Accessories',
        image: '',
        parentId: '4',
        isFeatured: false),
    //smart watches
    CategoryModel(
        id: "18",
        name: 'Apple Watch',
        image: '',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: "19",
        name: 'Samsung Watch',
        image: '',
        parentId: '5',
        isFeatured: false),
    //headphone
    CategoryModel(
        id: "20",
        name: 'Logitech Headphone',
        image: '',
        parentId: '6',
        isFeatured: false),
    CategoryModel(
        id: "21",
        name: 'Razor Headphone',
        image: '',
        parentId: '6',
        isFeatured: false),
    //cameras
    CategoryModel(
        id: "22",
        name: 'Canon Camera',
        image: '',
        parentId: '7',
        isFeatured: false),
    CategoryModel(
        id: "23",
        name: 'Nikon Camera',
        image: '',
        parentId: '7',
        isFeatured: false),
  ];
}
