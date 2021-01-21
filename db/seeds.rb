# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'admin@admin',
    password: 'testtest',
)


Customer.create!(
    first_name: '海野'
    last_name: '一郎'
    kana_first_name: 'ウミノ'
    kana_last_name: 'イチロウ'
    )