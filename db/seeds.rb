# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Board.delete_all

boards = Board.create!([{name: "Arts & Craft"}, {name: "Performing Arts"}, {name: "Math & Science"}, {name: "Language Arts"}, {name: "Athletics"}])
