# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! :email => 'admin@admin.com', :password => 'adminpass', :password_confirmation => 'adminpass', :address => 'test', :zipcode => 33000, :city => 'SockItCity'

cat1 = Category.create! :libCategory => "Homme"
cat2 = Category.create! :libCategory => "Femme"
cat3 = Category.create! :libCategory => "Enfant"

prod1 = Product.create! :name => "Chaussette Royale", :description => "Superbe description de chaussette", :color => "red", :price => 8, :category_id => 1

img1 = Image.create! :alt => "Description image", :file => File.new(__dir__+"/../app/assets/images/product.png"), :product_id => 1
