Class {
	#name : #TutorialText,
	#superclass : #TutorialItem,
	#instVars : [
		'text',
		'bullets'
	],
	#category : #'TAD2020-Tutorial'
}

{ #category : #accessing }
TutorialText >> bullets [
	^bullets
]

{ #category : #accessing }
TutorialText >> bullets: aString [
	bullets := aString
]

{ #category : #accessing }
TutorialText >> show [
	^[ :a | 
		a text 
			format: [:par | 
				(Text string: title attributes: 
					(Array with: self titleFont with: TextAlignment centered with: TextColor blue) ), 
				(String crlf), 
				(Text string: self subtitle attributes: 
					(Array with: self subTitleFont with: TextAlignment centered with: TextColor blue) ),
				(String crlf), 
				self transformedText   ]].
]

{ #category : #accessing }
TutorialText >> text [
	^ text ifNil: [ '' ]
]

{ #category : #accessing }
TutorialText >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TutorialText >> transformedText [
	self bullets ifNil: [ ^self transformedText: self text ].
	self presentationMode ifFalse: [ ^self transformedText: self text ].
	^self transformedText: self bullets
]

{ #category : #accessing }
TutorialText >> transformedText: aText [
	|richText |
	richText := Text new.
	aText lines do: [ :line |
		| printString bold verbatim |
		printString := line trimBoth.
		bold := nil.
		verbatim := nil.
		(line beginsWith: '-') ifTrue: [
			richText append: ' - '.
			richText addAttribute: (TextAnchor new
				anchoredMorph: GLMUIThemeExtraIcons glamorousRedCircle asMorph;
				yourself) from: richText size -1 to: richText size.
			printString := (line copyFrom: 2 to: line size) trimBoth  ].
		(line beginsWith: '*') ifTrue: [
			bold := richText size.
			printString := (line copyFrom: 2 to: line size) trimBoth  ].
		(line beginsWith: '>') ifTrue: [
			verbatim := richText size.
			printString := (line copyFrom: 2 to: line size) trimBoth  ].
		richText append: printString.
		bold ifNotNil: [ richText makeBoldFrom: (bold max:1) to: richText size ].
		verbatim ifNotNil: [ richText makeColor: Color blue from: (verbatim max: 1) to: richText size ].
		 ] separatedBy: [ richText append: String crlf ].
	richText addAttribute: self bodyFont.
	^richText
]
