# this app.rb file is for many-to-many associations homework

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/college_class'
require './models/student'
require './models/student_class'

get '/' do
    Student.all.to_yaml + CollegeClass.all.to_yaml + StudentClass.all.to_yaml
end

get '/students' do
    @students = Student.all
    erb :students
end

get '/student/:id' do
    @student = Student.find_by(id: params[:id])
    if @student.nil?
        return "Student not found"
    end
    erb :student
end

get '/classes' do
    @cls = CollegeClass.all
    erb :classes
end

get '/class/:id' do
    @cl = CollegeClass.find_by(id: params[:id])
    if @cl.nil?
        return "Class not found"
    end
    erb :class
end