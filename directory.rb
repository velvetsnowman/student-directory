def print_header
    puts "The students of Villains Academy"
    puts "------------------------------------"
end

def print(arguement)
    arguement.each do |x|
        puts "#{x[:name]} (#{x[:cohort]} cohort)"
    end
end

def print_footer(arguement)
    if arguement.count <= 1
      puts "Overall, we have #{arguement.count} great student."
    else
      puts "Overall, we have #{arguement.count} great students."
    end
end

def input_students
    puts "Please enter the names of the students you want to add: "
    puts "(To finish, just hit return twice)"
    @students = []
    name = gets.chomp.capitalize
    while !name.empty? do
        puts "What cohort are they in?"
        cohort = gets.chomp.capitalize
        if cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"
          @students << {name: name, cohort: cohort.to_sym}
          if @students.count <= 1
            puts "Now we have #{@students.count} student"
            puts "Next student:"
          else 
            puts "Now we have #{@students.count} students"
            puts "Next student:"
          end
          name = gets.chomp.capitalize
        else
          puts "That month doesn't exist, check your spelling!"
        end
    end
    @students
end

@students = input_students
print_header
print(@students)
print_footer(@students)