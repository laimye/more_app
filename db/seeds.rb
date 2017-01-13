# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@users[1].posts[0].comments.create([
 {content: "Two alieans fell at the same speed."},
 {content: "3 space ships fell at the same speed."}
])

@users[0].posts[0].comments.create([
 {content: "Two fishes fell at the same speed."},
 {content: "3 Sea animals fell at the same speed."}
])