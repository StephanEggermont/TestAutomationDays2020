Class {
	#name : #TAD2020Tutorial,
	#superclass : #Tutorial,
	#category : #'TAD2020-Tutorial'
}

{ #category : #public }
TAD2020Tutorial class >> open [
	<example>
	^self browser openOn: self new tutorial
]

{ #category : #accessing }
TAD2020Tutorial class >> title [
	^'Test Automation Days 2020: Debugger Driven Development'
]

{ #category : #'instance creation' }
TAD2020Tutorial >> bottleneck [
	^TutorialText new
	title: 'Bottlenecks';
	text: 
'"Optimize the whole value stream"
- no software is good software

Discuss
- what is limiting your end-to-end cycle time?
- is development or testing your bottleneck?
';
children: #(pharo)

]

{ #category : #tutorial }
TAD2020Tutorial >> debuggerDriven [
	^TutorialText new
	title: 'Debugger driven design';
	text: 
'In Smalltalk, objects know when they don''t
know something. When asked to do that, they
show a debugger explaining that they do not 
understand a message. The debugger supports
adding behavior (and classes) at that moment.

Exercise
Numbers don''t understand the cubed message.
Add a test case class asserting that 2 cubed equals 8.
Run the test and see it fail and open the debugger.
Create the method. Where in the class hierarchy 
should it be added?
';
children: #()
]

{ #category : #'instance creation' }
TAD2020Tutorial >> debuggerDrivenDevelopment [
	^TutorialText new
	title: 'Debugger Driven Development';
	subtitle: 'Feedback done Right';
	text: 
'Fast feedback enables fast learning
Agility needs late binding
The debugger is a design tool

By: 
  Stephan Eggermont @StOnSoftware
  
  (thanks to Diego Lont www.delware.nl)

At: 
  Test Automation Days 2020, Utrecht
';
	yourself

]

{ #category : #tutorial }
TAD2020Tutorial >> exploratoryModeling [
	^TutorialText new
	title: 'Exploratory Modeling';
	text: 
'How to build a model in debugger-driven-design?

Two principles:
- start with the case providing most value, extend with exceptions
- invert time: start with the result

Exercise
Create tests for the following story.
Test Automation Days holds workshops. For these workshops we need:
- participants, who want to attend certain topics.
- presenters, who contribute a workshop or tutorial.
- a location where the workshops takes place.
For this the Test Automation Days  wants a tool to connect all these.
'
]

{ #category : #'instance creation' }
TAD2020Tutorial >> fastFeedback [
	^TutorialText new
	title: 'Fast feedback';
	text: 
'"Fast feedback enables fast learning"

Discuss
- when is that not true
- how fast can you go

'
]

{ #category : #tools }
TAD2020Tutorial >> goalsExercise [
	^ TutorialTestcase new
		title: 'Top-down';
		textTitle: 'TestCase';
		assignment:
'Feature: verify whether the company is sustainable

Given me and my colleague work here
When both of us are happy
Then the company is sustainable

Exercise

Run the test case (glasses icon)
Find the testcase implementation (implementors, browse)
This was just the happy case. Add a testcase verifying 
what happens when I''m not happy. 

This exercise is documented in this tutorial 
as the goalsExercise method of TAD2020Tutorial. 
Document the new testcase, add it as unhappyCase to the  
class and add it to my children
';
		smalltalkClass: VisualizeYourBDD;
		methodSelector: #testCompanyIsSustainable;
		children: #()
]

{ #category : #'instance creation' }
TAD2020Tutorial >> lateBinding [
	^TutorialText new
	title: 'Late binding';
	text: 
'"Agility needs late binding"

With direct manipulation we have the fastest feedback. 
With very late binding we can come close.

Open a playground and do:

TAD2020Morph new openInWorld
browse the TAD2020Morph class

Exercise:
1 Change the titleString to show that it is the 2020 edition.
2 The class has duplication: both drawOn: and step: define the font to use.  
  Add a method titleFont that returns the font, and use that.
  How do you make the changes while keeping the system running?

Discuss:
What are the limits to direct manipulation? 
We need more than just feedback. What?
   
'
]

{ #category : #'instance creation' }
TAD2020Tutorial >> messageSending [
	^TutorialText new
	title: 'Message sending';
	text: 
'A method is called by sending a message to an object,
the message receiver; it returns an object.

Unary message (no arguments)
Array new.
#(1 2 3) size.

Binary message (one argument named by one or more symbol characters)
3 + 4.
''Hello'', '' World''.

Keyword message (one or more arguments inserted in the message name)
''Smalltalk'' allButFirst: 5
3 to: 10 by: 2.

Precedence:
Parentheses > unary > binary > keyword
left to right

Cascading (sent multiple messages to the same receiver)
OrderedCollection new
  add: #abc;
  add: #def;
  add: #ghi.
(the value of the cascade is the value of the last message sent,
send yourself to return the receiver instead)
'
]

{ #category : #'instance creation' }
TAD2020Tutorial >> pharo [
	^TutorialText new
	title: 'Pharo';
	text: 
'Pharo is a Smalltalk
A very simple language, with a large library

Everything is an object
Classes are objects too
Single inheritance between classes
Instance variables are protected
Methods are public
Blocks are lexical closures a.k.a. anonymous methods
Computation happens only via message sends (and variable assignment)
';
	children: #(syntax punctuation messageSending tools);
	yourself

]

{ #category : #'instance creation' }
TAD2020Tutorial >> pullGoals [
	^TutorialText new
	title: 'Pull-based';
	text: 
'"Pull goals into your software"

With outside-in testing (mocking) we can easier
develop top-down, defining the interfaces between
objects (and subsystems) first. 

Discuss:
This gives fast feedback on the expected interface,
and leaves a gap between mock and actual object.
How to deal with that?

';
children: #(goalsExercise)

]

{ #category : #'instance creation' }
TAD2020Tutorial >> punctuation [
	^TutorialText new
	title: 'Punctuation';
	text: 
'"comment"
''string''
#symbol unique string
$a the character a
12 2r1100 16rC twelve in decimal binary and hexadecimal
3.14 1.2e3 floating point numbers
. expression separator
; message cascade
:= assignment
^ return a result from a method
[  :parameter | expression ] code block with a parameter
|foo bar| declaration of two temporary variables
#(abc 123) literal array with the symbol #abc and the number 123
{ foo. 3+2 } dynamic array built from 2 expressions
'
]

{ #category : #tutorial }
TAD2020Tutorial >> rulesXtreamProgramming [
	^TutorialText new
	title: 'Xtreme programming';
	text: 
'Driver
- Writes code to make tests are all green.
- Stops when tests are green.
- Performs tasks navigator asks

Navigator
- Can choose to add test (drives types test)
- Can choose to perform refactoring (driver refactors)
- Helps driver when needed
';
	children: #()
]

{ #category : #tutorial }
TAD2020Tutorial >> sunit [
	^TutorialText new
	title: 'SUnit';
	text: 
'SUnit started the TDD revolution. 
It is a classical xUnit style framework.
Testcases are subclasses from TestCase,
and test methods start their name with test.
setUp and tearDown deal with commonalities for
all test methods.

Exercise:
- browse the testcase class SUnitStartedTheRevolution
  note its test are commented out.
- enable the tests and fix the tests.';
	children: #(debuggerDriven exploratoryModeling)
]

{ #category : #'instance creation' }
TAD2020Tutorial >> syntax [
	^TutorialText new
	title: 'Syntax';
	text: 
'Six reserved words:

nil  the undefined object
true, false  boolean objects
self  the receiver of the current message
super  the receiver in the superclass context
thisContext  the current invocation on the call stack
'
]

{ #category : #tools }
TAD2020Tutorial >> tools [
	^TutorialText new
	title: 'Tools';
	text: 
'Cmd-b  browse a class
Cmd-m  implementors of a method
Cmd-n  senders of a message
shift-Enter  unified search

Editing

Cmd-s  save
Cmd-i  inspect
Cmd-d  do-it

Add a new method/class by overwriting an existing or the template
'
]

{ #category : #tutorial }
TAD2020Tutorial >> tutorial [
	^#(
	#debuggerDrivenDevelopment
	fastFeedback
	bottleneck 
	lateBinding
	whyTDD
	sunit
	pullGoals
)
]

{ #category : #tutorial }
TAD2020Tutorial >> whyTDD [
	^TutorialText new
	title: 'Why Test Driven Development?';
	text: 
'We all know why we make unit tests:
- Low cost to perform --> run on build.
- Reduce risk changes / refactorings do not break code.

Discuss:
- Why write tests first?
';
	children: #(rulesXtreamProgramming)
]
