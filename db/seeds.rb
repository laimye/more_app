# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Invite.destroy_all
Trip.destroy_all
User.destroy_all


# Create User(s)
@users = User.create([
{name: "Elena K", email: "elena@gmail.com", about: "The author of this app.", fact: "I am the creator.", places: "Russia, Europe", password: "123abc"},
{name: "Ilya Ts", email: "ilya@gmail.com", about: "I am from SPb", fact: "I live in OC", places: "Europe, South America", password: "123abc"},
{name: "Alisa", email: "alisa@gmail.com", about: "I am Elena's niece", fact: "I am 4 years old", places: "Russia, USA", password: "123abc"}
])

# Create Trips
@trips = Trip.create([
	{place: "Spain", startdate: "09/03/2017", enddate: "09/10/2017", about: "A trip to Spain.", user_id: User.first.id},
	{place: "Bora Bora", startdate: "04/03/2017", enddate: "04/10/2017", about: "A trip to French Polynesia.", user_id: @users[1].id},
	{place: "Saint Petersburg", startdate: "10/03/2017", enddate: "10/10/2017", about: "A trip to Russia.", user_id: User.first.id}
])

# Create Invites

Invite.create(user: @users[0], trip: Trip.first)
Invite.create(user: @users[1], trip: Trip.first)
Invite.create(user: @users[2], trip: Trip.first)
Invite.create(user: @users[0], trip: @trips[1])
Invite.create(user: @users[1], trip: @trips[1])
Invite.create(user: @users[0], trip: @trips[2])

#Create Posts

@posts = Post.create([
	{user: @users[0], trip: @trips[0], content: "Hello World"},
	{user: @users[0], trip: @trips[1], content: "I am excited to go"},
	{user: @users[1], trip: @trips[1], content: "Who else is going?"}
])

Post.first.comments.create([
	{content: "A lot of people", user: @users[0]},
	{content: "We all are going", user: @users[1]}
])

# Create Announcements

@announcements = Announcement.create([
	{user: @users[0], trip: @trips[0], content: "Achtung! Attention!"},
	{user: @users[1], trip: @trips[0], content: "We leave at 8am. Don't miss the boat!"}
])



puts "Created #{User.count} users.\nCreated #{Trip.count} trips.\nCreated #{Post.count} posts.\nCreated #{Announcement.count} announcements.\nCreated #{Comment.count} comments"
