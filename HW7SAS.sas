/*SAS Programming 1 Course PDF*/
/*Comments are under the codes*/

%let path=/folders/myfolders/Data_One;
libname orion "/folders/myfolders/Data_One";
/*Get ready for exercises. The first statement creates a macro variable named path and assigns it a full path to the folder containing the course data.
The second statement, a LIBNAME statement, associates the libref, orion, with the same data location.*/
￼;
/*1. Exercises:Chapter3.2Levels1,2,andChallenge(pages3-33,34)*/
/*Level1:4. Accessing a Permanent Data Set*/
/*a.Use an interactive facility to explore the orion library and answer the following questions: */
/*Double click library->Orion->Country*/
    /*How many observations are in the orion.country data set? 7, because there are 7 rows.*/
    /*How many variables are in the orion.country data set? 6, because there are 6 columns.*/
    /*What is the name of the last country in the data set? South Africa */

/* b.Submit a PROC CONTENTS step to generate a list of all members in the orion library.*/
proc contents data=orion._all_ nods;
run;
/*Using _all_ nods to get a list of all members in the orion library.
proc contents will list the properties of the data set*/
/*What is the name of the last member listed? US_SUPPLIERS */

/*Level2:5. Viewing General Data Set Properties*/
/*a. Examine the general data set properties of orion.staff.*/
proc contents data=orion.staff;
run;
/*Using proc contents to examine the properties of the data set orion.staff */

/*b. What sort information is stored for this data set? */
/*The General Information section tells us that the data set is sorted. The Variable section tells us it is sorted by Employee_ID using the ANSI character set, and has been validated.*/

/*Chanllenge:6. SAS Autoexec File: Use the Help facility or product documentation to investigate the SAS autoexec file and answer the following questions.*/
   /*What is the name of the file? autoexec.sas */
   /*What is its purpose? It contains SAS statements that are executed immediately after SAS initializes, in order to invoke SAS programs automatically, set up certain variables for use during your SAS session, or set system options.*/
   /*How is it created? It can be created by any text editor, but the best way is to use a SAS text editor and save it by using the Save As dialog box.*/
   /*How could this be useful in a SAS session? It can be used to set the path macro variable and automatically submit a LIBNAME statement.*/

/*2. ReviewChapter4material*/
/*3. Exercises:Chapter4.1,2,and3Levels1and2(pages4-25,26,38,39,48,49)*/ 
/*4.1*/
/*level1:1. Displaying orion.order_fact with the PRINT Procedure*/
  /*a.Retrieve the starter program p104e01. Run the program and view the output. Observe that there are 617 observations. Observations might be displayed over two lines, depending on output settings.*/
proc print data=orion.order_fact;
run;
/*Using proc print to display the data set orin.order_fact*/

  /*b.Add a SUM statement to display the sum of Total_Retail_Price. The last several lines of the report are shown below.*/
proc print data=orion.order_fact;
   sum Total_Retail_Price;
run;
/*Using sum statement to calculate the sum of total retail price in the last of report*/

  /*c.Add a WHERE statement to select only the observations with Total_Retail_Price more than 500. Submit the program. Verify that 35 observations were displayed.*/
proc print data=orion.order_fact;
   where Total_Retail_Price>500;
   sum Total_Retail_Price;
run;
/*Using where statement to select and display only the observations with Total_Retail_Price more than 500.*/
/*What do you notice about the Obs column? The original observation numbers are displayed.*/
/*Did the sum of Total_Retail Price change to reflect only the subset? Yes */

  /*d.Add an option to suppress the Obs column. Verify that there are 35 observations in the results.*/
proc print data=orion.order_fact noobs;
   where Total_Retail_Price>500;
   sum Total_Retail_Price;
run;
/*Using noobs to avoid Obs column.*/
/*How can you verify the number of observations in the results? Check log*/

  /*e.Add an ID statement to use Customer_ID as the identifying variable. Submit the program. The results contain 35 observations.*/
proc print data=orion.order_fact noobs;
   where Total_Retail_Price>500;
   id customer_id;
   sum Total_Retail_Price;
run;
/*Using id statement to set Customer_ID as the identifying variable.*/
/*How did the output change? Customer_ID is the leftmost column and is displayed on each line for observations.*/

  /*f.Add a VAR statement to display Customer_ID, Order_ID, Order_Type, Quantity, and Total_Retail_Price.*/
proc print data=orion.order_fact noobs;
   where Total_Retail_Price>500;
   id customer_id;
   var Customer_ID Order_ID Order_Type Quantity Total_Retail_Price;
   sum Total_Retail_Price;
run;
/*Using var statement to only display Customer_ID, Order_ID, Order_Type, Quantity, and Total_Retail_Price after the identifying variable.*/
/*What do you notice about Customer_ID? There are two Customer_ID columns. The first column is the ID field, and the second one is included because Customer_ID is listed in the VAR statement.*/

  /*g.Modify the VAR statement to address the issue with Customer_ID.*/
proc print data=orion.order_fact noobs;
   where Total_Retail_Price>500;
   id customer_id;
   var Order_ID Order_Type Quantity Total_Retail_Price;
   sum Total_Retail_Price;
run;
/*Delete Customer_ID in var statement*/

/*level2:2.Displaying orion.customer_dim with the PRINT Procedure*/
  /*a.Write a PRINT step to display orion.customer_dim.*/
proc print data=orion.customer_dim;
run;
/*Using proc print to display the orion.customer_dim data set*/

  /*b.Modify the program to display a subset of orion.customer_dim by selecting only the observations for customers between the ages of 30 and 40. Also, suppress the Obs column. The resulting report should contain 17 observations.*/
proc print data=orion.customer_dim noobs;
   where Customer_Age between 30 and 40; 
run;
/*Uisng where statement to select only the observations for customers between the ages of 30 and 40. And using noobs to avoid obs column.*/

  /*c.Add a statement to use Customer_ID instead of Obs as the identifying column. Submit the program and verify the results.*/
proc print data=orion.customer_dim noobs;
   where Customer_Age between 30 and 40;
   id Customer_ID; 
run;
/*Using id statement to set Customer_ID as the identifying column.*/

  /*d.Add a statement to limit the variables to those shown in the report below.*/
proc print data=orion.customer_dim noobs;
   where Customer_Age between 30 and 40;
   id Customer_ID; 
   var Customer_Name Customer_Age Customer_Type;
run;
/*Using var statement to display only Customer_Name Customer_Age and Customer_Type columns after the identifying column in report.*/

/*4.2*/
/*level1:5.Sorting orion.employee_payroll and Displaying the New Data Set*/
  /*a.Open p104e05. Add a PROC SORT step before the PROC PRINT step to sort orion.employee_payroll by Salary, placing the sorted observations into a temporary data set named sort_salary.*/
proc sort data=orion.employee_payroll 
          out=work.sort_salary;
   by Salary;
run;
/*Using proc sort to sort orion.employee_payroll by Salary and output it into a new data set named sort_salary*/

  /*b.Modify the PROC PRINT step to display the new data set. Verify that your output matches the report below.*/
proc print data=work.sort_salary;
run;
/*Using proc print to display the new data set*/

/*6.Sorting orion.employee_payroll and Displaying Grouped Observations*/
  /*a.Open p104e06. Add a PROC SORT step before the PROC PRINT step to sort orion.employee_payroll by Employee_Gender, and within gender by Salary in descending order. Place the sorted observations into a temporary data set named sort_salary2.*/
proc sort data=orion.employee_payroll 
          out=work.sort_salary2;
   by Employee_Gender descending Salary;
run;
/*Using proc sort to sort orion.employee_payroll by Employee_Gender and within gender by descending order in salary. And put the result in data set named sort_salary2*/

  /*b.Modify the PROC PRINT step to display the new data set with the observations grouped by Employee_Gender.*/
proc print data=work.sort_salary2;
   by Employee_Gender;
run;
/*use proc print to display the new data set grouped by Employee_Gender*/

/*level2:7.Sorting orion.employee_payroll and Displaying a Subset of the New Data Set*/
  /*a.Sort orion.employee_payroll by Employee_Gender, and by descending Salary within gender.Place the sorted observations into a temporary data set named sort_sal.*/
proc sort data=orion.employee_payroll 
          out=work.sort_sal;
   by Employee_Gender descending Salary;
run;
/*Using proc sort to sort orion.employee_payroll by by Employee_Gender and within gender by descending Salary order. And put the result in new data set named sort_sal.*/

  /*b.Print a subset of the sort_sal data set. 
  Select only the observations for active employees (those without a value for Employee_Term_Date) who earn more than $65,000. 
  Group the report by Employee_Gender, and include a total and subtotals for Salary. Suppress the Obs column. 
  Display only Employee_ID, Salary, and Marital_Status. The results contain 18 observations.*/
proc print data=work.sort_sal noobs;
   by Employee_Gender;
   sum Salary;
   where Employee_Term_Date is missing and Salary>65000;
   var Employee_ID Salary Marital_Status;
 run; 
/*Using proc print to display a subset of work.sort_sal data set grouped by Employee_Gender and using sum statement to add a total and subtotals for Salary.*/
/*Using where statement to select only employees without a value for Employee_Term_Date and earn more than $65,000.*/
/*Using var statement to display only Employee_ID, Salary and Marital_Status columns.*/
 
/*4.3*/
/*level1:9.Displaying Titles and Footnotes in a Detail Report*/
/*a.Open and submit p104e09 to display all observations for Australian Sales Rep IVs.*/
proc print data=orion.sales noobs;
	where Country='AU' and Job_Title contains 'Rep. IV';
run;
/*Using proc print to display the data*/
/*Using where statement to select all all observations for Australian Sales Rep IVs*/
/*Using noobs to avoid obs columns.*/

/*b.Add a VAR statement to display only the variables shown in the report below.*/
proc print data=orion.sales noobs;
   where Country='AU' and Job_Title contains 'Rep. IV';
   var Employee_ID First_Name Last_Name Gender Salary;
run;
/*Using var statement to display only Employee_ID, First_Name, Last_Name, Gender and Salary*/

/*c.Add TITLE and FOOTNOTE statements to include the titles and footnotes shown in the report below.*/
title1 'Australian Sales Employees';
title2 'Senior Sales Representatives';
/*Using title statement to create title1 and title2 as show in the report.*/
footnote1 'Job_Title: Sales Rep. IV';
/*Using footnote statement to create footnote1 as show in the report.*/

/*d.Submit the program and verify the output. The results contain five observations as shown below.*/
proc print data=orion.sales noobs;
   where Country='AU' and Job_Title contains 'Rep. IV';
   var Employee_ID First_Name Last_Name Gender Salary;
run;
/*Run this program again and we can find it contains title and footnote now*/
￼
/*e.Submit a null TITLE and null FOOTNOTE statement to clear all titles and footnotes.*/
title; 
/*Using null title statement to cancel all titles*/
footnote;
/*Using null footnote statement to cancel all titles*/

/*10.Displaying Column Headings in a Detail Report*/
/*a.Open and submit p104e10. Modify the program to define and use the following labels.Submit the program and verify the output.*/
title 'Entry-level Sales Representatives';
/*Using title statement to create title as show in the report.*/
footnote 'Job_Title: Sales Rep. I';
/*Using footnote statement to create footnote as show in the report.*/
proc print data=orion.sales noobs label;
   where Country='US' and Job_Title='Sales Rep. I';
   var Employee_ID First_Name Last_Name Gender Salary;
   label Employee_ID="Employee ID"
         First_Name="First Name"
         Last_Name="Last Name"
         Salary="Annual Salary";
run;
/*Using label statement to display descriptive column headings instead of variable names: for example,"Employee ID" instead of Employee_ID*/
title;
/*Using null title statement to cancel all titles*/
footnote;
/*Using null footnote statement to cancel all titles*/

/*b.Modify the program to use a blank space as the SPLIT= character to generate two-line column headings. Submit the modified program and verify that two-line column labels are displayed.*/
title 'Entry-level Sales Representatives';
/*Using title statement to create title as show in the report.*/
footnote 'Job_Title: Sales Rep. I';
/*Using footnote statement to create footnote as show in the report.*/
proc print data=orion.sales noobs split=' ';
   where Country='US' and Job_Title='Sales Rep. I';
   var Employee_ID First_Name Last_Name Gender Salary;
   label Employee_ID="Employee ID"
         First_Name="First Name"
         Last_Name="Last Name"
         Salary="Annual Salary";
run;
/*Using SPLIT= option in PROC PRINT specifies ' ' to control line breaks in column headings.*/
title;
/*Using null title statement to cancel all titles*/
footnote;
/*Using null footnote statement to cancel all titles*/

/*level2:11.Writing an Enhanced Detail Report*/
/*a.Write a program to display a subset of orion.employee_addresses as shown below. The program should sort the observations by State, City, and Employee_Name and then display the sorted observations grouped by State. The resulting report should contain 311 observations.*/
proc sort data=orion.employee_addresses out=work.address;
   where Country='US';
   by State City Employee_Name;
run;
/*Using proc sort to select the US addresses in the orion.employee_addresses data set, sort the observations by State, City, and Employee_Name, and put the result into new data set work.address.*/
title "US Employees by State";
/*Using title statement to create title as show in exercise*/
proc print data=work.address noobs split=' ';
   var Employee_ID Employee_Name City Postal_Code;
   label Employee_ID='Employee ID'
         Employee_Name='Name'
         Postal_Code='Zip Code';
   by State;
run;
/*Using proc print to dispaly work.address data grouped by state without obs column, and using SPLIT= option specifies ' ' to control line breaks in column headings.*/
/*Using label statement to display descriptive column headings instead of variable names: for example,"Employee ID" instead of Employee_ID*/
/*Using var statement to only display Employee_ID, Employee_Name, City and Postal_Code columns*/
title;
/*Using null title statement to cancel all titles*/

/*4. ReviewChapter5Material*/
/*5. Exercise:Chapter5.1,2Levels1and2(pages5-10,11,24,25)*/
/*5.1*/
/*level1:1.Displaying Formatted Values in a Detail Report
  /*a.Open p105e01 and submit. Review the output.*/
proc print data=orion.employee_payroll;
run;
/*Using proc print to display orion.employee_payroll data set.*/
 
  /*b.Modify the PROC PRINT step to display only Employee_ID, Salary, Birth_Date, and Employee_Hire_Date.*/
proc print data=orion.employee_payroll;
   var Employee_ID Salary Birth_Date Employee_Hire_Date;
run;
/*Using var statement to display only Employee_ID, Salary, Birth_Date, and Employee_Hire_Date.*/
 
  /*c.Add a FORMAT statement to display Salary in a dollar format, Birth_Date in 01/31/2012 date style, and Employee_Hire_Date in the 01JAN2012 date style, as shown in the report below.*/
proc print data=orion.employee_payroll;
   var Employee_ID Salary Birth_Date Employee_Hire_Date;
   format Salary dollar11.2 Birth_Date mmddyy10. 
		  Employee_Hire_Date date9.;
run;
/*Using format statement to wirte:
 Salary with a leading dollar sign, a comma that separates every three digits, and a period that separates the decimal fraction; the total format width is 11, including decimal places and special characters; the number of decimal places is 2.
 Birth_Date with mmddyy10 format(01/31/2012); and Employee_Hire_Date with date9 format(01JAN2012).*/

/*level2:2.Displaying Formatted Values in a Detail Report*/
  /*a.Write a PROC PRINT step to display the report below using orion.sales as input. Subset the observations and variables to produce the report shown below. Include titles, labels, and formats. The results contain 13 observations.*/
title1 'US Sales Employees';
/*Using title statement to create title1 as show in the report.*/
title2 'Earning Under $26,000';
/*Using footnote statement to create footnote as show in the report.*/
proc print data=orion.sales label noobs;
   where Country='US' and Salary<26000;
   var Employee_ID First_Name Last_Name Job_Title Salary Hire_Date;
   label First_Name='First Name'
		 Last_Name='Last Name'
	     Job_Title='Title'
		 Hire_Date='Date Hired';
   format Salary dollar10. Hire_Date monyy7.;
run;
/*Using proc print to display orion.sales data without obs column.*/
/*Using where statement to select only Employee_ID First_Name Last_Name Job_Title Salary and Hire_Date columns*/
/*Using label statement to display descriptive column headings instead of variable names*/
/*Using format statement to write Salary with a leading dollar sign and a comma that separates every three digits, the total format width is 10, no decimal places; and Hire_Date in monyy7 format(OCT2007).*/
title;
/*Using null title statement to cancel all titles*/
footnote;
/*Using null footnote statement to cancel all titles*/

/*5.2*/
/*level1:4.Creating User-Defined Formats*/
  /*a.Retrieve the starter program p105e04.*/
data Q1Birthdays;
   set orion.employee_payroll;
   BirthMonth=month(Birth_Date);
   if BirthMonth le 3;
run;
/*Create Q1Birthdays data set by data statement from orion.employee_payroll.*/
/*Create variable BirthMonth put the month of Birth_Date into it, and select the obersavations that have birth month less than and equal to 3.*/

  /*b.Create a character format named $GENDER that displays gender codes as follows:*/
proc format;
   value $gender
      'F'='Female'
      'M'='Male';
run;
/*Using proc format to create character format named $GENDER that display F and M instead of female and male.*/
 
  /*c.Create a numeric format named MNAME that displays month numbers as follows:*/
proc format;
   value mname
       1='January'
       2='February'
       3='March';
run;
/*Using proc format to create numeric format named MNAME that display 1,2,3 instead of January, February and March.*/

  /*d.Add a PROC PRINT step to display the data set, applying these two user-defined formats to the Employee_Gender and BirthMonth variables, respectively.*/
title 'Employees with Birthdays in Q1';
/*Using title statement to create title as show in the report.*/
proc print data=Q1Birthdays;
   var Employee_ID Employee_Gender BirthMonth;
   format Employee_Gender $gender.
          BirthMonth mname.;
run; 
/*Using proc print to display Q1Birthdays data, and using var statement to only display Employee_ID Employee_Gender and BirthMonth */
/*Using format statement to format Employee_Gender by $gender and format BirthMonth by mname*/
title;  
/*Using null title statement to cancel all titles*/

  /*e.Submit the program to produce the following report. The results contain 113 observations.*/


/*level2:5.Defining Ranges in User-Defined Formats*/
  /*a.Retrieve the starter program p105e05.*/
proc print data=orion.nonsales;
   var Employee_ID Job_Title Salary Gender;
   title1 'Salary and Gender Values';
   title2 'for Non-Sales Employees';
run;
/*Using proc print to display orion.nonsales data with title1 and title2 at the top, and using var statement to display only Employee_ID, Job_Title, Salary and Gender columns.*/

  /*b.Create a character format named $GENDER that displays gender codes as follows:*/
proc format;
   value $gender 'F'='Female'
                 'M'='Male'
               other='Invalid code';
run;
/*Using proc format to create character format named $GENDER that display F, M and other instead of female, male and Invalid code.*/ 
 
  /*c.Create a numeric format named SALRANGE that displays salary ranges as follows:*/
proc format;
   value salrange .='Missing salary'
      20000-<100000='Below $100,000'
      100000-500000='$100,000 or more'
              other='Invalid salary';
run;
/*Using proc format to create numeric format named SALRANGE that display data as show in exercise.*/ 
 
  /*d.In the PROC PRINT step, apply these two user-defined formats to the Gender and Salary variables, respectively. Submit the program to produce the following report:Partial PROC PRINT Output*/
title1 'Salary and Gender Values';
title2 'for Non-Sales Employees';
/*Using title statement to create title1 as show in the report.*/
/*Using title statement to create title2 as show in the report.*/
proc print data=orion.nonsales;
   var Employee_ID Job_Title Salary Gender;
   format Salary salrange. Gender $gender.;
run;
/*Using proc print to display orion.nonsales data, and using var statement to only display Employee_ID, Job_Title, Salary and Gender */
/*Using format statement to format Gender by $gender and format Salary by salrange*/
title;
/*Using null title statement to cancel all titles*/

/*6. ReviewChapter6material*/
/*7. Exercises:Chapter6.2,Level2,5.Subsetting Observations Based on Three Conditions*/
  /*a.Write a DATA step to create work.delays using orion.orders as input.*/
  /*b.Create a new variable, Order_Month, and set it to the month of Order_Date. Hint: Use the MONTH function.*/
  /*c.Use a WHERE statement and a subsetting IF statement to select only the observations that meet all of the following conditions:• Delivery_Date values that are more than four days beyond Order_Date • Employee_ID values that are equal to 99999999• Order_Month values occurring in August*/
  /*d.The new data set should include only Employee_ID, Customer_ID, Order_Date, Delivery_Date, and Order_Month.*/
  /*e.Add permanent labels for Order_Date, Delivery_Date, and Order_Month as shown below. */
  /*f.Add permanent formats to display Order_Date and Delivery_Date as MM/DD/YYYY.*/
data work.delays;
   set orion.orders;
   where Order_Date+4<Delivery_Date 
         and Employee_ID=99999999;
   Order_Month=month(Order_Date);
   if Order_Month=8;
   label Order_Date='Date Ordered'
	     Delivery_Date='Date Delivered'
		 Order_Month='Month Ordered';
   format Order_Date Delivery_Date mmddyy10.;
   keep Employee_ID Customer_ID Order_Date Delivery_Date Order_Month;
run;  
/*Using data statement to create a data set work.delays from orion.orders*/
/*Create a variable Order_Month which is the month of Order_Date.*/
/*Using where statement to select obersavations that Delivery_Date values are more than four days beyond Order_Date and Employee_ID values are equal to 99999999*/
/*Using keep to display only Employee_ID, Customer_ID, Order_Date, Delivery_Date, and Order_Month*/
/*Using label statement to display descriptive column headings instead of variable names*/
/*Uisng format statement to format Order_Date and Delivery_Date in mmddyy10 format(MM/DD/YYYY).*/

  /*g.Add a PROC CONTENTS step to verify that the labels and formats were stored permanently.*/
proc contents data=work.delays;
run;
/*Using proc contencts to display the new data set work.delays, the labels and formats were stored permanently*/

  /*h.Write a PROC PRINT step to create the report below. Results should contain nine observations.*/
proc print data=work.delays;
run;
/*Using proc print to display data work.delays as show in exercise*/

/*8. ReviewChapter9material*/
/*9. Exercises:Chapter9.1Level2,2.Creating New Variables*/
  /*a.Write a DATA step that reads orion.customer to create work.birthday.*/
  /*b.In the DATA step, create three new variables: Bday2012, BdayDOW2012, and Age2012.
   • Bday2012 is the combination of the month of Birth_Date, the day of Birth_Date, and the constant of 2012 in the MDY function.
   • BdayDOW2012 is the day of the week of Bday2012.
   • Age2012 is the age of the customer in 2012. Subtract Birth_Date from Bday2012 and divide the result by 365.25.*/
  /*c.Include only the following variables in the new data set: Customer_Name, Birth_Date, Bday2012, BdayDOW2012, and Age2012.*/
  /*d.Format Bday2012 to display in the form 01Jan2012. Age2012 should be formatted to display with no decimal places.*/
data work.birthday;
   set orion.customer;
   Bday2012=mdy(month(Birth_Date),day(Birth_Date),2012);
   BdayDOW2012=weekday(Bday2012);
   Age2012=(Bday2012-Birth_Date)/365.25;
   keep Customer_Name Birth_Date Bday2012 BdayDOW2012 Age2012;
   format Bday2012 date9. Age2012 3.;
run;
/*Using data statement to create a data set work.birthday from orion.customer*/
/*Create three variable Bday2012, BdayDOW2012 and Age2012 as described.*/
/*Using keep to display only Customer_Name, Birth_Date, Bday2012, BdayDOW2012, and Age2012*/
/*Uisng format statement to format Bday2012 in date9. format and Age2012 with 3 total format width and no decimal places*/

  /*e.Write a PROC PRINT step to create the report below. The results should contain 77 observations. Partial PROC PRINT Output*/
proc print data=work.birthday;
run;
/*Using proc print to display data work.birthday as show in exercise*/

/*10.Exercises: Chapter 9.2 Level 2*/
/*6.Creating Multiple Variables in Conditional Processing*/
  /*a.Write a DATA step that reads orion.customer_dim to create work.season.*/
  /*b.Create two new variables: Promo and Promo2.
    The value of Promo is based on the quarter in which the customer was born.
    • If the customer was born in the first quarter, then Promo is equal to Winter.
    • If the customer was born in the second quarter, then Promo is equal to Spring.
    • If the customer was born in the third quarter, then Promo is equal to Summer. 
    • If the customer was born in the fourth quarter, then Promo is equal to Fall.
    The value of Promo2 is based on the customer’s age:
    • For young adults, whose age is between 18 and 25, set Promo2 equal to YA. • For seniors, aged 65 or older, set Promo2 equal to Senior.
    • Promo2 should have a missing value for all other customers.*/
  /*c.The new data set should include only Customer_FirstName, Customer_LastName, Customer_BirthDate, Customer_Age, Promo, and Promo2.*/
data work.season;
   set orion.customer_dim;
   length Promo2 $ 6;
   Quarter=qtr(Customer_BirthDate);
   if Quarter=1 then Promo='Winter';
   else if Quarter=2 then Promo='Spring';
   else if Quarter=3 then Promo='Summer';
   else if Quarter=4 then Promo='Fall';
   if Customer_Age>=18 and Customer_Age<=25 then  Promo2='YA';
   else if Customer_Age>=65 then  Promo2='Senior';
   keep Customer_FirstName Customer_LastName Customer_BirthDate   
        Customer_Age Promo Promo2; 
run;
/*Using data statement to create a new data set work.season from orion.customer_dim*/
/*Create two new variables promo and promo2, using if...then statement to create promo and promo2 for each observation*/
/*Using length statement to define the type and length of variable promo2*/
/*Create a variable Quarter, let it be the quarter of Customer_BirthDate, insert winter, spring, summer or fall into promo when quarter=1,2,3 or 4*/
/*Using if...then statement to insert ya and senior into promo2 in certain situation*/
/*Using keep statement to display only Customer_FirstName, Customer_LastName, Customer_BirthDate, Customer_Age, Promo and Promo2*/ 

  /*d.Create the report below. The results should include 77 observations. Partial PROC PRINT Output*/
proc print data=work.season;
   var Customer_FirstName Customer_LastName Customer_BirthDate Promo 
       Customer_Age Promo2; 
run;
/*Using proc print to display the data work.season, using var statement to display only Customer_FirstName, Customer_LastName, Customer_BirthDate, Promo, Customer_Age and Promo2*/

/*7.Creating Variables Unconditionally and Conditionally*/
  /*a.Write a DATA step that reads orion.orders to create work.ordertype.*/
  /*b.Create a new variable, DayOfWeek, that is equal to the weekday of Order_Date.*/
  /*c.Create the new variable Type, which is equal to: Retail Sale if Order_Type is equal to 1; Catalog Sale if Order_Type is equal to 2; Internet Sale if Order_Type is equal to 3.*/
  /*d.Create the new variable SaleAds, which is equal to: Mail if Order_Type is equal to 2;Email if Order_Type is equal to 3.*/
  /*e.Do not include Order_Type, Employee_ID, and Customer_ID in the new data set. */
data work.ordertype;
   set orion.orders;
   length Type $ 13 SaleAds $ 5;
   DayOfWeek=weekday(Order_Date);
   if Order_Type=1 then 
      Type='Retail Sale';
   else if Order_Type=2 then do;
      Type='Catalog Sale';
	 SaleAds='Mail';
   end;
   else if Order_Type=3 then do;
      Type='Internet Sale';
	 SaleAds='Email';
   end;
   drop Order_Type Employee_ID Customer_ID;
run;
/*Using data statement to create a new data set work.ordertype from orion.orders*/
/*Create new variable DayOfWeek that is equal to the weekday of Order_Date*/
/*Create two new variable type and saleads, using length statement to define the type and length of variable type and saleads*/
/*Using if...then statement to insert retail, catalog or internet sale into type when order_type=1,2,3*/
/*Using if...then statement to insert mail and email into saleads when order_type=2,3*/
/*Using dorp statement to specifies the variables to exclude from the output data set.*/

 
  /*f.Create the report below. The results should contain 490 observations.Partial PROC PRINT Output*/
proc print data=work.ordertype;
run;
/*Using proc print to display the data work.ordertype*/

/*11.Review Chapter 10 material*/
/*12.Exercises: Chapter 10.1 Level 2*/
/*3.Concatenating Data Sets with Variables of Different Lengths and Types*/
  /*a.Open p110e03. Submit the PROC CONTENTS steps or explore the data sets interactively to complete the table below by filling in attribute information for each variable in each data set.
                   |     code       |    Company     | ContactType   |                                      
                   | Type  | Length | Type  | Length | Type | Length |                                      
orion.charities    | char  |   6    | char  |   40   | char |   10   |
orion.us_suppliers | char  |   6    | char  |   30   | char |   1    |
orion.consultants  | char  |   6    | char  |   30   | num  |   8    |   */     
proc contents data=orion.charities;
run;
proc contents data=orion.us_suppliers;
run;
proc contents data=orion.consultants;
run;
/*Using proc contents to list the properties of the data set orion.charities, orion.us_suppliers and orion.consultants*/ 

  /*b.Write a DATA step to concatenate orion.charities and orion.us_suppliers, creating a temporary data set, contacts.*/
data work.contacts;	
   set orion.charities orion.us_suppliers;
run;
/*Using data statement to create a new data set work.contacts that include the contents from orion.charities and orion.us_suppliers*/

  /*c.Submit a PROC CONTENTS step to examine work.contacts. */
proc contents data=work.contacts;
run;
/*Using proc contents to list the properties of the data set work.contacts*/
/*From which input data set were the variable attributes assigned? The first data set in the set statement, orion.charities. */  

  /*d.Write a DATA step to concatenate orion.us_suppliers and orion.charities, creating a temporary data set, contacts2. Note that these are the same data sets as the previous program, but they are in reverse order.*/
data work.contacts2;	
   set orion.us_suppliers orion.charities;
run;
/*Using data statement to create a new data set work.contacts2 that include the contents from orion.us_suppliers and orion.charities*/

  /*e.Submit a PROC CONTENTS step to examine work.contacts2. */
proc contents data=work.contacts2;
run;
/*Using proc contents to list the properties of the data set work.contacts2*/
/*From which input data set were the variable attributes assigned? The first data set in the set statement, orion.us_suppliers. */

  /*f.Write a DATA step to concatenate orion.us_suppliers and orion.consultants, creating a temporary data set, contacts3.*/
data work.contacts3;	
   set orion.us_suppliers orion.consultants;
run;
/*Using data statement to create a new data set work.contacts3 that include the contents from orion.us_suppliers and orion.consultants*/
/*Why did the DATA step fail? Because ContactType has been defined as both character and numeric.*/

/*13.Exercises: Chapter 10.3 Level 2*/
/*5.Merging a Sorted Data Set and an Unsorted Data Set in a One-to-Many Merge*/
  /*a.Sort orion.product_list by Product_Level to create a new data set, work.product_list.*/
proc sort data=orion.product_list 
          out=work.product_list;
   by Product_Level;
run;  
/*Using proc sort to sort orion.product_list by product_level and put the result in a new data set work.product_list*/ 
 
  /*b.Merge orion.product_level with the sorted data set. Create a new data set, work.listlevel, which includes only Product_ID, Product_Name, Product_Level, and Product_Level_Name.*/
data work.listlevel;
   merge orion.product_level work.product_list ;
   by Product_Level;
   keep Product_ID Product_Name Product_Level Product_Level_Name;
run;
/*Using merge statement to orion.product_level work.product_list, and put the result into new data set work.listlevel and group work.listlevel by Product_Level*/  
/*Using keep statement to only include Product_ID, Product_Name, Product_Level and Product_Level_Name in the new data set*/

  /*c.Create the report below, including only observations with Product Level equal to 3. The results should contain 13 observations.Partial PROC PRINT Output*/
proc print data=work.listlevel noobs;
   where Product_Level=3;   
run;
/*Using proc print to display work.listlevel with out obs column*/
/*Using where statement to only display observations with Product Level equal to 3*/

/*14.Exercises: Chapter 10.4 Level 2*/
/*8.Merging Using the IN= and RENAME= Options*/
  /*a.Write a PROC SORT step to sort orion.customer by Country to create a new data set, work.customer.*/
proc sort data=orion.customer
          out=work.customer;
   by Country;
run;
/*Using proc sort to sort orion.customer by country and put the result in a new data set work.customer*/ 
 
  /*b.Write a DATA step to merge the resulting data set with orion.lookup_country by Country to create a new data set, work.allcustomer.
      In the orion.lookup_country data set, rename Start to Country and rename Label to Country_Name.
      Include only four variables: Customer_ID, Country, Customer_Name, and Country_Name.*/
data work.allcustomer;
   merge work.customer 
         orion.lookup_country(rename=(Start=Country Label=Country_Name));
   by Country;
   keep Customer_ID Country Customer_Name Country_Name;
run;
/*Using data statement to create a new data set work.allcustomer*/
/*Using merge statement to merge work.customer and orion.lookup_country dataset together by country in new data set*/
/*rename Start to Country and rename Label to Country_Name in the orion.lookup_country data set*/
/*Using keep statement to display only Customer_ID, Country, Customer_Name, and Country_Name.*/
 
  /*c.Create the report below. The results should contain 308 observations. Partial PROC PRINT Output*/
proc print data=work.allcustomer;
run;
/*Using proc print to display work.allcustomer*/

  /*d.Modify the DATA step to store only the observations that contain both customer information and country information. A subsetting IF statement that references IN= variables in the MERGE statement must be added.*/
data work.allcustomer;
	merge work.customer(in=Cust) 
         orion.lookup_country(rename=(Start=Country Label=Country_Name) in=Ctry);
	by Country;
	keep Customer_ID Country Customer_Name Country_Name;
	if Cust=1 and Ctry=1;
run;
/*Using IN= data set option creates a variable that indicates whether the data set contributed to building the current observation*/
/*Using if statement to select only the observations that contain both customer information and country information(when new variables equal to 1, means the data set contributed to building the current obeservations)*/

  /*e.Submit the program to create the report below. The results should contain 77 observations. Partial PROC PRINT Output*/
proc print data=work.allcustomer;
run;  
/*Using proc print to display work.allcustomer*/  
  
  
  
  
  
  
  
  

















