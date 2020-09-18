"
A visual object showing how life editing can be done
"
Class {
	#name : #TAD2020Morph,
	#superclass : #Morph,
	#instVars : [
		'textColor'
	],
	#category : #'TAD2020-Tests'
}

{ #category : #initialize }
TAD2020Morph >> defaultBounds [
"answer the default bounds for the receiver"
	^ 0 @ 0 corner: 130 @ 30
]

{ #category : #initialize }
TAD2020Morph >> defaultColor [
	^ Color yellow
]

{ #category : #initialize }
TAD2020Morph >> defaultTextColor [
	^ Smalltalk ui theme textColor. 

]

{ #category : #drawing }
TAD2020Morph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	aCanvas drawString: self titleString
		in: (self bounds insetBy: (Margin left: 4 top: 6 right: 2 bottom: 2)) 
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10)
		color: self defaultTextColor. 

]

{ #category : #'stepping and presenter' }
TAD2020Morph >> step [
	self width:
		( (LogicalFont familyName: 'Source Sans Pro' pointSize: 10) widthOfString: self titleString) + 8.
	" try increasing the translation vector "
	self bounds: (self bounds translateBy: 1 @ 1).
	" try changing this bound "
	self bounds left < 0
		ifTrue: [ self position: 0 @ 0 ].
	" try changing this bound "
	self bounds left > 500
		ifTrue: [ self position: 0 @ 0 ]

	"	What does this example code? "
	"
	(World submorphs detect: [ :each | (each ~= self) and: [ each visible and: [
				each extension locked not and: [ each intersects: self bounds ] ] ] ]
		ifNone: [ nil ])
		ifNotNil: [ :m | 
			self position: 0@0  ]
"
]

{ #category : #'model - stepping' }
TAD2020Morph >> stepTime [
	^ 200
]

{ #category : #accessing }
TAD2020Morph >> textColor: aColor [ 
	textColor := aColor
]

{ #category : #drawing }
TAD2020Morph >> titleString [
	^'Test Automation Days'

]
