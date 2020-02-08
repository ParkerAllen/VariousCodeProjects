&menu;		#call menu

#----------------------------------------------------
#menu to select subprogram
sub menu
{
	while(1 == 1)
	{
		print "------------------------------------\n";
		print "1 - quadratic\n";
		print "2 - prime\n";
		print "3 - pi\n";
		print "4 - tax\n";
		print "5 - idpassword\n";
		print "6 - score\n";
		print "7 - filesort\n";
		print "8 - frequency\n";
		print "9 - power\n";
		print "10 - factorial\n";
		print "11 - sort\n";
		print "12 - minmax\n";
		print "13 - positives\n";
		print "14 - fractionals\n";
		print "15 - emuid\n";
		print "16 - emuweb\n";
		print "17 - whitespaces\n";
		print "18 - areacode\n";
		print "q - quit\n";
		print "\n";
		
		my $select = &getNumber;	#get user selection
		
		print "\n";
		
		if($select == 1)
		{
			&quadratic;			#call quadratic
		}
		elsif($select == 2)
		{
			&prime;				#call prime
		}
		elsif($select == 3)
		{
			&pi;				#call pi
		}
		elsif($select == 4)
		{
			&tax;				#call tax
		}
		elsif($select == 5)
		{
			&idpassword;		#call idpassword
		}
		elsif($select == 6)
		{
			&score;				#call score
		}
		elsif($select == 7)
		{
			&filesort;			#call filesort
		}
		elsif($select == 8)
		{
			&frequency;			#call frequency
		}
		elsif($select == 9)
		{
			$a = &getNumber;			#number
			$b = &getNumber;			#exponent
			$pow = &power($a, $b);		#call power
			print "power = $pow\n";
		}
		elsif($select == 10)
		{
			$fac = &factorial(&getNumber);			#call factorial
			print "factorial = $fac\n";
		}
		elsif($select == 11)
		{
			&sort(@ar = &getArray);		#call sort
			foreach $var (@ar)
			{
				print "$var ";			#print
			}
			print "\n";
		}
		elsif($select == 12)
		{
			&minmax(&getArray, $min, $max);		#call maxmin
			print "min = $min, max = $max\n";	#print
		}
		elsif($select == 13)
		{
			&positives;			#call positives
		}
		elsif($select == 14)
		{
			&fractionals;		#call fractionals
		}
		elsif($select == 15)
		{
			&emuid;				#call emuid
		}
		elsif($select == 16)
		{
			&emuweb;			#call emuweb
		}
		elsif($select == 17)
		{
			&whitespaces;		#call whitespaces
		}
		elsif($select == 18)
		{
			&areacode;			#call areacode
		}
		elsif(lc($select) eq "q")
		{
			last;				#end program
		}
		else
		{
			print "What was that suppose to be?\n";
		}
	}
}

#----------------------------------------------------
#try to find quadratic from 3 user input integers
sub quadratic
{
	my $a = &getNumber;			#user input integers
	my $b = &getNumber;
	my $c = &getNumber;
	
	my $solu = $b * $b - 4 * $a *$c;	#b^2 - 4ac
	
	if($solu >= 0)
	{
		my $rtn1 = ($b + sqrt($solu)) / (2 * $a);	#answer 1
		my $rtn2 = ($b - sqrt($solu)) / (2 * $a);	#answer 2
		print "$rtn1 , $rtn2\n";					#print
	}
	else
	{
		print "No Solution\n";		#no solution	
	}
}

#----------------------------------------------------
#tells if a user input number is a prime
sub prime
{
	my $num = &getNumber;		#user input int
	
	for($i = 2; $i < $num / 2; $i++)	#loop from 2 to half of input
	{
		if($num % $i == 0)				#test id divisible
		{
			print "Not Prime\n";		#not prime
			last;						#done!
		}
		elsif($i >= $num / 2 - 1)		#if last test
		{
			print "Prime\n";			#prime
		}
	}
}

#----------------------------------------------------
#compute pi with accuracy given by user int input
sub pi
{
	my $num = &getNumber;		#user input
	my $np = 1;					#flips between 1 and -1
	my $sum = 0;				#final sum
	
	for($i = 1; $i < $num; $i++)
	{
		$sum += 1 / ($i * 2 - 1) * $np;		#calculates int to add to sum
		$np = $np * -1;						#flip between 1 and -1
	}
	$sum = $sum * 4;						#sum * 4
	print "pi = $sum\n";					#print sum
}

#----------------------------------------------------
#calculates tax based on user given income, marital status, and state
sub tax
{
	print "income:\n";
	my $income = &getNumber;			#user income
	
	print "single or married?\n";
	my $sOrM = &getString;				#user marital
	
	print "state i or o\n";
	my $iOrO = &getChar;				#user state
	
	my $tax = 10;						#base tax
	my $strd = 50000;					#base income
	
	if(lc($sOrM) eq "single")			#if single
	{
		$tax += 10;						#add to tax
		$strd = 30000;					#change base income	
	
	}
	if($income > $strd)					#compare user income with base
	{
		$tax += 5;						#add to tax
	}
	if(lc($iOrO) eq "o")				#in or out of state
	{
		$tax -= 3;						#subtract from tax
	}
	print "tax = $tax\n";				#print tax
}

#----------------------------------------------------
#generates id and password base on user given name
sub idpassword
{
	print "first name\n";	
	my $first = uc(&getString);			#user first name
	
	print "last name\n";
	my $last = uc(&getString);			#user last name
	
	my $id = substr($first, 0, 1).$last;		#make id
	
	#make password 
	#first and last letter of first name
	my $password = substr($first, 0, 1).substr($first, length($first) - 1, 1);
	
	#first 3 letters of last name and length of first and last name
	$password = $password.substr($last, 0, 3).length($first).length($last);
	
	print "id: $id\n password: $password\n";		#print
}

#----------------------------------------------------
#calculates min max and average of user given names and scores
sub score
{
	my $maxName;			#name of high scorer
	my $maxScore = -1;		#max score
	my $minName;			#name of lowest scorer
	my $minScore = 1000000;	#lowest score
	my $avgScore;			#average score	
	my $counter = 0;		#number of scores entered	
		
	while(1 == 1)
	{
		print "name and socre (Bob 5) or q to end";
		chomp($input = <STDIN>);		#user input
		
		if(lc($input) eq "q")		#press q to quit
		{
			$avgScore = $avgScore / $counter;	#calculate average
			last;
		}
		else
		{
			@input = split(/ /, $input);	#seperate name and score
			$avgScore += $input[1];			#and score to average
			$counter++;						#increase counter
			
			if($input[1] > $maxScore)
			{
				$maxScore = $input[1];		#replace max score
				$maxName = $input[0];		#replace max score name
			}
			if($input[1] < $minScore)
			{
				$minScore = $input[1];		#replace min score	
				$minName = $input[0];		#replace min score name
			}
		}
	}
	
	#print results
	print "max = $maxScore, $maxName\naverage = $avgScore\nmin = $minScore, $minName\n";
}

#----------------------------------------------------
#sort a file of names and gdp to another file by last name
sub filesort
{
	my @p;		#array to hold each line
	
	print "Infile name\n";
	open(FIN, "<", &getString);		#user given in file
	
	$line = <FIN>;
	push(@p, $line);				#push first line to array
	
	print "Outfile name\n";
	open(FOUT, ">", &getString);	#user given outfile	
	
	while($line = <FIN>)			#read until end
	{
		my $len = @p;				#length of array
		
		for($i = 0; $i <= $len; $i++)	#loop through array
		{
			if($i == @p)				#end of array
			{
				push(@p, $line);		#add to end of array
			}
			elsif($line lt $p[$i])		#less than current element of array
			{
				splice @p , $i, 0, $line;	#insert before
				last;						#end loop
			}
		}
	}
	
	foreach $var (@p)
	{
		print FOUT "$var";		#write to out file
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file	
}

#----------------------------------------------------
#returns the frequency of last names in file
sub frequency
{
	print "Infile\n";			
	open(FIN, "<", &getString);			#user given file
	
	my %arr = ();						#hash array
	
	while(chomp($line = <FIN>))
	{
		my @spli = split(/ /, $line);	#split last name and first
		my $line = $spli[0];			#last name
		if(exists $arr{$line})			#already exsits?
		{
			$arr{$line}++;				#increment value of last name
		}
		else
		{
			%temp = ($line , 1);		#create new array hash
			%arr = (%arr, %temp);		#concatinate to original hash
		}
	}
	
	foreach $key (keys(%arr))
	{
		print "$key : $arr{$key}\n";	#print hash table	
	}
	
	close(FIN);			#close file
}

#----------------------------------------------------
#raise first int to the power of second int
sub power	#2 int and exponent
{
	$sum = 1;	#sum
	
	for($i = 0; $i < $_[1]; $i++)
	{
		$sum = $sum * $_[0];	#sum * sum
	}
	return $sum;		#return sum
}

#----------------------------------------------------
#gives the factorial of an integer
sub factorial		#1 int
{
	if($_[0] == 1)
	{
		return 1;		#return 1
	}
	else
	{
		return $_[0] * &factorial($_[0] - 1);	#return given int * factorial of 1- int
	}
}

#----------------------------------------------------
#sort an array
sub sort		#1 array
{
	for($i = 0; $i < @_ - 1; $i++)
	{
		my $min = $i;		#location of lowest value
		
		for($x = $i + 1; $x < @_; $x++)
		{
			if($_[$min] > $_[$x])
			{
				$min = $x;		#new lowest value location
			}
		}
		
		$temp = $_[$i];			#swap current element with lowest element
		$_[$i] = $_[$min];
		$_[$min] = $temp;
	}
}

#----------------------------------------------------
#finds the min and max in an array
sub minmax		#1 array, 2 integers
{
	$_[@p - 1] = $_[0];			#min = first element of array
	$_[@p - 2] = $_[0];			#max = first element of array
	
	for($i = 1; $i < @_ - 2; $i++)
	{
		if($_[$i] < $_[@_ - 2])
		{
			$_[@_ - 2] = $_[$i];		#new max
		}
		if($_[$i] > $_[@_ - 1])
		{
			$_[@_ - 1] = $_[$i];		#new min
		}
	}
}

#----------------------------------------------------
#writes positive whole numbers from a file to an output file
sub positives
{
	print "Infile\n";
	open(FIN, "<".&getString);		#user in file
	
	print "Outfile\n";
	open(FOUT, ">".&getString);		#user out file
	
	while(chomp($line = <FIN>))
	{
		if($line =~ /^[1-9][0-9]*$/)
		{
			print FOUT "$line\n";	#write correct line to out file
		}
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file
}

#----------------------------------------------------
#write decmials from in file to out file
sub fractionals
{
	print "Infile\n";
	open(FIN, "<".&getString);		#user in file
	
	print "Outfile\n";
	open(FOUT, ">".&getString);		#user out file
	
	while(chomp($line = <FIN>))
	{
		if($line =~ /^0\.[0-9]*$/)
		{
			print FOUT "$line\n";	#write correct line to out file	
		}
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file	
}

#----------------------------------------------------
#writes emu id from in file to out file
sub emuid
{
	print "Infile\n";
	open(FIN, "<".&getString);		#user in file
	
	print "Outfile\n";
	open(FOUT, ">".&getString);		#user out file
	
	while(chomp($line = <FIN>))
	{
		if($line =~ /^(E|e)00[0-9][0-9][0-9][0-9]+$/)
		{
			print FOUT "$line\n";	#write correct line to out file
		}
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file
}

#----------------------------------------------------
#writes emu websites from in file to out file
sub emuweb
{
	print "Infile\n";
	open(FIN, "<".&getString);		#user in file
	
	print "Outfile\n";
	open(FOUT, ">".&getString);		#uesr out file
	
	while(chomp($line = <FIN>))
	{
		if($line =~ /^www.emich.edu\/(.+\/|)\S+.html$/)
		{
			print FOUT "$line\n";	#write correct line to out file
		}
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file	
}

#----------------------------------------------------
#replace the white space between first and last names with 1 space
sub whitespaces
{
	print "Infile\n";
	open(FIN, "<".&getString);		#user in file
	
	print "Outfile\n";
	open(FOUT, ">".&getString);		#user out file
	
	while(chomp($line = <FIN>))
	{
		$line =~ s/\s+/ /g;			#replace white spaces with 1 space
		print FOUT "$line\n";		#write new line to out file
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file
}

#----------------------------------------------------
#replace areacode 715 with 692
sub areacode
{
	print "Infile\n";
	open(FIN, "<".&getString);		#user in file
	
	print "Outfile\n";
	open(FOUT, ">".&getString);		#user out file
	
	while(chomp($line = <FIN>))
	{
		$line =~ s/ 715/ 692/;		#replace 715 with 692
		print FOUT "$line\n";		#write new line to out file
	}
	
	close(FIN);		#close in file
	close(FOUT);	#close out file
}

#----------------------------------------------------
#ask user for number and returns it
sub getNumber
{
	print "Give a number: ";
	chomp($num = <STDIN>);		#chomp user given number
	return $num;				#return number
}

#----------------------------------------------------
#ask user for string and return it
sub getString
{
	print "Give a string: ";	
	chomp($str = <STDIN>);		#chomp user given string
	return $str;				#return string
}

#----------------------------------------------------
#ask user for character and returns it
sub getChar
{
	print "Give a character: ";
	chomp($char = <STDIN>);		#chome user given character
	return $char;				#return character
}

#----------------------------------------------------
#ask user for numbers and returns an array
sub getArray
{
	print "Type q to stop\n";
	@array;						#the array
	
	while(1 == 1)
	{
		$n = &getNumber;		#ask for number
		if(lc($n) eq "q")
		{
			last;				#end loop if its q
		}
		else
		{
			push(@array, $n);	#add number to array
		}
	}
	return @array;				#return array
}
