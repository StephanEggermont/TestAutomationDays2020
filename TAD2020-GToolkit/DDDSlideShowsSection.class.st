Class {
	#name : #DDDSlideShowsSection,
	#superclass : #GtHomeSection,
	#category : #'TAD2020-GToolkit'
}

{ #category : #accessing }
DDDSlideShowsSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Debugger Driven Development').
	cardsContainer := self newCardsContainer.
	cardsContainer addChild: (self 
		newShowCardWithTitle: 'DDD' 
		slideshow: [ DDDPresentation  new create ]
		description: 'On the value of fast feedback for the development process').
	cardsContainer addChild: (self
		newShowCardWithTitle: 'Pharo 101'
		slideshow: [ GtPharo101 new create ]
		description: 'New to Pharo? Take an introductory tutorial.').
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
