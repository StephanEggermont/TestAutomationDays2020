"
!! Default text slide
I just have positioned text with color and size.
"
Class {
	#name : #DDDSlide,
	#superclass : #GtSlide,
	#instVars : [
		'positionedElements'
	],
	#category : #'TAD2020-GToolkit'
}

{ #category : #accessing }
DDDSlide >> colorPostitYellow [
	^Color fromHexString: 'F7CF6C'
]

{ #category : #accessing }
DDDSlide >> colorTextGray [
	^Color fromHexString: '535353'
]

{ #category : #accessing }
DDDSlide >> colorTextRed [
	^(Color fromHexString: 'EB3D44')
]

{ #category : #accessing }
DDDSlide >> create [
	^ BlScalableElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChild:
			(BlElement new
				size: 1200 @ 720;
				relocate: 0 @ 0;
				addChildren:self positionedElements);
		yourself
]

{ #category : #accessing }
DDDSlide >> initialize [
	super initialize.
	positionedElements := OrderedCollection new
]

{ #category : #accessing }
DDDSlide >> newText: aString size: aSize color: aColor at: aPosition [
	|attr|
	attr := {
		BlFontFamilyAttribute named: 'Gillius'.
		BlFontWeightAttribute light.
		BlFontSizeAttribute size: aSize.
		BlTextForegroundAttribute paint: aColor.
	}.
	self positionedElements add: (BrEditor new
		relocate: aPosition;
		look: (BrGlamorousEditorLook new lineSpacing: 5);
		margin: (BlInsets all: 50);
		text: (aString asRopedText attributes: attr);
		beReadOnlyWithSelection)
]

{ #category : #accessing }
DDDSlide >> positionedElements [
	^positionedElements
]
