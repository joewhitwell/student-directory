@students = [] # an empty array 

def input_students
  puts "Please enter the names of the students" #user ptompt 
  puts "To finish, just hit return twice" #use prompt
  # first name input
  
  
  name = gets.chomp #takes user input and removes extra lines

  
  
  while !name.empty? do #Run block while name is not empty 
  
    
    
    @students << {name: name, cohort: :november}
    
    puts "Now we have #{@students.count} students" # prints out the number of students
    
  
    name = gets.chomp #takes a further student name 
  end
end

def interactive_menu  
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students \n 2. Show the students \n 3. Save the list to students.csv \n 4. Load list from file \n 9. Exit " 
  
  #insturctions for input options

end

def show_students # define the show_students method by combining the below
  print_header; #print commands
  print_student_list #print commands
  print_footer #print commands 
end

def process(selection) # method for selecting the correct method. 
  case selection
  
  when "1"
    input_students #defined above
  
  when "2"
    show_students # defined above
  
  when "3"
    save_students #defined below
    
  when "4"
    load_students #defined below 
  
  when "9"
    exit # this will cause the program to terminate
    
  elses
    puts "I don't know what you meant, try again" #error message
    
  end
end

def print_header
  puts "The students of Villains Academy" #header 
  puts "-------------"
end

def print_student_list
  
  @students.each do  |student| #block acting out insertions on the students as entered
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer 
  puts "Overall, we have #{@students.count} great students"
end


def save_students
    file=File.open("students.csv", "w") #opoen a csv file in write mode 
    @students.each do |student| # block which runs for each student, creating line of name and cohort, with two 
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end 

def load_students(filename = "students.csv") # defining the opening of the file 
     file = File.open(filename, "r") #open up a read only version of the file
     file.readlines.each do |line| 
      name, cohort = line.chomp.split(',') # split method turns it into an array 
      @students << {name: name, cohort: cohort.to_sym} # appending on the array of students 
      
    end
  file.close
end


interactive_menu