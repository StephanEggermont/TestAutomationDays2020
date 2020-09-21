Class {
	#name : #DDDPostitSlide,
	#superclass : #GtSlide,
	#instVars : [
		'postitText'
	],
	#category : #'TAD2020-GToolkit'
}

{ #category : #accessing }
DDDPostitSlide >> create [
	^ BlScalableElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChild:
			(BlElement new
				size: 1200 @ 720;
				relocate: 0 @ 0;
					addChild:
					(BlElement new
						size: 431@347;
						padding: (BlInsets all: 20);
						addChild: (BrEditor new
							look: (BrGlamorousEditorLook new lineSpacing: 5);
							margin: (BlInsets all: 50);
							hMatchParent;
							vFitContent;
							text: self postitText;
							beReadOnlyWithSelection);
						look: DDDShadowLook new;
						background: self textPostItYellow;
						transformDo: [ :aTransform |
							aTransform
								translateBy: 100@200;
								origin: (BlAffineTransformationPositionOrigin position: 0@0);
		rotateBy: -12.5; 
		apply]))

]

{ #category : #accessing }
DDDPostitSlide >> postitText [
	^postitText
]

{ #category : #accessing }
DDDPostitSlide >> postitText: aText [
	postitText := aText
]

{ #category : #accessing }
DDDPostitSlide >> textPostItYellow [
	^Color fromHexString: 'F7CF6C'
]
