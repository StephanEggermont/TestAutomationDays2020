Class {
	#name : #DDDSlideShow,
	#superclass : #GtSlideShow,
	#category : #'TAD2020-GToolkit'
}

{ #category : #'api - instantiation' }
DDDSlideShow >> create [ 
	|container backgroundElement|
	container := super create.
	container background: Color transparent. 
	backgroundElement := BlElement new 
		constraintsDo: [:c | c horizontal matchParent. c vertical matchParent ];
		background: (BlScalingRadialGradientPaint new
			stops:
				{(0.0 -> (Color r: 246 g: 248 b: 250 range: 255)).
				
				(0.9 -> (Color r: 240 g: 242 b: 246 range: 255)).
				(1.0 -> (Color r: 210 g: 214 b: 218 range: 255))};
			center: 512@384;
			radius: 640;
			originalExtent: 1024 @ 768;
		yourself).
	backgroundElement addChild: container.
	^backgroundElement
]
