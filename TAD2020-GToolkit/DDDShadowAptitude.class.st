Class {
	#name : #DDDShadowAptitude,
	#superclass : #BrShadowAptitude,
	#category : #'TAD2020-GToolkit'
}

{ #category : #accessing }
DDDShadowAptitude >> initialize [
	super initialize.
	self addChangeProperty: #(widget effect) withCopy: [ self shadow ].
	shadow := BlGaussianShadowEffect
		color: (Color black alpha: 0.3)
		width: 5
		offset: 1 @ 3
]
