Class {
	#name : #VisualizeYourBDD,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'me',
		'company',
		'colleague'
	],
	#category : #'TAD2020-Tests'
}

{ #category : #initialization }
VisualizeYourBDD >> setUp [
	me := protocol mock: 'Me'.
	colleague := protocol mock: 'Colleague'.
	
	company := TADCompany employees: {me. colleague}.
		
	protocol visualize: company.
]

{ #category : #exercise }
VisualizeYourBDD >> testCompanyIsSustainable [
	protocol describe
		allow: me recv: #isHappy; => true;
		allow: colleague recv: #isHappy; => true.
	company isSustainable
]
