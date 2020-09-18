Class {
	#name : #TutorialExercise,
	#superclass : #TutorialItem,
	#instVars : [
		'text',
		'textTitle',
		'presentation',
		'smalltalkClass',
		'assignment',
		'target',
		'methodSelector'
	],
	#category : #'TAD2020-Tutorial'
}

{ #category : #accessing }
TutorialExercise >> assignment [
	^ assignment
]

{ #category : #accessing }
TutorialExercise >> assignment: anObject [
	assignment := anObject
]

{ #category : #accessing }
TutorialExercise >> browser [
	| browser |
	browser := GLMTabulator new.
	browser column: [ :c | c row: #main; row: #source ] span: 2;
		column: #assignment.
	browser transmit to: #main; andShow: [ :b |
		b custom: self presentation ].
	browser transmit to: #source; andShow: [ :b |
		self showSourceOn: b ].
	browser transmit from: #source port: #acceptedCode; to: #main; andShow: [ :a | 
		a dynamic with: [:some :selection | self parseCode: selection some: some ] ].
	browser transmit to: #assignment; andShow: [ :b |
		b text
		display: self assignment;
		format: [ :par | (Text string: title attribute: (TextFontChange font4)), (String crlf), 
			(self transformedText: par) ] ].
	browser startOn: self target.
	^browser
]

{ #category : #initialization }
TutorialExercise >> buildText [
	| source startIndex stopIndex |
	source := (self smalltalkClass methodDict at: self methodSelector)
		sourceCode.
	startIndex := source findString: '"start exercise'.
	startIndex <= 0
		ifTrue: [ ^ source ].
	stopIndex := source findString: '"stop exercise"'.
	stopIndex <= startIndex
		ifTrue: [ ^ source ].
	^ String
		streamContents: [ :s | 
			| first |
			first := true.
			(source copyFrom: startIndex + 15 to: stopIndex - 1)
				linesDo: [ :line | 
					first
						ifTrue: [ line
								ifNotEmpty: [ s
										nextPutAll: line allButLast;
										crlf.
									first := false ] ]
						ifFalse: [ s
								nextPutAll: line;
								crlf ] ] ]
]

{ #category : #actions }
TutorialExercise >> createSourceFrom: aText [
	| source startIndex stopIndex |
	source := (self smalltalkClass methodDict at: self methodSelector)
		sourceCode.
	startIndex := source findString: '"start exercise'.
	startIndex <= 0
		ifTrue: [ ^ aText ].
	stopIndex := source findString: '"stop exercise"'.
	stopIndex <= startIndex
		ifTrue: [ ^ aText ].
	^ String
		streamContents: [ :s | 
			| first |
			s
				nextPutAll: (source copyFrom: 1 to: startIndex + 15);
				crlf.
			first := true.
			aText asString
				linesDo: [ :line | 
					s nextPutAll: line.
					first
						ifTrue: [ s nextPut: $".
							first := false ].
					s crlf ].
			s nextPutAll: (source copyFrom: stopIndex to: source size) ]
]

{ #category : #accessing }
TutorialExercise >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
TutorialExercise >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #actions }
TutorialExercise >> parseCode: aText some: some [
	self smalltalkClass compile: (self createSourceFrom: aText) string classified: #exercise.
	presentation := nil.
	^some custom: self presentation
]

{ #category : #accessing }
TutorialExercise >> presentation [
	^presentation ifNil: [ presentation := self smalltalkClass new perform: self methodSelector ]
]

{ #category : #accessing }
TutorialExercise >> presentation: aBrowser [
	presentation := aBrowser
]

{ #category : #accessing }
TutorialExercise >> show [
	^[ :a | a custom: self browser ]
]

{ #category : #accessing }
TutorialExercise >> showSourceOn: pane [
	| tag |
	self smalltalkClass
		ifNil: [ tag := pane text ]
		ifNotNil: [ tag := pane pharoMethod
			smalltalkClass: self smalltalkClass;
			populate: #acceptedCode icon: GLMUIThemeExtraIcons glamorousAccept on: $s entitled: 'Accept' with: [ :bla | bla text ] ].
	tag
		title: self textTitle;
		display: self text.
	^tag 
]

{ #category : #accessing }
TutorialExercise >> smalltalkClass [
	^ smalltalkClass
]

{ #category : #accessing }
TutorialExercise >> smalltalkClass: anObject [
	smalltalkClass := anObject
]

{ #category : #accessing }
TutorialExercise >> target [
	^ target ifNil: [ 1 ]
]

{ #category : #accessing }
TutorialExercise >> target: anObject [
	target := anObject
]

{ #category : #accessing }
TutorialExercise >> text [
	^ text ifNil: [ text := self buildText ]
]

{ #category : #accessing }
TutorialExercise >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TutorialExercise >> textTitle [
	textTitle ifNil: [ ^'Description' ].
	^ textTitle
]

{ #category : #accessing }
TutorialExercise >> textTitle: anObject [
	textTitle := anObject
]

{ #category : #accessing }
TutorialExercise >> transformedText: aText [
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
