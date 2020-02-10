#!/usr/bin/env python
# coding: utf-8

# In[1]:


12


# In[2]:


45-29 


# In[3]:


# _ or 'underscore' is a special variable in Python, which stores the most recent output value of the interpreter
# _ can be used with other expressions and operators as well
print(_,_+4)


# In[4]:


a=11+5 # addition
b=11-5 # subtraction
c=11*5 # multiplication
d=11/5 # division
e=11//5 # returns quotient as result
f=11%5 # (modulus) returns remainder as result 
g=11**5 # exponents

print("Addition 11+5 :",a) 
print("Subtraction 11-5 :",b)
print("Multiplication 11*5 :",c)
print("Division 11/5 :",d)
print("Division (// returns quotient) 11//5 :",e)
print("Division (% returns remainder) 11%5 :",f)
print("Exponent 11**5 :",g)


# In[5]:


print("Result of 5+2*7-8/2**2+1 is :", 5+2*7-8/2**2+1)


# In[6]:


print("Result of (5+2)*7-(8/2**2)+1 is :",(5+2)*7-(8/2**2)+1)


# In[7]:


x=4
y=5
print("x+y:",x+y)

# demonstrating the id function
a=1
print("\na:",a,", id of a is:",id(a)) # id(variable) return a unique identifier for an object within the memory
b=a # variable 'b' is pointing to 'a'
print("b:",b,", id of b is:",id(b)) # id of 'b' is same as id of 'a' as they both refer to the same object in memory 

b=2 # value of variable 'b' is changed
print("\nb:",b,", id of b is:",id(b)) # id of 'b' will be changed

# Help Function is called if we require any help in Python
# For example, keywords. We should not use these reserved keywords as our variable names
help('keywords')


# In[8]:


print("11 is greater than 5:",11>5) # greater than
print("11 is less than 5:",11<5) # less than
print("11 is equal to 5:",11==5) # equal to
print("11 is 5:",11 is 5) # is statement is equivalent to ==
print("11 is not equal to 5:",11!=5) # not equal to
print("11 is not 5:",11 is not 5) # is not statement is equivalent to !=
print("11 is lesser than or equal to  5:",11<=5) # less than equal to
print("11 is greater than or equal to 5:",11>=5) # greater than equal to


# In[9]:


# AND: Returns true only if both conditions are true 
# OR: Returns true if either one of both the conditions is true 
# NOT: reverses the result

print("11>5 or 11<5: ",11>5 or 11<5)
print("11>5 and 11<5: ",11>5 and 11<5)
print("False or True: ",False or True)
print("False and True: ",False and True)
print("not(True): ",not(True))
print("not(False): ",not(False))


# In[10]:


x="Orange" # using double quotes
y='Yellow' # using single quotes

print("x:",x)
print("y:",y)

print("\nx==y:",x==y) # equal to
print("x is y:",x is y) # is statement is equivalent to ==
print("x!=y:",x!=y) # not equal to
print("x<y:",x<y) # less than, returns true as 'o' comes before 'y'
print("x>y",x>y) # greater than, returns false as 'o' comes before 'y'
print("1=='1':",1=='1') # 1 is an integer while '1' is a string

# A String Peculiarity
s1='abcdef'
s2='abcdef'
print('\ns1:',s1)
print('s2:',s2)
print("s1 is s2:",s1 is s2) # returns True
s3='abc-def'
s4='abc-def'
print('\ns3:',s3)
print('s4:',s4)
print("s3 is s4:",s3 is s4) # returns False because of the introduction of special character
print("s3 == s4:",s3 == s4)


# In[11]:


s="This is a sample text." # special characters and white spaces are also counted
print("s:",s)
print("\nLength of the string 's' is:",len(s))


# In[12]:


a="This is a sample string"
print("a:",a)

print("\n'sample' in a:",'sample' in a) 
print("'test' in a:",'test' in a) 
print("'sample' not in a:",'sample' not in a) # not in means not a substring


# In[13]:


s="Some text"
print("s:",s)
length=len(s)
print("Length:",length)

print("\nFirst character, s[0]:",s[0]) # first character
print("Character at index position 7, s[7]:",s[7]) # fetches the character at index position 7 in the string
print("Last character, ,s[length-1]:",s[length-1]) # last character

# Negative indexing is also possible. 
print("\nLast character using negative indexing, s[-1]:",s[-1]) # fetches last element
print("Character at index position 4 from the end, s[-4]:",s[-4]) # fetches 4th element from the end (equivalent to index position 7 from the beginning)
print("First character, s[-(length)]:",s[-(length)]) # fetches first element (equivalent to s[0])


# In[14]:


a,b,c,d,e=1,'Hello',"Hi",4.5,True # multiple assignment to various variables
print("a:",a)
print("b:",b)
print("c:",c)
print("d:",d)
print("e:",e)

print("\nClass of a:",type(a)) 
print("Class of b:",type(b))
print("Class of c:",type(c))
print("Class of d:",type(d))
print("Class of e:",type(e))


# In[15]:


print("Text 1\nText 2") # two separate lines are printed


# In[16]:


print("Text 1\\nText 2") # In order to print \n as text, we insert a backslash as an escape sequence.


# In[17]:


print(r"Text 1\nText 2") # Letter 'r' can also be placed before the string as an alternative to escape sequence (works similar to above)


# In[18]:


print("Text 1\tText 2") # \t represents a tab


# In[19]:


paragraph= """This is a test paragraph using double quotes.
This is another line.\n"""
print(paragraph)

second_paragraph='''This is a second paragraph using single quotes.
Multiple lines can be used.\n'''
print(second_paragraph)

third_paragraph='''This is a third paragraph. Multiple lines can be used. If we use \ in the end of line, it continues to remain in the same line.\n'''
print(third_paragraph)

print("Class of paragraph:",type(paragraph)) # paragraph is used mostly for documentation. It is of String datatype.
print("Length of paragraph:",len(paragraph))


# In[20]:


s1='Hey! '
print(s1*3) # 3 copies of string s1


# In[21]:


"This is a "+'concatenated string.'


# In[22]:


s="this is a sample string."
print("s:",s)

print("\ns.upper():",s.upper()) # converts string into upper case
print("s.lower():",s.lower()) # converts string into lower case
print("s.capitalize():",s.capitalize()) # capitalize the first letter
print('s.replace(" ","_"):',s.replace(" ","_")) # replaces blank space with underscvore
print("s.count('s'):",s.count('s')) # counts the string 's' in the main string
print("s.title():",s.title()) # returns the string with first capital letter of each word
print("s.split():",s.split()) # splits the string (on blank spaces)
print("s.split('s'):",s.split('s')) # splits the string (on character 's')
print("s.find('amp'):",s.find('amp')) # finds the position of specified string
print("s.index('amp'):",s.index('amp')) # returns the index of specified string
print("s[1:12]:",s[1:12]) # extracts substring from index position 1 to index position 11
print("s[1:12:2]:",s[1:12:2]) # extracts substring from index position 1 to index position 11 while skipping two places
print("s[::-1]:",s[::-1]) # reverses the string
print("s.startswith('this'):",s.startswith('this')) # checks the start of the string
print("s.endswith('this'):",s.endswith('this')) # checks the end of the string
print("s.replace('sample','test'):",s.replace('sample','test'))

a="    String with spaces      "
print("\na:"+a+" has length:",len(a))

print("a.lstrip(): "+a.lstrip()+" has length:",len(a.lstrip())) # lstrip removes the white spaces from the left side
print("a.rstrip(): "+a.rstrip()+" has length:",len(a.rstrip())) # rstrip removes the white spaces from the right side
print("a.strip(): "+a.strip()+" has length:",len(a.strip())) # strip() removes the white spaces from the left and right end

b="00543"
print("\nb:",b)
print("b.lstrip('0'):",b.lstrip('0'))

c='SamPlE TeXt'
print('\nc:',c)
print('c.swapcase():',c.swapcase()) # Swaps cases for all the letters of the string

d='12345ABCdef'
print('\nd:',d)
print('d.isalnum():',d.isalnum()) # Checks whether the string is alphanumeric

e='56893'
print('\ne:',e)
print('e.isnumeric():',e.isnumeric()) # Checks whether the string is numeric

f='Learning_Python'
print('\nf:',f)
print('f.isalpha():',f.isalpha()) # Checks whether the string is alphabetic

g='Coding'
print('\ng:',g)
print('g.isalpha():',g.isalpha()) # Checks whether the string is alphabetic


# In[23]:


s= "I want {} colors".format("two") # {} are used for substituting text
print(s)
print("I want {n} colors".format(n="three"))
n=4
print(f"I want {n} colors") # .format() can be also be replaced using f in the starting

color1='blue'
color2='pink'
number=2
print('\nMy {} favourite colors are {} and {}'.format(number,color1,color2))
print('My {a} favourite colors are {b} and {c}'.format(a=number,b=color1,c=color2))

print("\nString substitution is possible using arguments. {0} {1} {2} and so on....".format("Text_1","Text_2","Text_3"))
print("My text has string: %s" %("Hello.!"))
print("My text has string containing %% sign and %s" %("Hello!!")) # % sign acts as an escape sequence 
print("My text has number: %d" %(42.4))
print("My text has number with 0 decimal places: %.0f" %(42.4))
print("My text has number with 4 decimal places: %.4f" %(42.4))

pi=3.1415926
e=2.7182818
print('\nValues are: pi={} and e={}'.format(pi,e))
values=[pi,e]
print('Values are: pi={values[0]:.2f} and e={values[1]:.3f}'.format(values=values))


# In[24]:


[] 


# In[25]:


a= [12, 'abc', 8.95, "xyz",[2,6]]
print("a:",a)
b= [4,7,2,4]
print("b:",b)
c=a+b # concatenation
print("c:",c)

print("\nLength of c:",len(c))
print("'abc' in a:",'abc' in a)
print("35 in b:",35 in b)
print("12 not in a:",12 not in a)
print("2*b:",2*b) # 2 copies of list b
print("min(b):",min(b)) # minimum in list (list must not have strings)
print("max(b):",max(b)) # maximum in list (list must not have strings)
print("sum(b):",sum(b)) # sum of list elements (list must not have strings)


# In[26]:


a=[1,2,3,4,5]
print("Original List: {}" .format(a))

# Append method is used to add new elements in the pre-exisiting list.
a.append(6)
print("List after append(): {}" .format(a))

# extend method is used to extend the list
a.extend([7,8,9])
print("List after extend(): {}" .format(a))

# Pop method is used to remove the last element from the list.
a.pop()
print("List after pop(): {}" .format(a))

# Insert into position
a.insert(4,'Text')
print("List after insert(): {}" .format(a))


# In[27]:


# A specific element can be referred from a list. For instance:  
a=[1,2,3,4,5]
print("a:",a)

L=(len(a)) 
print("\nLength of a (L): {}" .format(L))# The length of the list. Indexing starts from zero.
print("a[2]:",a[2]) # Third element
print("a[0]:",a[0]) # First element
print("a[L-1]:",a[L-1]) # Last element

# Setting a value in list (mutable)
# For example, set a value of 6 at index position 2
a[2]=6 # 3 is changed to 6
print("\nList after setting new value: {}" .format(a))

# A specific element can be removed from a list using its index position in the pop function.
# For example, remove element 6
a.pop(2) # a.pop(index)
print("List after pop(2): {}" .format(a))

# An element can be deleted from a list using del function by specifying its index position
del(a[0])
print("Final List after deleting an element: {}" .format(a))


# In[28]:


a=["Ravi","Rahul","Rohan"]
print("a:",a)

print("\na[2][2]:",a[2][2]) # Third element, Third character
print("a[1][3]:",a[1][3]) # Second element, Fourth character
print("a[0][2]:",a[0][2]) # First element, Third character

# nesting
b= [12, 'abc', ["Text",5.34,23,True], "xyz",[2,6]] 
print("\nb:",b)

print("\nb[1]:",b[1])
print("b[2]:",b[2])
print("b[2][1]:",b[2][1])
print("b[2][0][3]:",b[2][0][3])


# In[29]:


a=[1,5,8,2,5,2]
print("a:",a)

print("Class of a:",type(a))
a.reverse() # reverses the list
print("After a.reverse(), a:",a)


# In[30]:


a=[1,5,8,2,5,2]
print("a:",a)

print("a.count(5):",a.count(5)) # returns the number of occurences of element 5
print("a.index(5):",a.index(5)) # returns the first index position of element 5
a.remove(5) # removes the first occurence of element 5
print("List after removing 5: ",a)

a.sort() # sorts the list in ascending order
print("\nList after sorting: ",a)

b='This is a sample string consisting of multiple words for the testing purpose.'.split()
b.sort(key=len) # key argument to sort() accepts a function for producing a sort key from an item
print("\nList after sorting using key argument:\n ",b)


# In[31]:


a=[1,5,8,2,5,2]
print("a:",a)

print("\na[3:5]:",a[3:5]) # fetches elements from index position 3 to index position 4
print("a[1:]:",a[1:]) # fetches elements from index position 1 till end
print("a[:3]:",a[:3]) # fetches elements from starting till index position 2

b=a # list B is referencing to list A
print("\nList A is {x} and List B is {y}".format(x=a,y=b))
a[2]=5 # change in List A
print("After changing a[2]=5,\nList A is {x} and List B is {y}".format(x=a,y=b)) # notice that list B also changes at the same position since both are referencing to the same list in memory.

c=a[:] # List C is created by cloning list A, a new list is created and not referenced
print("\nList A is {x} and List C is {z}".format(x=a,z=c))
a[2]=3
print("After changing a[2]=3,\nList A is {x} and List C is {z}".format(x=a,z=c))
# notice that list C doesn't changes because both are the different lists and they are not referencing to the same list in memory.


# In[32]:


a=[1,2,3]
b=[1,2,3]

print('a==b:',a==b) # Values are equivalent
print('a is b:',a is b) # Separate objects

print('\nid(a):',id(a))
print('id(b):',id(b))


# In[33]:


a=(1,5,8,2,5,2)
print("a:",a)
print("Type: ",type(a))
print("Sum: ",sum(a)) # sum of a tuple containing integers
print("a.count(5): ",a.count(5)) # returns the number of occurences of element 5
print("a.index(8): ",a.index(8)) # returns the first index position of element 8

# functions like reverse, remove and sort will not work since tuples are not mutable in nature.

# sorted function returns a sorted list and can be called on any iterable series (here tuple)
b=sorted(a) # sorted in ascending order
print("\nb: ",b)
print("Type of b: ",type(b)) # b is a list

c=sorted(a,reverse=True) # sorted in descending order
print("\nc: ",c)
print("Sum: ",sum(c)) 

d=reversed(a) # reverses any iterable series (here tuple), returns an object
print('\nIterable Series: {}'.format(a))
print('Reversed List: {}'.format(list(d))) # object converted explicitly into list


# In[34]:


a=(100,) # only one element
print('{} is a tuple: {}'.format(a,type(a)))

b= 1,2,3,4,5 # multiple elements without parenthesis
print('\n{} is a tuple: {}'.format(b,type(b)))

# Swapping elements
c,d=10,20
print('\nc: {} & d: {}'.format(c,d))
c,d=d,c
print('After Swapping\nc: {} & d: {}'.format(c,d))

e=tuple('Apple')
print('\ne: {}'.format(e))


# In[35]:


a='Jack-Martin'
first_name, separator, last_name = a.partition('-') # returns a tuple
print('Name is: {} {}'.format(first_name,last_name))

b='Jack|24'
name, _, age = b.partition('|') # _ is used for invaluable results
print('\nName is: {}\nAge is: {}'.format(name,age))


# In[36]:


a=5
b=2
print("a:",a)
print("b:",b)
print("a//b:",a//b) # Quotient
print("a%b:",a%b) # Remainder

# The above operations can also be done using the divmod() that takes two arguments and returns a tuple of two values, quotient and remainder  

quot, rem= divmod(a,b)
print("\nQuotient using divmod():",quot)
print("Remainder using divmod():",rem)

# zip() contains one element from each sequence
x=zip("Hello", "12345")
print("\nx: ",list(x)) # result is changed into list
print("Type: ",type(x)) # zip is a class

y=zip([1,2,3,4],('abc','pqr','xyz'))
y=list(y)
print("\ny: ",y) # contains three elements (shorter length is considered)

# in order to get back the lists, we can unzip the list of tuples using the asterisk
a,b=zip(*y)
print("\nAfter unzip, \na: {} \nb: {}" .format(a,b))


# In[37]:


print("int(4): ",int(4))
print("int(4.5): ",int(4.5)) # type conversion from float to integer
print("int('78'): ", int('78')) # type conversion from string to integer
print("int(True): ",int(True)) # type conversion from boolean to integer

print("\nstr('Hey'): ",str('Hey'))
print("str(53): ",str(53)) # type conversion from integer to string
print("str(46.2): ", str(46.2)) # type conversion from float to string
print("str(True): ",str(True)) # type conversion from boolean to string

print("\nfloat(3.6): ",float(3.6))
print("float('21.64'): ", float('21.64')) # type conversion from string to float
print("float(435): ", float(435)) # type conversion from integer to float
print("float(True): ",float(True)) # type conversion from boolean to float

print("\nbool(1): ",bool(1))
print("bool(0): ", bool(0))

print("\nlist([3,6,'fan']): ",list([3,6,'fan']))
print("tuple([2,8,'test', False]): ",tuple([2,8,'test', False]))
print("tuple('String123'): ", tuple('String123'))

# Default Values
print("\nDefault Values\nint(): ",int()) # 0
print("float(): ",float()) #0.0
print("str(): ",str()) # '' (blank string)
print("list(): ",list()) # [] (blank list)
print("bool(): ", bool()) # False


# In[38]:


# Normal Integer
i=50
print("Decimal Value:",i)

# converting integer to octal value
o=oct(i)
print("\nOctal Value:",o,", type of o:",type(o)) # number prefixed by 0o (zero and a lowercase "o" or uppercase "O") represents an octal number

# converting integer to hex value
h=hex(i)
print("\nHexadecimal Value:",h,", type of h:",type(h)) # number prefixed by 0x (zero and a lowercase "x" or uppercase "X") represents a hexadecimal number

# converting integer to binary value
b=bin(i)
print("\nBinary Value:",b,", type of b:",type(b)) # number prefixed by 0b (zero and a lowercase "b" or uppercase "B") represents a binary number

# Real & Imaginary Number
x=5+6j
print("\nComplex Number:",x,", type of x:",type(x))

# converting octal to integer value
print("\nOctal to integer: 0o62 is {}".format(0o62))

# converting hex to integer value
print("\nHexadecimal to integer: 0x32 is {}".format(0x32))

# converting binary to integer value
print("\nBinary to integer: 0b110010 is {}".format(0b110010))

# Float numbers representation
print('\nFloat Representation:\n4e8 is {}'.format(4e8))
print('-9.53e18 is {}'.format(-9.53e18))
print('float(nan) is',float('nan'))
print('float(inf) is',float('inf'))
print('float(-inf) is',float('-inf'))

# String representation
print('\nString Representation:\nUnicode: \\u0e21 is {}'.format('\u0e21'))
print('Octal: \\521 is {}'.format('\521'))
print('Hex: \\x521 is {}'.format('\x521'))


# In[39]:


# math library
import math as m # math module is a library of mathematical functions and constants. As keyword is used to define alias.
print("m.sqrt(16): ",m.sqrt(16)) # square root
print("m.pi: ",m.pi) # value of pi
print("m.e: ",m.e,"\n") # value of e

# The help function is used to find more information on math library
help(m.sqrt)


# In[40]:


empty_dict={}
empty_dict


# In[41]:


a= {
    0:"Zero",
    1:"One",
    2:"Two",
    3:"Three",
    4:"Four",
    5:"Five"
}
# 0,1,2, etc are the keys. Zero, One, Two, etc are the values.  
print("a:",a)

b= {
    4:"four",
    5:"five",
    6:"six",
    7:"seven",
    8:"eight"
}
print("b:",b)

a.update(b) # a dictionary is updated with keys & values of dictionary b, only unique values are stored
print("\nAfter Updating Dictionary,\na:",a)


# In[42]:


a= {
    "Text":"String",
    18:"Integer",
    True:"Boolean",
    (1,2,3):"Tuple",
    3.5:"Float",
    3.5:"Float_duplicate" # 3.5 is the duplicate key, the returned value will be the last defined value
}
print("Dictionary a:",a) # Printing order of dictionary is not ordered

b={
    "Name":"Jack",
    "Age":34,
    "Amount":76890.56,
    "Access":False,
    "Address":(22,'ABC','XYZ'),
    "Mobile":[12345,95748,"45225"]
}
print("\nDictionary b:",b)

# Accessing the dictionary elements using keys
print("\nb['Name']:",b['Name'])
print("a[True]:",a[True])

# Adding new Key-Values pairs in dictionary
a["New Key"]="New Value"
b["Software"]="Python"

print("\na.keys():",a.keys()) # retrieving the list of keys of Dictionary A
print("b.values():",b.values()) # retrieving the list of values of Dictionary B
print("a.items():",a.items()) # returns the list of all items (tuples) in dictionary A

# Converting a tuple into dictionary
x=(('a',1),('b',2),('c',3),('d',4),('e',5))
y=dict(x)
print("\nx: ",x,"\nTuple converted into dictionary: ",y)


# In[43]:


# Using pprint library (Pretty Printing) for viewing dictionary neatly
from pprint import pprint as pp
a={
    "Name":"Jack",
    "Age":34,
    "Amount":76890.56,
    "Access":False,
    "Address":(22,'ABC','XYZ'),
    "Mobile":[12345,95748,"45225"]
}
pp(a) # Keys are arranged in a sorted manner


# In[44]:


s1={1,2,3,4,5}
s2={2,5,1,5,3,2,5,3,4,1,2,4,4,5,2,1,1,3} # elements are repeated
print("Set s1: {}".format(s1))
print("Set s2: {} , only unique elements are contained in the set".format(s2))

# Adding an element in set using add()
s1.add(6)
print("\nAfter adding element in List s1: {}".format(s1))

# Removing an element in set using remove()
s1.remove(6)
s1.discard(6) # always succeeds without raising KeyError
print("After removing element in List s1: {}".format(s1))

# Check if element is present in the set
print("6 in s1:",6 in s1)

# Converting a set into list using the list constructor
a={3,4,2,4,3,2,4,1,1,1,4,5,3,4,2,2,3}
b=list(a)
print("\nSet a: ",a,"\nSet coverted into list: ",b)

# Converting a list into set using the set constructor
a=[3,4,2,4,3,2,4,1,1,1,4,5,3,4,2,2,3]
b=set(a)
print("\nList a: ",a,"\nList coverted into set: ",b)


# In[45]:


a={1,2,3,4}
b={3,4,5,6}
c={5,6}
print("a:",a)
print("b:",b)
print("c:",c)

print("\na.union(b):",a.union(b)) # A union B
print("a.intersection(b):",a.intersection(b)) # A intersection B
print("a.symmetric_difference(b):",a.symmetric_difference(b)) # ~(A intersection B), all other uncommon elements
print("a.difference(b):",a.difference(b)) # A prime
print("b.difference(a):",b.difference(a)) # B prime

print("\nset(a).issuperset(c):",set(a).issuperset(c))
print("set(b).issuperset(c):",set(b).issuperset(c))
print("set(c).issubset(a):",set(c).issubset(a))
print("set(c).issubset(b):",set(c).issubset(b))
print("set(c).isdisjoint(a):",set(c).isdisjoint(a))

d={10,20,30,40,20,10,20,30,50}
print("\nd:",d)
d.clear()
print('After Clearing Set:',d)


# In[46]:


a=input("Enter number: ") # input function is used for inputting through keyboard 
print("User entered: {}. It is a string".format(a))
print(type(a)) # result is of string data type

# In order to convert string into number, we can use object constructor int()
b=int(a)
print("\nAfter conversion, {} is a integer".format(b))
print(type(b),'\n')


# In[47]:


# Indentation is critical in order to avoid error

marks= int(input("Enter Marks: ")) # input() is enclosed inside int() which converts string into integer
print("Marks scored: {}".format(marks))

if marks>=75: # if statement
    print("Grade A" ) 
elif marks>=60 and marks<75: # else if statement
    print("Grade B")
else: # else statement
    print("Grade C")


# In[48]:


# range(n) generates a sequence from 0 to n-1
# list(range(n)) is used to represent the range in form of a list

print(range(5), list(range(5))) 
print(range(4,8), list(range(4,8))) 
print(range(1,10,2), list(range(1,10,2))) 


# In[49]:


a=[5,2,6,2,5,1,5] 
for i in a: # iterates over each element in list
    print(i)

print("\n")    
    
a=[5,2,6,2,5,1,5]
for i in range(len(a)): # iterates over each index in list
    print("Element {}: {}".format(i,a[i]))    
    
print("\n")
    
a=[5,2,6,2,5,1,5]
print("Using enumerate,")
for i,k in enumerate(a): # enumerate() yields (index,value) tuples
    print("Element {}: {}".format(i,k))
    
list(enumerate(a)) # enumerate function can also be used directly on the list


# In[50]:


# List Comprehension using for loop

# Method_1
a=[10,20,30,40,50]
print("a: ",a)
b=[]
for i in a:
    b.append((i*10))
print("b: ",b)

# Method_2
a=[10,20,30,40,50]
b=[i*10 for i in a]
print("b: ",b)


# In[51]:


a=[5,2,6,2,5,1,5]
i=0
while i<len(a):
    print("Element {}: {}".format(i,a[i]))
    i=i+1


# In[52]:


# List Comprehension using while loop
# Data cleaning program (list containing numbers and string are filtered)

i=0
x=["String",84.1, "text", 45.32,23,"Number",24,36.4,"Some text", 31]
y=[]
l=len(x)
print("Original list: {}".format(x))

while i < l:
    if isinstance(x[i],int) or isinstance(x[i],float):
        y.append(x[i])
        x.pop(i)
        l-=1
        i-=1
    i=i+1
    
print("\nAfter Data cleaning,\nList with numbers: {}".format(y))
print("List with strings: {}".format(x))  


# In[53]:


for i in range(10):
    if (i==4): 
        continue # element 4 is skipped
    if(i==8):
        break # loop stops as it reaches 8
    print(i)


# In[54]:


# Functions are defined for code-reusability
# Compiling the above code in function

a=["String",84.1, "text", 45.32,23,"Number",24,36.4,"Some text", 31] # Global variable
print("Original list: {}".format(a),"\n")

def data_clean(x): # function declaration
    '''    
    List containing numbers and string are filtered 
    ''' # Documentation of function is enclosed in paragraph
    i=0 
    y=[] # Local variable 
    l=len(x)
    while i < l:
        if isinstance(x[i],int) or isinstance(x[i],float):
            y.append(x[i])
            x.pop(i)
            l-=1
            i-=1
        i=i+1
    return y,x # return statement returns the value 

def sum_list(x):
    '''
    Sum of list elements 
    '''
    sum=0
    for i in x:
        if isinstance(i,int) or isinstance(i, float):
            sum=sum+i
        else: pass # pass statement means do nothing
    return sum

# function calling
d=sum_list(a)   
b,c=data_clean(a)

# On calling the help(), we can see the documentation of the function.
help(data_clean)   
print("Returning function data_clean:",b,c,"\n")

help(sum_list)
print("Returning function sum_list:",d,"\n")


# In[55]:


def add(a,b=5):
    sum=a+b
    return sum

print("Calling function when only one parameter is defined: ",add(3)) # default value for b is taken
print("Calling function when both parameters are defined: ",add(4,8)) # default value is replaced 


# In[56]:


a=[1,2,3,4,5] 
dir(a) # returns the list of all Python's objects classes


# In[57]:


class Human(): # defining class Human
    # attributes
    legs=2
    ears=2
    hands=2
    eyes=2
    
    # function (callable)
    def get_legs(self): # self method is used to refer to the parameters of the instance of a class
        return self.legs
    @property
    def get_ears(self): # property (not a function, hence not callable)
        return self.ears
    
class man(Human): # defining class man, Human is inherited by defining inside parenthesis
    gender='male'
    
class woman(Human): # defining class woman, Human is the parent class
    gender='female'
    
Jon=man() # object created
print("Jon.gender:",Jon.gender)
print("Jon.eyes:",Jon.eyes)
Jon.nose=1
print("Jon.nose:",Jon.nose)
print("Jon.get_legs():",Jon.get_legs()) # parenthesis is required when we are calling the function
print("Jon.get_legs:",Jon.get_legs) # parenthesis is omitted, bound method message appears depicting the function  
print("Jon.get_ears:",Jon.get_ears) # although parenthesis is omitted, bound method message would not appear as '@property' is defined above the method which makes it a property

Jeny=woman()
print("\nJeny.gender:",Jeny.gender)
print("Jeny.hands:",Jeny.hands)


# In[58]:


class Student():
    def __init__(self,name, age, city): # __init__ is a special method used to create an instance
        # Data Attributes for initializing objects
        self.name=name;
        self.age=age;
        self.city=city;
    def details(self):
        print("Name is: ", self.name)
        print("Age is: ",  self.age)
        print("City is: ",self.city)
    def __str__(self): # __str__ is a special method used to return a string representation of an object
        return "| %s | %s | %s |" %(self.name,self.age,self.city)
        
a=Student("James",24,"Dubai")
b=Student("Jack",23,"New York")
c=Student("Julia",24,"Delhi")
d=Student("Jim",21,"California")

a.details()
print("\nb.name:",b.name)
print("c.city:",c.city)
print("d:",d)

# Special method __name__
print()
print(__name__) # Evaluates to '__main__' or the actual module name, depending on how the enclosing module is being used


# In[59]:


class M(object):
    
    def abc(self): # abc is a public function
        print('Use Tab button to see public method!')
        
    def _xyz(self): # xyz is a private function
        print("Private method is not visible while using the Tab button!")
        
m = M()
m.abc()
m._xyz()

print()

class N(M):
    
    def pqr(self): # pqr is a public function
        print('Use Tab button to see public method!')

n=N()
n.abc()
n.pqr()
n._xyz()


# In[60]:


dir(M)


# In[61]:


def histogram(x):
    a=dict()
    for i in x:
        if i not in a:
            a[i]=1
        else:
            a[i]+=1
    return a

# Example_1
s='This is a sample text string'
print("String:",s)

h1=histogram(s)
print("\nHistogram h1:",h1)
print("No. of times 'i' present in h1: %d" %(h1.get('i'))) # fetching a particular frequency of an individual element using get()
print("No. of times 's' present in h1: %d" %(h1.get('s')))

# Example_2
import random as rd
l=[]
for i in range(100):
    k=rd.randint(0,9)
    l.append(k)
print("\nList:",l)
    
h2=histogram(l)
print("\nHistogram h2:",h2)
print("No. of times '3' present in h2: %d" %(h2.get(3)))
print("No. of times '7' present in h2: %d" %(h2.get(7)))


# In[62]:


# Lambda functions are defined when the functions are used very less

# Example 1
a=[1,2,3,4,5]
print("a: ",a)
def expr(x): # some function for calculation
    return ((x**x+x)/x)-x # some expression
print("Result using function:",expr(4))

# the above function can be illustrated using lambda function
a=lambda x:((x**x+x)/x)-x
print("Result using lambda expression:",a(4))

# Example 2
b="This is a sample text"
c=b.split()
print("\nString:",b)
print("After split():",c)
d=' ' # empty string with space
print("Joining list by '%s' using join():" %(d),d.join(c)) # join() is used to join a list of strings using the string d in between its elements (works opposite to the split())
e=' | '
print("Joining list by '%s' using join():" %(e),e.join(c))

# using lambda 
x=lambda a:' '.join(a)
print("Joining list by ' ' using lambda expression:",x(c))

# Example 3
s=lambda x,y:x+y
print('\nCalculating Sum using lambda function:',s(3,4))


# In[63]:


a=[1,2,3,4,5,6,7,8,9]
print("List:",a)

def add_two(x): # function that adds 2 to each element 
    x=x+2
    return x
print("\nFunction is applied to all the elements of list using map():",list(map(add_two,a))) # map() is used to apply the function on the specified sequence

# lambda function is mostly integrated in these cases in order to reduce the complexity of the program 
c=list(map(lambda x:x+2, a))
print("Lambda expression is applied to all the elements of list using map():",c)

def div_3(x):
    if(x%3==0):
        return x
print("\nFunction is applied to the list in order to filter elements using filter():",list(filter(div_3,a))) # filter() is used to filter the elements by applying the function on the particular sequence

# using lambda function
print("Lambda expression is applied to the list in order to filter elements using filter():",list(filter(lambda x: x%3==0,a)))


# In[64]:


# Creating file Test1.txt
with open('Test1.txt','w') as wf: # w represents writing mode, wf is the alias name 
    wf.write("This is a sample test line") # write() is used to write text on file
    wf.write("\nThis is a next line. ")
    wf.write("Continuing last line.")
    
with open('Test1.txt','r') as twf: # r represents reading mode
    print('Writing and Reading text files using write() and read():\n',twf.read(),'\n') # read() is used to read text on file

with open('Test1.txt','a') as twf: # a represents appending in the existing file
    twf.write(" This is the appended text.")
    
with open('Test1.txt','r') as twf: 
    print("Appending text in an existing file using readlines():\n",twf.readlines(),'\n') # readlines() is used to read text on file and returns a list of lines
    
# copying from one file into another    
with open('Test1.txt','r') as rf:
    with open('Test2.txt','w') as wf:
          for line in rf:
                wf.write(line)
                
with open('Test2.txt','r') as twf: 
    print("Copying from one file into another file:\n",twf.readline()) #  readline() is used to read the first line
    print("Reading partial characters:",twf.read(23)) # reading next 23 characters from the last reading position
    print("Moving pointer in the file:",twf.seek(75))
    print("Reading Line:",twf.read())

print("\nName of the file:",twf.name) # fetching the name of file
print("Mode of the file:",twf.mode) # fetching the mode of file
twf.close() # closing file


# In[65]:


# Errors are catched using try & except blocks

# Scenario 1:
try:
    b=34/0
except:
    print('Error! Division by Zero is not possible')
    
# Scenario 2:
try:
    float("Text")
except:
    print('Error! Text cannot be converted into Float datatype')

# Scenario 3:
try:
    'Text'+32
except:
    print('Error! String and Integer cannot be added')


# ### Built-in Exceptions
# 
# 
# <table>
#     <tr>
#         <th>Exception</th>
#         <th>Explanation</th>
#     </tr>
#     <tr>
#         <td>KeyboardInterrupt</td>
#         <td>Raised when user hits Ctrl-C, the interrupt key</td>
#     </tr>
#     <tr>
#         <td>OverflowError</td>
#         <td>Raised when a floating-point expression evaluates to a value that is too large</td>
#     </tr>
#     <tr>
#         <td>ZeroDivisionError</td>
#         <td>Raised when attempting to divide by 0</td>
#     </tr>
#     <tr>
#         <td>IOError</td>
#         <td>Raised when an I/O operation fails for an I/O-related reason</td>
#     </tr>
#     <tr>
#         <td>IndexError</td>
#         <td>Raised when a sequence index is outside the range of valid indexes</td>
#     </tr>
#     <tr>
#         <td>NameError</td>
#         <td>Raised when attempting to evaluate an unassigned identifier (name)</td>
#     </tr>
#     <tr>
#         <td>TypeError</td>
#         <td>Raised when an operation of function is applied to an object of the wrong type</td>
#     </tr>
#     <tr>
#         <td>ValueError</td>
#         <td>Raised when operation or function has an argument of the right type but incorrect value</td>
#     </tr>
#     <tr>
#         <td>KeyError</td>
#         <td>Raised when lookup in a mapping fails</td>
#     </tr>
# </table>

# In[66]:


def convert(s):
    '''Convert to an integer'''
    error=0
    try:
        return int(s)
        print("Conversion Succeeded, x={}".format(x))
    except (ValueError, TypeError) as e:
        print('Conversion Failed: {}'.format(str(e)))
        error=1
        raise # Exceptional conditions can be signaled using raise, without an argument it re-raises the current exception
    finally:
        if error==0:
            print('Successful !!')
        elif error==1:
            print('Error is due to the wrong input: {}'.format(s))
convert(34)


# In[67]:


convert("Thirty") # Throws ValueError


# In[68]:


convert([34,45]) # Throws TypeError


# In[69]:


iterable=['Cow','Hen','Dog','Cat']
iterator=iter(iterable)
print('Iterable List: ',iterable)
print('Iterator:',iterator) # object
print()
while 1:
    try:
        print(next(iterator))
    except StopIteration as e:
        break


# In[70]:


def testgen():
    yield 1
    yield 2
    yield 3
    
g=testgen()
print('Generator:',g) # object
print()
print(next(g)) # works similar to iterator
for each in g: # printing remaining elements
    print(each)


# In[71]:


# Generator Execution

def take(count,iterable):
    ''' Takes item from the front of an iterable
    
    Args:
        count: The maxximum number of items to retrieve
        iterable: The source series
        
    Yields:
        At most 'count' items from an 'iterable'
    '''
    counter=0
    for item in iterable:
        if counter==count:
            return
        counter+=1
        yield item

def distinct(iterable):
    ''' Return unique items by eliminating duplicates
    
    Args:
        iterable: The source series
    
    Yields:
        Unique elements in order from 'iterable'
    '''
    seen=set()
    for item in iterable:
        if item in seen:
            continue
        yield item
        seen.add(item)
    
def run_pipeline():
    items=[3,1,4,1,1,2,5,1,3,6,1,6,1,7,3,1,3,2,4]
    return [item for item in take(5,distinct(items))]

run_pipeline()


# In[72]:


# Defining model specifications

squares=(x*x for x in range(1,int(10e5)))
print('Model:',squares) # returns generator object, saves memory by just defining and not running it
print('Sum of model:',sum(squares))


# In[73]:


a=[1,2,3]
b=[4,5,6]
from itertools import chain
c=chain(a,b) # joining two lists
print('Chain Object:',c) # object
list(c)


# In[74]:


print('all([True,False,False]):',all([True,False,False]))
print('any([True,False,False]):',any([True,False,False]))


# In[75]:


# Used for detecting error in code (for debugging purposes)
import pdb
pdb.set_trace() # used to stop program execution and enter the debugger


# In[ ]:




