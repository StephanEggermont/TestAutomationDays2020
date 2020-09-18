Class {
	#name : #Tutorial,
	#superclass : #Object,
	#instVars : [
		'root',
		'presentationMode'
	],
	#category : #'TAD2020-Tutorial'
}

{ #category : #accessing }
Tutorial class >> browser [
	^((self new)
		presentationMode: false;
		browser) title: self title; 
		yourself
]

{ #category : #accessing }
Tutorial class >> browser: aBoolean [
	^((self new)
		presentationMode: aBoolean;
		wizard) title: self title; 
		yourself
]

{ #category : #public }
Tutorial class >> open [
	^self browser openOn: self new tutorial
]

{ #category : #public }
Tutorial class >> openPresentation [
	|browser|
	browser := (self browser: true) openOn: self new tutorial.
	browser 
		 configureForEmbedding;
		 bounds: (RealEstateAgent maximumUsableAreaInWorld: World).
	^browser
]

{ #category : #accessing }
Tutorial class >> title [
	^'Tutorial'
]

{ #category : #accessing }
Tutorial >> browser [
	"self new browser openOn: GLMBasicExamples"

	| browser |
	browser := GLMTabulator new.
	browser
		column: #titles;
		column: #example span: 3.
	browser transmit
		to: #titles;
		andShow: [ :a | a tree
				display: [ :aSymbolArray | aSymbolArray ];
				children: [ :aSymbol | (self perform: aSymbol) children];
				format: [ :aSymbol | (self perform: aSymbol) title]].
	browser transmit
		to: #example;
		from: #titles;
		andShow: [ :a | a dynamic with: [:some :selection |
				(self presentationFor: selection) show value: some]  ].
	^ browser
]

{ #category : #accessing }
Tutorial >> presentationFor: aSymbol [
	^(self perform: aSymbol)
		presentationMode: self presentationMode;
		yourself
]

{ #category : #accessing }
Tutorial >> presentationMode [
	presentationMode ifNil: [ ^false ].
	^presentationMode
]

{ #category : #accessing }
Tutorial >> presentationMode: aBoolean [
	presentationMode := aBoolean
]

{ #category : #accessing }
Tutorial >> wizard [
	"self new browser openOn: GLMBasicExamples"

	| browser column|
	browser := GLMTabulator new.
	column := browser
		column: #titles span: 0.
	browser column: #example span: 4.
	browser transmit
		to: #titles;
		andShow: [ :a | a tree
				display: [ :aSymbolArray | aSymbolArray ];
				children: [ :aSymbol | (self perform: aSymbol) children];
				format: [ :aSymbol | (self perform: aSymbol) title];
				act: [:b | column span: 1. browser update.
 ] on: $/ entitled: 'Global action with shortcut';
				act: [:b | browser close
 ] on: $q entitled: 'Close'.
].
	browser transmit
		to: #example;
		from: #titles;
		andShow: [ :a | a dynamic with: [:some :selection |
				(self presentationFor: selection) show value: some]  ].
	^ browser
]
