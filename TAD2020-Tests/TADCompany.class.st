"
Starting BDD from the goals down. The company wants to be sustainable
"
Class {
	#name : #TADCompany,
	#superclass : #Object,
	#instVars : [
		'employees'
	],
	#category : #'TAD2020-Tests'
}

{ #category : #accessing }
TADCompany class >> employees: aCollection [
	^self new
		employees: aCollection;
		yourself
]

{ #category : #accessing }
TADCompany >> employees [
	^ employees
]

{ #category : #accessing }
TADCompany >> employees: aCollection [
	employees := aCollection
]

{ #category : #testing }
TADCompany >> isSustainable [
	^employees noneSatisfy: [ :employee | employee isHappy not ] 
]
