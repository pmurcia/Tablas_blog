# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Subject.create(name: 'Matemáticas')
Course.create(name: '1º ESO C')
admin = User.create(email: 'p.murcia.morilla@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin')
admin.add_role :admin

teacher = User.create(email: 'teacher@gmail.com', password: 'teacherteacher', password_confirmation: 'teacherteacher')
teacher.add_role :teacher