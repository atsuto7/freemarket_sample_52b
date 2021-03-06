class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "postal_code", null: false
      t.integer "prefecture", null: false
      t.string "city", null: false
      t.string "street_number", null: false
      t.string "building"
      t.integer "home_number"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id"
      t.index ["user_id"], name: "index_addresses_on_user_id"
    end
    create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "image", null: false
      t.bigint "product_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["product_id"], name: "index_images_on_product_id"
    end
    create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name", null: false
      t.text "description", null: false
      t.integer "status", null: false
      t.integer "obligation_fee", null: false
      t.integer "shipment_method", null: false
      t.string "brand"
      t.integer "deliverytime", null: false
      t.integer "price", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "prefecture_id"
      t.index ["brand"], name: "index_products_on_brand"
      t.index ["name"], name: "index_products_on_name"
    end
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "nickname", null: false
      t.string "kanji_surname", null: false
      t.string "kanji_name", null: false
      t.string "kana_surname", null: false
      t.string "kana_name", null: false
      t.integer "phone_number", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    add_foreign_key "addresses", "users"
    add_foreign_key "images", "products"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
