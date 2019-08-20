User.create!(name: "Nguyen Ba Admin",
             email: "thaithitien1997@gmail.com",
             username: "nguyenadmin",
             password: "12345678",
             password_confirmation: "12345678",
             role: 2)
User.create!(name: "Nguyen Ba Hung",
             email: "hungpronguyen256@gmail.com",
             username: "nguyenhung",
             password: "12345678",
             password_confirmation: "12345678",
             role: 0)

User.create!(name: "Nguyen Ba Ship",
             email: "ship@gmail.com",
             username: "nguyenship",
             password: "12345678",
             password_confirmation: "12345678",
             role: 0)

c1 = Category.new name: "Kinh tế", parent_id: nil
c1.save!
#
c2 = Category.new name: "Văn học", parent_id: nil
c2.save!

c21 = Category.new name: "Tản mạn", parent_id: c2.id
c21.save!

c22 = Category.new name: "Truyện", parent_id: c2.id
c22.save!
#
c3 = Category.new name: "Thiếu nhi", parent_id: nil
c3.save!

c4 = Category.new name: "Tin học", parent_id: nil
c4.save!

c5 = Category.new name: "Ngôn tình", parent_id: nil
c5.save!

# Child category of "Kinh Te"
c111 = Category.new name: "Marketing - Bán hàng", parent_id: c1.id
c111.save!

c = Category.new name: "Ngoại thương", parent_id: c1.id
c.save!

c = Category.new name: "Nhân sự & Việc làm", parent_id: c1.id
c.save!

c = Category.new name: "Nhân vật & Bài học kinh doanh", parent_id: c1.id
c.save!

c = Category.new name: "Quản trị - Lãnh đạo", parent_id: c1.id
c.save!

c = Category.new name: "Tài chính - Kế toán", parent_id: c1.id
c.save!

c = Category.new name: "Đầu tư - Chứng khoán", parent_id: c1.id
c.save!

# child of category c21:
c = Category.new name: "Phê bình văn học", parent_id: c21.id
c.save!

c = Category.new name: "Phóng sự, ký sự", parent_id: c21.id
c.save!

c = Category.new name: "Sách về nhân vật văn học", parent_id: c21.id
c.save!

c = Category.new name: "Thơ ca", parent_id: c21.id
c.save!

c = Category.new name: "Tiểu thuyết lãng mạn", parent_id: c21.id
c.save!

c = Category.new name: "Tiểu thuyết lịch sử", parent_id: c21.id
c.save!

# child of category c22:
c = Category.new name: "Truyện & Thơ ca dân gian", parent_id: c22.id
c.save!

c = Category.new name: "Truyện & Thơ ca dân gian", parent_id: c22.id
c.save!

c = Category.new name: "Truyện & Thơ ca dân gian", parent_id: c22.id
c.save!

c = Category.new name: "Truyện & Thơ ca dân gian", parent_id: c22.id
c.save!

c = Category.new name: "Truyện & Thơ ca dân gian", parent_id: c22.id
c.save!

#Child of category C3:
c = Category.new name: "Khoa học tự nhiên", parent_id: c3.id
c.save!

c = Category.new name: "Khoa học xã hội", parent_id: c3.id
c.save!

c = Category.new name: "Mỹ thuật âm nhạc", parent_id: c3.id
c.save!

c = Category.new name: "Sách Ngoại Ngữ", parent_id: c3.id
c.save!

c = Category.new name: "Truyên Tranh", parent_id: c3.id
c.save!

#Child of category c4:
c = Category.new name: "Cơ sở dữ liệu", parent_id: c4.id
c.save!

c = Category.new name: "Hệ điều hành", parent_id: c4.id
c.save!

c = Category.new name: "Internet & Mạng máy tính", parent_id: c4.id
c.save!

c = Category.new name: "Lập trình & Phần mềm ứng dụng", parent_id: c4.id
c.save!

c = Category.new name: "Lập trình web", parent_id: c4.id
c.save!

c = Category.new name: "Tin học cơ bản", parent_id: c4.id
c.save!

c = Category.new name: "Đồ họa", parent_id: c4.id
c.save!

# Product

a = Faker::Lorem.paragraph(20)
20.times.each do
  p = Product.new category_id: c111.id, name: "HỐI HẬN", price: 100000, thumbnail: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg?w=800&quality=85",
                  description: a, number_items: 10, count_view: 10, old_price: 5000000, overview: "Sach nay giup chung ta nang cao kha nang tri tue, va ban co the tro thanh mot CEO noi tieng"
  p.save!

  9.times.each do
    s = ImageSlide.create product_id: p.id, image: "https://elgarblog.files.wordpress.com/2014/01/education-books.jpg"
    s.save!
  end
end