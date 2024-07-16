Class {
	#name : #BlScalingRadialGradientPaint,
	#superclass : #BlRadialGradientPaint,
	#instVars : [
		'originalExtent'
	],
	#category : #'TAD2020-GToolkit'
}

{ #category : #accessing }
BlScalingRadialGradientPaint >> matchExtent: anExtent [
	| aScale areaScale |
	anExtent isZero
		ifTrue: [ ^ self ].
	originalExtent ifNil: [ ^ self ].
	aScale := self originalExtent / anExtent.
	areaScale := (anExtent distanceTo: 0@0) / (originalExtent distanceTo: 0@0).
	self radius: areaScale * self radius.
	self center: aScale * self center.
	self originalExtent: anExtent.

]

{ #category : #accessing }
BlScalingRadialGradientPaint >> originalExtent [
	^originalExtent
]

{ #category : #accessing }
BlScalingRadialGradientPaint >> originalExtent: anExtent [
	originalExtent := anExtent
]
