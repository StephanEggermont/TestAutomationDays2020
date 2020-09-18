Class {
	#name : #TutorialItem,
	#superclass : #Object,
	#instVars : [
		'title',
		'subtitle',
		'children',
		'childClass',
		'presentationMode'
	],
	#category : #'TAD2020-Tutorial'
}

{ #category : #accessing }
TutorialItem >> bodyFont [
	self presentationMode ifTrue: [ ^self fontWithSize: 18 ].
	^self fontWithSize: StandardFonts codeFont pointSize
]

{ #category : #accessing }
TutorialItem >> childClass [
	^ childClass
]

{ #category : #accessing }
TutorialItem >> childClass: anObject [
	childClass := anObject
]

{ #category : #accessing }
TutorialItem >> children [
	^ children
]

{ #category : #accessing }
TutorialItem >> children: anObject [
	children := anObject ifNil: [children := OrderedCollection new]
]

{ #category : #accessing }
TutorialItem >> fontWithSize: aSize [
	^TextFontReference toFont: (LogicalFont familyName: 'Helvetica Neue' pointSize: aSize)
]

{ #category : #accessing }
TutorialItem >> presentationMode [
	^ presentationMode
]

{ #category : #accessing }
TutorialItem >> presentationMode: aBoolean [ 
	presentationMode := aBoolean
]

{ #category : #accessing }
TutorialItem >> show [
	^[ :a | 
		a text 
			format: [:par | (Text string: self title attribute: self titleFont) ]].
]

{ #category : #accessing }
TutorialItem >> subTitleFont [
	self presentationMode ifTrue: [ ^self titleFontWithSize: 24 ].
	^self fontWithSize: StandardFonts codeFont pointSize+2
]

{ #category : #accessing }
TutorialItem >> subtitle [
	^ subtitle ifNil: [ '' ]
]

{ #category : #accessing }
TutorialItem >> subtitle: anObject [
	subtitle := anObject
]

{ #category : #accessing }
TutorialItem >> title [
	^ title
]

{ #category : #accessing }
TutorialItem >> title: anObject [
	title := anObject
]

{ #category : #accessing }
TutorialItem >> titleFont [
	self presentationMode ifTrue: [ ^self titleFontWithSize: 36 ].
	^self fontWithSize: StandardFonts codeFont pointSize+4
]

{ #category : #accessing }
TutorialItem >> titleFontWithSize: aSize [
	^TextFontReference toFont: (LogicalFont familyName: 'Helvetica Neue' pointSize: aSize)
]
