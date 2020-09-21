Class {
	#name : #DDDTitleSlide,
	#superclass : #GtSlide,
	#instVars : [
		'title',
		'subtitle',
		'postIt',
		'fileReference',
		'maxScale'
	],
	#category : #'TAD2020-GToolkit'
}

{ #category : #'api - instantiation' }
DDDTitleSlide >> create [
	^ BlScalableElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChild:
			(BlElement new
				size: 1200 @ 720;
				relocate: 0 @ 0;
					addChild: self textElements)
				
]

{ #category : #accessing }
DDDTitleSlide >> fileReference [
	^fileReference
]

{ #category : #accessing }
DDDTitleSlide >> fileReference: aStringOrFileReference [
	fileReference := aStringOrFileReference asFileReference 
]

{ #category : #initialization }
DDDTitleSlide >> initialize [
	super initialize.
	self title: ''.
	self subtitle: ''.
	maxScale := 1.

]

{ #category : #'api - instantiation' }
DDDTitleSlide >> maxScale [
	^maxScale
]

{ #category : #'api - instantiation' }
DDDTitleSlide >> maxScale: aNumber [
	maxScale := aNumber
]

{ #category : #accessing }
DDDTitleSlide >> redColor [
	^Color fromHexString: 'EB3D44'
]

{ #category : #accessing }
DDDTitleSlide >> subtitle: aString [
	subtitle := aString asRopedText fontSize: 20; glamorousRegularFont
]

{ #category : #accessing }
DDDTitleSlide >> subtitleText: aText [
	subtitle := aText
]

{ #category : #'api - instantiation' }
DDDTitleSlide >> textElements [
	| form |
	form := PNGReadWriter formFromFileNamed: self fileReference fullName.
	^ BlElement new
		background: Color transparent;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			c linear vertical alignCenter ];
		layout: BlLinearLayout vertical;
		addChild:
			(BlTextElement new
				constraintsDo: [ :c | c linear horizontal alignCenter ];
				padding:
					(BlInsets
						top: 40;
						bottom: 10);
				text: title);
		addChild:
			(BlTextElement new
				constraintsDo: [ :c | c linear horizontal alignCenter ];
				text: subtitle);
		addChild: ((BlElement new 
				constraintsDo: [ :c | c linear horizontal alignCenter ];
			size: form extent;
			background: (BlImageBackground new image: form)) asScalableElement maxScale: self maxScale)
]

{ #category : #accessing }
DDDTitleSlide >> title: aString [
	title := aString asRopedText fontSize: 30; glamorousRegularFont
]

{ #category : #accessing }
DDDTitleSlide >> titleText: aText [
	title := aText
]
