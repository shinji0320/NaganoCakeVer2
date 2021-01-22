# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'admin@admin',
    password: 'testtest'
)
Customer.create!(
    [
        {
            email: '123@456',
            password: '123456',
            first_name: "難波",
            last_name: "太郎",
            kana_first_name: "なんば",
            kana_last_name: "たろう",
            postal_code: "5240076",
            address: "大阪府大阪市中央区難波4丁目7-14難波フロントビル４階",
            telephone_number:"0678785677"
        },
        {
            email: '654@321',
            password: '654321',
            first_name: "難波",
            last_name: "花子",
            kana_first_name: "なんば",
            kana_last_name: "はなこ",
            postal_code: "5420076",
            address: "大阪府大阪市中央区難波４丁目４−４ 難波御堂筋センタービル 8F",
            telephone_number:"0678785677"
        },
        {
            email: '111@111',
            password: '111111',
            first_name: "新宿",
            last_name: "健太",
            kana_first_name: "しんじゅく",
            kana_last_name: "けんた",
            postal_code: "1600022",
            address: "東京都新宿区新宿２丁目５−１０ 成信ビル 4階",
            telephone_number:"03-6869-4700"
        },
        {
            email: '222@222',
            password: '222222',
            first_name: "渋谷",
            last_name: "校",
            kana_first_name: "しぶや",
            kana_last_name: "こう",
            postal_code: "150-0041",
            address: "東京都渋谷区神南１丁目１９−１１ パークウェースクエスクエア24階",
            telephone_number:"0368694700"
        },
        {
            email: '333@333',
            password: '333333',
            first_name: "東京",
            last_name: "シー",
            kana_first_name: "とうきょう",
            kana_last_name: "しー",
            postal_code: "279-0031",
            address: "千葉県浦安市舞浜１−１",
            telephone_number:"045-330-5211"
        }
    ]
)

Genre.create!(
    [
        {
            name: "ケーキ"
        },
        {
            name: "焼き菓子"
        },
        {
            name: "キャンディ"
        },
        {
            name: "プリン"
        }
    ]
)
Order.create!(
    [
        {
            customer_id: "5",
            address: "千葉県浦安市舞浜１−１",
            postal_code: "279-0031",
            name: "東京シー",
            total_price: "4500"
        },
        {
            customer_id: "5",
            address: "千葉県浦安市舞浜１−１",
            postal_code: "279-0031",
            name: "東京シー",
            total_price: "50000"
        },
        {
            customer_id: "5",
            address: "千葉県浦安市舞浜１−１",
            postal_code: "279-0031",
            name: "東京シー",
            total_price: "6000"
        },
        {
            customer_id: "4",
            address: "東京都渋谷区神南１丁目１９−１１ パークウェースクエスクエア24階",
            postal_code: "150-0041",
            name: "渋谷校",
            total_price: "500"
        }
    ]
)
Item.create!(
    [
        {
            genre_id: "1",
            image_id: "nk_disneycake03_w590.jpg",
            name: "プーさんcake",
            detail: "セブンイレブンと共同開発しました",
            price: "500",
            is_sold: "true"
        },
        {
            genre_id: "1",
            image_id: "img_c84825d1163b33f19f01b45b808e8a3982576.jpg",
            name: "ドナルド,デイジーcake",
            detail: "ディズニーコラボ商品です",
            price: "800",
            is_sold: "true"
        },
        {
            genre_id: "1",
            image_id: "スクリーンショット-2018-03-03-12.22.07のコピー.png",
            name: "ミッキーパンケーキ",
            detail: "ディズニーランドホテルの提供",
            price: "400",
            is_sold: "true"
        },
        {
            genre_id: "1",
            image_id: "shutterstock_image-73のコピー14-750x750.jpg",
            name: "ウエディングケーキ'シンデレラ城'",
            detail: "セブンイレブンで発売している",
            price: "12000",
            is_sold: "true"
        },
        {
            genre_id: "2",
            image_id: "imgrc0131499160.jpg",
            name: "Disney焼き菓子詰め合わせ",
            detail: "オンランストアでも販売中",
            price: "3000",
            is_sold: "true"
        },
        {
            genre_id: "3",
            image_id: "e8fc6effbb56e7ff18586840767b9a34.jpg",
            name: "フルーツキャンディ",
            detail: "2020年売れ筋ナンバーワン",
            price: "780",
            is_sold: "true"
        },
        {
            genre_id: "4",
            image_id: "5dddf1c67ebad_1.jpg",
            name: "魔法のランプ付きプリン",
            detail: "一日20個限定",
            price: "320",
            is_sold: "true"
        }
    ]
)
Order_item.create!(
    [
        {
            item_id: "1",
            order_id: "1",
            count: "1",
            making_status: "1",
            purchased_price: "3700"
        }
    ]
)