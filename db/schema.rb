# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121114193521) do

  create_table "announcements", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "announceable_id",   :null => false
    t.string   "announceable_type", :null => false
    t.text     "message",           :null => false
    t.datetime "ends_at",           :null => false
  end

  add_index "announcements", ["announceable_id", "announceable_type", "ends_at"], :name => "index_announcements_on_announceable_and_ends_at"

  create_table "articles", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "title",        :null => false
    t.text     "body_html",    :null => false
    t.string   "tumblr_url",   :null => false
    t.integer  "author_id"
    t.date     "published_on", :null => false
  end

  add_index "articles", ["author_id"], :name => "index_articles_on_author_id"

  create_table "articles_topics", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "topic_id",   :null => false
  end

  add_index "articles_topics", ["article_id", "topic_id"], :name => "index_articles_topics_on_article_id_and_topic_id", :unique => true

  create_table "audiences", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "tumblr_user_name", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

  add_index "authors", ["tumblr_user_name"], :name => "index_authors_on_tumblr_user_name", :unique => true

  create_table "classifications", :force => true do |t|
    t.integer  "topic_id"
    t.string   "classifiable_type"
    t.integer  "classifiable_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "code"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",            :default => true,         :null => false
    t.string   "discount_type",     :default => "percentage", :null => false
    t.boolean  "one_time_use_only", :default => false,        :null => false
  end

  add_index "coupons", ["code"], :name => "index_coupons_on_code"

  create_table "courses", :force => true do |t|
    t.string   "name",                                        :null => false
    t.integer  "price"
    t.text     "description"
    t.time     "start_at"
    t.time     "stop_at"
    t.integer  "maximum_students",          :default => 12,   :null => false
    t.boolean  "public",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description"
    t.string   "external_registration_url"
    t.integer  "position"
    t.integer  "audience_id"
    t.string   "course_image_file_name"
    t.string   "course_image_file_size"
    t.string   "course_image_content_type"
    t.string   "course_image_updated_at"
    t.string   "promo_location"
  end

  add_index "courses", ["audience_id"], :name => "index_courses_on_audience_id"

  create_table "downloads", :force => true do |t|
    t.integer  "product_id"
    t.string   "download_file_name"
    t.string   "download_file_size"
    t.string   "download_content_type"
    t.string   "download_updated_at"
    t.string   "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.string   "old_url"
    t.string   "file"
    t.text     "description"
    t.text     "notes"
    t.date     "published_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "file_size"
    t.integer  "duration"
  end

  create_table "follow_ups", :force => true do |t|
    t.string   "email"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "notified_at"
  end

  add_index "follow_ups", ["course_id"], :name => "index_follow_ups_on_course_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "tagline"
    t.string   "call_to_action"
    t.string   "short_description"
    t.text     "description"
    t.integer  "individual_price"
    t.integer  "company_price"
    t.string   "product_type"
    t.boolean  "active",                        :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fulfillment_method"
    t.integer  "github_team"
    t.string   "github_url"
    t.text     "questions"
    t.text     "terms"
    t.text     "alternative_description"
    t.string   "product_image_file_name"
    t.string   "product_image_file_size"
    t.string   "product_image_content_type"
    t.string   "product_image_updated_at"
    t.text     "external_purchase_url"
    t.string   "external_purchase_name"
    t.string   "external_purchase_description"
    t.string   "promo_location"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "product_id"
    t.string   "stripe_customer"
    t.string   "variant"
    t.string   "name"
    t.string   "email"
    t.string   "organization"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lookup"
    t.integer  "coupon_id"
    t.text     "readers"
    t.boolean  "paid",                   :default => false,    :null => false
    t.string   "payment_method",         :default => "stripe", :null => false
    t.string   "country"
    t.string   "payment_transaction_id"
    t.integer  "user_id"
    t.integer  "paid_price"
  end

  add_index "purchases", ["lookup"], :name => "index_purchases_on_lookup"
  add_index "purchases", ["product_id"], :name => "index_purchases_on_product_id"
  add_index "purchases", ["stripe_customer"], :name => "index_purchases_on_stripe_customer"

  create_table "questions", :force => true do |t|
    t.integer  "course_id"
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["course_id"], :name => "index_questions_on_course_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month"
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "registrations", :force => true do |t|
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "freshbooks_invoice_id"
    t.string   "freshbooks_invoice_url"
    t.integer  "coupon_id"
    t.string   "email"
    t.string   "billing_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "freshbooks_client_id"
    t.text     "comments"
    t.boolean  "paid",                   :default => false, :null => false
    t.integer  "user_id"
  end

  add_index "registrations", ["paid"], :name => "index_registrations_on_paid"
  add_index "registrations", ["section_id"], :name => "index_registrations_on_section_id"

  create_table "resources", :force => true do |t|
    t.integer "course_id"
    t.string  "name"
    t.string  "url"
  end

  add_index "resources", ["course_id"], :name => "index_resources_on_course_id"

  create_table "section_teachers", :force => true do |t|
    t.integer  "section_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_teachers", ["section_id"], :name => "index_section_teachers_on_section_id"
  add_index "section_teachers", ["teacher_id"], :name => "index_section_teachers_on_teacher_id"

  create_table "sections", :force => true do |t|
    t.integer  "course_id"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seats_available"
    t.time     "start_at"
    t.time     "stop_at"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "reminder_email"
  end

  add_index "sections", ["course_id"], :name => "index_sections_on_course_id"

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "gravatar_hash"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "topics", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.text     "trail_map"
    t.string   "keywords"
    t.string   "name",                          :null => false
    t.string   "slug",                          :null => false
    t.text     "summary"
    t.integer  "count"
    t.boolean  "featured",   :default => false, :null => false
  end

  add_index "topics", ["slug"], :name => "index_topics_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.boolean  "email_confirmed",                   :default => true,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reference"
    t.boolean  "admin",                             :default => false, :null => false
    t.string   "stripe_customer"
    t.string   "github_username"
    t.string   "auth_provider"
    t.integer  "auth_uid"
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "videos", :force => true do |t|
    t.integer  "product_id"
    t.string   "wistia_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end