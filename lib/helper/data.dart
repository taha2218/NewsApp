import '../models/CategoryModel.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> categories = [
    CategoryModel(categoryName: 'Business',imageUrl:'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80' ),
    CategoryModel(categoryName: 'Entertainment',imageUrl:'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80' ),
    CategoryModel(categoryName: 'General',imageUrl:'https://images.unsplash.com/photo-1498644035638-2c3357894b10?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60' ),
    CategoryModel(categoryName: 'Health',imageUrl:'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60' ),
    CategoryModel(categoryName: 'Science',imageUrl:'https://images.unsplash.com/photo-1534777410147-084a460870fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60' ),
    CategoryModel(categoryName: 'Sports',imageUrl:'https://images.unsplash.com/photo-1575343406274-b62ac3a76863?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60' ),
    CategoryModel(categoryName: 'Technology',imageUrl:'https://images.unsplash.com/photo-1455165814004-1126a7199f9b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60' ),
  ];

  return categories;
}