
import 'package:floor/floor.dart';
import 'package:meal_planner/data/local/models/product.model.dart';

@dao
abstract class ProductDAO {
  @Query('SELECT * FROM products')
  Future<List<ProductModel>> findAllProducts();

  @Query('SELECT * FROM products WHERE id = :id')
  Future<ProductModel?> findProductById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProduct(ProductModel product);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateProduct(ProductModel product);

  @Query( 'DELETE FROM products WHERE id = :id')
  Future<void> deleteProduct(int id);
}