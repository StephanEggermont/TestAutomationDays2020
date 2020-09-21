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
	areaScale := (anExtent dist: 0@0) / (originalExtent dist: 0@0).
	self radius: areaScale * self radius.
	self center: aScale * self center.
	self originalExtent: anExtent.
	Transcript traceCr: anExtent printString, ' - ', radius printString, ' - ', center printString
]

{ #category : #accessing }
BlScalingRadialGradientPaint >> originalExtent [
	^originalExtent
]

{ #category : #accessing }
BlScalingRadialGradientPaint >> originalExtent: anExtent [
	originalExtent := anExtent
]
