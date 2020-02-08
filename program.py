import math
#----------------------------------------------------
#user selects what they want to do
def main():
	while 1 == 1:
		print("1 - compute pi")				#options for input
		print("2 - compute square root")
		print("3 - test prime")
		print("4 - display primes")
		print("5 - process scores")
		print("6 - tax")
		print("7 - solve quadratic")
		print("8 - sort list")
		print("9 - id and password")
		print("10 - sort file")
		print("q - quit")
		print()
		
		user = input('Enter number: ')	#user input
		print()
		
		if user.lower() == 'q':			#quit
			break
		
		user = int(user)				#user input as an int
		
		if user == 1:
			num = int(input("I Demand Integer: "))	#get input
			print("pi =", compute_pi(num))					#compute pi	
		
		elif user == 2:
			num = int(input("I Demand Integer: "))	#get input
			print("sqrt =", compute_sqrt(num))				#compute square root
		
		elif user == 3:
			num = int(input("I Demand Integer: "))	#get input
			print("prime is", is_prime(num))					#test prime
		
		elif user == 4:
			num = int(input("I Demand Integer: "))	#get input
			display_primes(num)						#get primes
		
		elif user == 5:
			process_scores()						#process scores	
		
		elif user == 6:
			num = int(input("I Demand Integer: "))				#get input
			status = input("Can I please ahve marriage status(single or married): ")
			state = input("Are in(i) or out(o) of state: ")
			
			print("tax =", compute_tax(num, status, state))				#compute tax
		
		elif user == 7:
			a = int(input("1st int: "))			#get input
			b = int(input("2nd int: "))
			c = int(input("3rd int: "))
			
			print("answer =", solve_quadratic(a, b, c))		#solve quadratic
		
		elif user == 8:
			list = []							#list to sort
			while 1 == 1:
				num = input("Enter int or q to quit: ")		#get input
				if num.lower() == "q":
					break									#break		
				list.insert(0, int(num))					#fill list
			
				
			sort(list)										#sort list
			for element in list:	
				print(element, end = ' ')					#print list
				
			print('')
		
		elif user == 9:
			first = input("first name: ")		#get input
			last = input("last name please:")
			
			print("(id, password)", id_password(first, last))		#create id and password
		
		elif user == 10:
			fin = input("name of in file: ")		#get input
			out = input("name of out file:")
			
			file_sort("in.txt", "out.txt")	#sort files
			print("done")
		
		print()

#----------------------------------------------------
#coputes pi to accuracy of given
def compute_pi(n):
	sum = 0				#sum
	np = 1				#var switchs between 1 and -1
	
	for i in range(1, n, 1):
		sum += 1 / (i * 2 - 1) * np		#add to sum
		np = np * -1					#switch to 1 or -1
	
	return sum * 4						#return sum * 4

#----------------------------------------------------
#compute square root of given int
def compute_sqrt(x):
	last = 1				#last starts at 1
	
	for i in range(0, 11, 1):
		next = .5 * (last + x / last)	#calulates next
		last = next						#next = last		
	
	return last							#return last

#----------------------------------------------------
#returns if number is prime or not prime 
def is_prime(n):
	for i in range(2, n // 2 + 1, 1):
		if n % i == 0:			#given is divisble by int	
			return False		#not prime
		
	
	return True			#prime


#----------------------------------------------------
#display all primes up to number
def display_primes(n):
	for i in range(2, n + 1, 1):
		if is_prime(i):				#test if prime
			print(i, end = ' ')		#print prime number
		
	print('')

#----------------------------------------------------
#give min avg and max scores and names of min and max
def process_scores():
	maxScore = 0			#max score
	maxName = ''			#max score name	
	avgScore = 0			#average score
	minScore = 1000000		#min score
	minName = ''			#min score name
	counter = 0;			#counter
	
	while 1 == 1:
		tempN = input('Enter Name: ')	#get name
		if tempN.upper() == 'Q':
			break						#break if q
		
		tempS = float(input('Enter score: '))	#get score
		avgScore += tempS						#sum of scores
		counter += 1							#number of scores	
		
		if tempS > maxScore:
			maxScore = tempS		#replace max score
			maxName = tempN			#replace max score name
		
		if tempS < minScore:
			minScore = tempS		#replace min score
			minName = tempN			#replace min score name
		
	
	print ('Max', maxScore, maxName)			#print everything
	print ('Average', avgScore / counter)
	print ('Min', minScore, minName)

#----------------------------------------------------
#compute tax
def compute_tax(income, status, state):
	tax = 10	#base tax
	m = 50000	#standard income if married
	
	if status.lower() == "single":
		tax += 10		#more tax for singles
		m = 30000		#lower standard income
	
	if income > m:
		tax += 5		#more tax if over stantard income
	
	if state.lower() == "o":
		tax -= 3		#lower tax for out of state
	
	return tax			#return

#----------------------------------------------------
#solve for quadratic
def solve_quadratic(a, b, c):
	test = b**2 - 4 * a * c		#value if there are solutions
	if	test >= 0:
		x = (-b + math.sqrt(test)) / (2 * a)	#solution 1
		y = (-b - math.sqrt(test)) / (2 * a)	#solution 2
		return (x, y)							#eturn solutions	
	
	return (0, 0)		#no solution

#----------------------------------------------------
#sort list of ints
def sort(list):
	for i in range(0, len(list) - 1, 1):
		min = i		#place of lowest number
		
		for j in range(i + 1, len(list), 1):
			if list[min] > list[j]:
				min = j			#new place of lowest number	
			
		
		temp = list[i]			#swap lowest number current number
		list[i] = list[min]
		list[min] = temp
	
#----------------------------------------------------
#creates id and password
def id_password(first, last):
	id = first[0] + last		#create id
	
	#create password
	password = first[0] + first[len(first) - 1] + last[0 : 3] + str(len(first)) + str(len(last))
	
	return (id.upper(), password.upper())		#return

#----------------------------------------------------
#sorf file and write sorted to another file
def file_sort(infile, outfile):
	out = open(outfile, 'w')		#open out file
	
	inf = open(infile, 'r')			#open in file
	line = inf.readline()			#read first line
	
	list = [line]					#add first line to list
	line = inf.readline()			#read next line
	
	while line != '':
		
		lineId = line.split()		#split line
		
		for i in range(0, len(list), 1):
			
			tempId = list[i].split()	#split element in list
			
			if int(lineId[0]) < int(tempId[0]):
				list.insert(i, line)			#insert before element in list
				break							#break
			
			elif i == len(list) - 1:
				list.insert(len(list), line)	#insert at end of list
			
		line = inf.readline()					#read next line
	
	for element in list:
		out.write(element)		#write list to out file
	
	inf.close()		#close files
	out.close()

#----------------------------------------------------

main()				#call main
print("goodbye")



