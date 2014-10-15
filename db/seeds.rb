# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


super_admin = User.create(email: 'p.murcia.morilla@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin', username: 'pmurmor')
super_admin.add_role :super_admin

admin = User.create(email: 'admin@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin')
admin.add_role :admin

department_head = User.create(email: 'department_head@gmail.com', password: 'department', password_confirmation: 'department')
department_head.add_role :department_head

teacher = User.create(email: 'teacher@gmail.com', password: 'teacherteacher', password_confirmation: 'teacherteacher')
teacher.add_role :teacher