def print_header
    puts "The students of Villains Academy"
    puts "----------------------------"
end

def print(arguement)
    arguement.each do |x|
        puts "#{x[:name]} (#{x[:cohort]} cohort)"
    end
end

def print_footer(arguement)
    puts "Overall, we have #{arguement.count} great students."
end

def input_students
    puts "Please enter the names of the students you want to add: "
    puts "(To finish, just hit return twice)"
    @students = []
    name = gets.chomp
    while !name.empty? do
        @students << {name: name, cohort: :November}
        puts "Now we have #{@students.count} students"
        name = gets.chomp
    end
    @students
end    

@students = input_students
print_header
print(@students)
print_footer(@students)