// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $LocalDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $LocalDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $LocalDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<LocalDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorLocalDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $LocalDatabaseBuilderContract databaseBuilder(String name) =>
      _$LocalDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $LocalDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$LocalDatabaseBuilder(null);
}

class _$LocalDatabaseBuilder implements $LocalDatabaseBuilderContract {
  _$LocalDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $LocalDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $LocalDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<LocalDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$LocalDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LocalDatabase extends LocalDatabase {
  _$LocalDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductDAO? _productDAOInstance;

  RecipeDAO? _recipeDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `products` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `price` REAL NOT NULL, `quantity` INTEGER NOT NULL, `image` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `recipes` (`name` TEXT NOT NULL, `price` REAL NOT NULL, `id` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE UNIQUE INDEX `index_products_id` ON `products` (`id`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_products_name` ON `products` (`name`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_recipes_id` ON `recipes` (`id`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_recipes_name` ON `recipes` (`name`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDAO get productDAO {
    return _productDAOInstance ??= _$ProductDAO(database, changeListener);
  }

  @override
  RecipeDAO get recipeDAO {
    return _recipeDAOInstance ??= _$RecipeDAO(database, changeListener);
  }
}

class _$ProductDAO extends ProductDAO {
  _$ProductDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productModelInsertionAdapter = InsertionAdapter(
            database,
            'products',
            (ProductModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                }),
        _productModelUpdateAdapter = UpdateAdapter(
            database,
            'products',
            ['id'],
            (ProductModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductModel> _productModelInsertionAdapter;

  final UpdateAdapter<ProductModel> _productModelUpdateAdapter;

  @override
  Future<List<ProductModel>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM products',
        mapper: (Map<String, Object?> row) => ProductModel(
            id: row['id'] as String,
            name: row['name'] as String,
            price: row['price'] as double,
            quantity: row['quantity'] as int,
            image: row['image'] as String?));
  }

  @override
  Future<ProductModel?> findProductById(String id) async {
    return _queryAdapter.query('SELECT * FROM products WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ProductModel(
            id: row['id'] as String,
            name: row['name'] as String,
            price: row['price'] as double,
            quantity: row['quantity'] as int,
            image: row['image'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM products WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    await _productModelInsertionAdapter.insert(
        product, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await _productModelUpdateAdapter.update(
        product, OnConflictStrategy.replace);
  }
}

class _$RecipeDAO extends RecipeDAO {
  _$RecipeDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _recipeModelInsertionAdapter = InsertionAdapter(
            database,
            'recipes',
            (RecipeModel item) => <String, Object?>{
                  'name': item.name,
                  'price': item.price,
                  'id': item.id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecipeModel> _recipeModelInsertionAdapter;

  @override
  Future<List<RecipeModel>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM recipes',
        mapper: (Map<String, Object?> row) => RecipeModel(
            id: row['id'] as String,
            name: row['name'] as String,
            price: row['price'] as double));
  }

  @override
  Future<void> insertRecipe(RecipeModel recipe) async {
    await _recipeModelInsertionAdapter.insert(
        recipe, OnConflictStrategy.replace);
  }
}
