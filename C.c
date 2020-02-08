#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <math.h>
#include <stdlib.h>

//Parker Allen
//10/8/2019

//Problem 1
double compute_pi(int n);

//Problem 2
double compute_sqrt(double x);

//Problem 3
int is_prime(int n);
void display_primes(int n);

//Problem 4
void process_scores();

//Problem 5
double compute_tax(int income, char *status, char state);

//Problem 6
int quadratic(double a, double b, double c, double *solution1, double *solution2);

//Problem 7
int factorial(int n);

//Problem 8
void file_count(char *file, int *characters, int *lines);

//Problem 9
void file_sort(char *infile, char *outfile);

//Problem 10
void file_student(char *infile);
int alphabetical(char *str1, char *str2);

//Problem 11
void menu();
int enter_int();
double enter_double();
char enter_char();
void enter_string(char *i);

struct student{
	char name[20];
	int age;
	float gpa;
};

int main()
{
	menu();
	return 0;
}

//Computs PI based on int given
double compute_pi(int n)
{
	double pi = 0;
	int i;
	for(i = 1; i <= n; i++)
	{
		if( i % 2 == 1)
		{
			pi += 1 / (double)(2 * i - 1);
		}
		else
		{
			pi -= 1 / (double)(2 * i - 1);
		}
	}
	return pi * 4;
}

//Finds square root of the the double
double compute_sqrt(double x)
{
	double next, last = 1;
	int i;
	for(i = 0; i <= 10; i++)
	{
		double temp = next;
		next = .5 * (last + x / last);
		last = temp;
	}
	return next;
}

//Determines if the given int is a prime
int is_prime(int n)
{
	int i;
	for(i = 2; i <= n / 2; i++)
	{
		if(n % i == 0)
		{
			return 0;
		}
	}
	return 1;
}

//Finds the prime numbers up to the given int
void display_primes(int n)
{
	int i;
	for(i = 1; i <= n; i++)
	{
		if(is_prime(i) == 1)
		{
			printf("%d ,",i);
		}
	}
}

//Recieves input of names and scores, then prints average and min and max scores and names
void process_scores()
{
	char max[20], min[20], temp[20];
	double maxd, mind = 10000, tempd, avg;
	int i = 0;
	
	while(1==1)
	{
		printf("Enter name\n");
		scanf("%s", &temp);
		
		if(strcmp(temp, "q") == 0)
		{
			break;
		}
		
		printf("Enter score\n");
		scanf("%If", &tempd);
		
		if(tempd > maxd || i ==0)
		{
			strcpy(max, temp);
			maxd = tempd;
		}
		if(tempd < mind || i == 0)
		{
			strcpy(min, temp);
			mind = tempd;
		}
		avg += tempd;
		i++;
	}
	printf("Average = %d\n", avg / i);
	printf("Max = %d, by: ", maxd);
	printf(max);
	printf("\nMin = %d, by: ", mind);
	printf(min);
}

//Computes tax based on income, single/married and in/out of state
double compute_tax(int income, char *status, char state)
{
	char str[20];
	strcpy(str, status);
	int i;
	for(i = 0; i < strlen(str); i++)
	{
		str[i] = tolower(str[i]);
	}
	double tax = -1;
	int m = 30000;
	if(strcmp(str, "married") == 0)
	{
		tax = .1;
		m = 50000;
	}
	else if(strcmp(str, "single") == 0)
	{
		tax = .2;
	}
	if(income >= m)
	{
		tax += .05;
	}
	if(tolower(state) == 'o' && tax > 0)
	{
		tax -= .03;
	}
	else if(tolower(state) != 'i')
	{
		tax = -1;
	}
	return tax;
}

//Determines if given doubles are a quadratic and if so stores solutions
int quadratic(double a, double b, double c, double *solution1, double *solution2)
{
	double x = b*b - 4 * a * c;
	if(x < 0)
	{
		return 0;
	}
	*solution1 = (-b + sqrt(x)) / 2 * a;
	*solution2 = (-b - sqrt(x)) / 2 * a;
	return 1;
}

//Computes the facotrial of the given int
int factorial(int n)
{
	if(n == 1)
	{
		return 1;
	}
	return n * factorial(n-1);
}

//Counts the characters and lines of the given file name, and stores the values
void file_count(char *file, int *characters, int *lines)
{
	FILE *fp;
	fp = fopen(file, "r");
	int max = 255;
	char buffer[max];
	
	while(fgets(buffer, max, fp) != NULL)
	{
		*characters = *characters + strlen(buffer);
		*lines = *lines + 1;
	}
	*characters = *characters - (*lines - 1);
	fclose(fp);
}

//Sorts a given file and writes sorted file in the other given file
void file_sort(char *infile, char *outfile)
{
	int max = 255;
	int buffer[max];
	FILE *fpin, *fpout;
	fpin = fopen(infile, "r");
	fpout = fopen(outfile, "w");
	
	int m;
	fscanf(fpin, "%d", &m);
	
	int *id = (int *)malloc(m * sizeof(int));
	char *grade = (char *)malloc(m * sizeof(char));
	float *gpa = (float *)malloc(m * sizeof(float));
	
	int i;
	for(i = 0; i < m; i++)
	{
		fscanf(fpin, "%d %c %f", &id[i], &grade[i], &gpa[i]);
	}
	
	int x;
	for(i = 0; i < m - 1; i++)
	{
		for(x = i + 1; x < m; x++){
			if(id[x] < id[i])
			{
				int tempi = id[i];
				char tempc = grade[i];
				float tempf = gpa[i];
				id[i] = id[x];
				grade[i] = grade[x];
				gpa[i] = gpa[x];
				id[x] = tempi;
				grade[x] = tempc;
				gpa[x] = tempf;
			}
		}
	}
	
	fprintf(fpout, "%d\n", m);
	for(i = 0; i < m; i++)
	{
		fprintf(fpout,"%d, %c, %f\n", id[i], grade[i], gpa[i]);
	}
	
	free(id);
	free(grade);
	free(gpa);
	fclose(fpin);
	fclose(fpout);
}

//Sorts given file into array of structs
void file_student(char *infile)
{
	int max = 255;
	int buffer[max];
	FILE *fpin;
	fpin = fopen(infile, "r");
	
	int m;
	fscanf(fpin, "%d", &m);
	struct student *arr = (struct student *)malloc(m * sizeof(struct student));
	
	int i;
	for(i = 0; i < m; i++)
	{
		fscanf(fpin, "%s %d %f", &arr[i].name, &arr[i].age, &arr[i].gpa);
	}
	
	double avg;
	for(i = 0; i < m; i++)
	{
		avg += arr[i].gpa;
	}
	printf("%f \n", avg / m);
	
	for(i = 0; i < m; i++)
	{
		if(arr[i].gpa >= 2.0)
		{
			printf("%s\n", arr[i].name);
		}
	}
	
	int x;
	for(i = 0; i < m - 1; i++)
	{
		for(x = i + 1; x < m; x++){
			if(alphabetical(arr[i].name, arr[x].name) == 1)
			{
				struct student temp = arr[i];
				arr[i] = arr[x];
				arr[x] = temp;
			}
		}
	}
	
	for(i = 0; i < m; i++)
	{
		printf("%s, %d, %f\n", arr[i].name, arr[i].age, arr[i].gpa);
	}
	
	free(arr);
	fclose(fpin);
}

//tells the alphabetical order of 2 given strings
int alphabetical(char *str1, char *str2)
{
	char s1[20], s2[20];
	strcpy(s1, str1);
	strcpy(s2, str2);
	int i;
	for(i = 0; i < strlen(s1); i++)
	{
		tolower(s2[i]);
		tolower(s1[i]);
		if(s2[i] < s1[i] || s2[i] == '\0')
		{
			return 1;
		}
		else if(s2[i] > s1[i] || s1[i] == '\0')
		{
			return 0;
		}
	}
	return 0;
}

//the menu to select other functions, ask for input, and print outputs
void menu()
{
	while(1 == 1)
	{
		printf("1 - Computing PI\n");
		printf("2 - Computing squar root\n");
		printf("3 - Display primes\n");
		printf("4 - Processing grades\n");
		printf("5 - Computing tax\n");
		printf("6 - Solving quadratic\n");
		printf("7 - Computing factorial\n");
		printf("8 - Counting file\n");
		printf("9 - Sorting file\n");
		printf("10 - Student file\n");
		printf("11 - Quit\n");
		
		int i;
		char s[255];
		char ss[255];
		double d;
		char c;
		
		i = enter_int();
		
		if(i == 1)
		{
			printf("Number of itereations to find PI\n");
			i = enter_int();
			printf("%f \n", compute_pi(i));
		}
		else if(i == 2)
		{
			printf("Nubmer to square root\n");
			d = enter_double();
			printf("%f \n", compute_sqrt(d));
		}
		else if(i == 3)
		{
			printf("Number to display primes up to\n");
			i = enter_int();
			display_primes(i);
		}
		else if(i == 4)
		{
			process_scores();
		}
		else if(i == 5)
		{
			printf("Income amount\n");
			i = enter_int();
			printf("Single or Married?\n");
			enter_string(s);
			printf("in state(i) or out of state(o)\n");
			c = enter_char();
			printf("%f \n", compute_tax(i, s, c));
		}
		else if(i == 6)
		{
			printf("a of quadratic\n");
			d = enter_double();
			printf("b of quadratic\n");
			double b = enter_double();
			printf("c of quadratic\n");
			double c = enter_double();
			double solution1, solution2;
			printf("%d \n", quadratic(d, b, c, &solution1, &solution2));
			printf("%f \n, %f", solution1, solution2);
		}
		else if(i == 7)
		{
			printf("Factorial of\n");
			i = enter_int();
			printf("%d \n", factorial(i));
		}
		else if(i == 8)
		{
			printf("Name of file to cout lines and charactes\n");
			enter_string(s);
			int l;
			file_count(s, &i, &l);
		}
		else if(i == 9)
		{
			printf("Name of in file\n");
			enter_string(s);
			printf("Name of out file\n");
			enter_string(ss);
			file_sort(s, ss);
		}
		else if(i == 10)
		{
			printf("Name of in file\n");
			enter_string(s);
			file_student(s);
		}
		else if(i == 11)
		{
			break;
		}
		else
		{
			printf("Try Again \n");
		}
	}
}

//asks for user to input an int
int enter_int()
{
	int i = 0;
	printf("Enter an int ");
	scanf("%d", &i);
	return i;
}

//asks for user to input a double
double enter_double()
{
	double i = 0;
	printf("Enter a double ");
	scanf("%lf", &i);
	return i;
}

//asks for user to input a char
char enter_char()
{
	char i;
	printf("Enter a character ");
	scanf(" %c", &i);
	return i;
}

//asks for user to input a string
void enter_string(char *i)
{
	printf("Enter a string ");
	scanf("%s", i);
}
	
	
