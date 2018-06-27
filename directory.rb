
def print_header
    puts "The students of Villains Academy"
    puts "----------------------------"
end

def print(students)
    students.each do |student|
        if student[:name].length < 12   
          puts "#{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students."
end

def input_students
    puts "Please enter the names of the students you want to add: "
    puts "(To finish, just hit return twice)"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :November}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end    

students = input_students
print(students)