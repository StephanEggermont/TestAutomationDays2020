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
		description: 'On the Value of Fast Feedback for the Development Process').
	cardsContainer addChild: (self
		newShowCardWithTitle: 'Pharo 101'
		slideshow: [ GtLiveShow createWithArrowsVisible: GtPharo101 new ]
		description: 'New to Pharo? Take an introductory tutorial.').
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

{ #category : #accessing }
DDDSlideShowsSection >> newShowCardWithTitle: aString slideshow: aSlideShowBlock description: aDescription [
	^ self
		newHeaderCardWithTitle: 'Slideshow'
		description: aDescription
		size: 200@150
		content:
			(aSlideShowBlock value slides first create
				size: 1200@720;
				padding: (BlInsets all: 10);
				beInSingleCompositionLayer) asScalableElement
		action: [ :card | 
			self
				showSpaceWithTitle: aString
				with: aSlideShowBlock value makeArrowsVisible
				from: card ]
]
