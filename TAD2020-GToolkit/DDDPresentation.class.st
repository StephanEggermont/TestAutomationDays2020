Class {
	#name : #DDDPresentation,
	#superclass : #BrStencil,
	#category : #'TAD2020-GToolkit'
}

{ #category : #accessing }
DDDPresentation >> bddSlide [
	^(GtTextSlide new
				newTextWithFormat:(
'Adoption of BDD is low because
Convincing team members to do BDD is difficult
Lack of experience leads to poorly written scenarios
Duplications in BDD scenarios cause performance issues
Specifications become difficult to change for fault correction
Need to maintain new BDD tests increases software development time
Cost of product maintenance becomes higher'
						asRopedText
						glamorousRegularFont;
						fontSize: 18))
]

{ #category : #accessing }
DDDPresentation >> colorPostitYellow [
	^Color fromHexString: 'F7CF6C'
]

{ #category : #accessing }
DDDPresentation >> colorTextGray [
	^Color fromHexString: '535353'
]

{ #category : #accessing }
DDDPresentation >> colorTextRed [
	^(Color fromHexString: 'EB3D44')
]

{ #category : #accessing }
DDDPresentation >> commitsLateSlide [
	^DDDSlide new
		newText: 'GToolkit commits late' asUppercase size: 80 color: self colorTextGray at: 100@200;
		newText: 
'• Compile at Runtime
• Object decides what to do with a message
• Visibility of System State
• Example (test) Driven Design' size: 64 color: self colorTextGray at: 100@350
]

{ #category : #'api - instantiation' }
DDDPresentation >> create [
	| slideshow |
	slideshow := DDDSlideShow new.
	slideshow
		slides:
			{self titleSlide.self gettingStartedSlide.
			self whyGtoolkit.self softwareGrows.self technicalDebt.
			self whatCanWeDoSlide.
			self cynefinSlide.
			self experimentsSlide.
			self realOptionsSlide.
			self commitsLateSlide.
			self smallIsBeautifulSlide.
			self gtoolkitIsSmall.
			self wardleySlide.
			self imageSlide.
			self bddSlide.
			self visualizingTheCode.
			self integratingStoryTelling.
			self pharo101Slide.
			self feedbackInTheDebugger}.
	^ slideshow makeArrowsVisible
]

{ #category : #accessing }
DDDPresentation >> cynefinSlide [
	^DDDSlide new
		newText: 'CYNEFIN' size: 250 color: self colorTextGray at: 100@200;
		newText: 'Run multiple safe-to-fail experiments' size: 51 color: self colorTextRed at: 350@400
]

{ #category : #accessing }
DDDPresentation >> descriptionString: aString [
	^ aString asRopedText glamorousRegularFont; fontSize: 20.
]

{ #category : #accessing }
DDDPresentation >> experimentsSlide [
	^DDDSlide new
		newText: 'Experiments in GToolkit' asUppercase size: 80 color: self colorTextGray at: 100@200;
		newText: 
'• Fast Feedback
• Adaptable Tools
• Visibility of System State
• Late Binding' size: 64 color: self colorTextGray at: 100@350
]

{ #category : #'api - instantiation' }
DDDPresentation >> feedbackInTheDebugger [
	^ GtTextAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Feedback in the Debugger');
		newTextWithFormat:
			(self
				descriptionString:
					'These are all numbers: 2, 42, 2/84. And they all respond to various messages evaluating mathematical expressions.');
		element: [ GtPlaygroundSlide new
				snippets: {'40 + 2.' . '42 factorial.' . '2/84.' . '42 class maxVal.'};
				asElement ];
		elementWeight: 0.6
]

{ #category : #accessing }
DDDPresentation >> gettingStartedSlide [
	^ GtTextAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Getting started' );
		newTextWithFormat:
			(self
				descriptionString:
					'Install the workshop in the image, and switching to the Pharo style exercises');
		element: [ GtPlaygroundSlide new
				snippets: {' Metacello new
	githubUser: ''StephanEggermont'' project: ''TestAutomationDays2020'' commitish: #master path: ''src'';
	baseline: ''TAD2020'' ;
	load.' . 'PharoLightTheme beCurrent' . 'TAD2020Tutorial open' . 'GTPlayground open'.'GTGenericStackDebugger register'.'GtMoldableDebugger register'};
				asElement ];
		elementWeight: 0.7	
]

{ #category : #accessing }
DDDPresentation >> gtoolkitIsSmall [
^DDDSlide new
		newText: 'GToolkit is Small' asUppercase size: 80 color: self colorTextGray at: 100@200;
	newText: '• Simple Language
• Bootstrapped image ~ 200KB
• Everything is an Object, Message Passing
• Constant Refactoring' size: 64 color: self colorTextGray at: 100@350
]

{ #category : #accessing }
DDDPresentation >> imageDirectory [
	^(IceRepository registeredRepositoryIncludingPackage: self class package) location /'images'
]

{ #category : #accessing }
DDDPresentation >> imageSlide [
	^(GtFilePictureSlide new 
		fileReference:self imageDirectory / 'feature-moldable.png';
	background: Color transparent)
	
]

{ #category : #accessing }
DDDPresentation >> integratingStoryTelling [
	^ GtTextAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Integrating Story Telling');
		newTextWithFormat:
			(self
				descriptionString:
'To keep a system alive over the longer term, certain aspects of the system need to be explained. 
That explanation can not only be verbally. Keeping those explanations up to date with the development
of the system is challenging. We propose to integrate it in the development environment, making it 
suitable for presenting the system, demonstrating design decisions, and teaching the system to new 
developers');
		element: [ GtPlaygroundSlide new
				snippets: {
'| view |
view := GtMondrian new.
view nodes
	shape: [ 
		BlElement new
			border: (BlBorder paint: Color gray width: 1);
			constraintsDo: [ :c |
				c padding: (BlInsets all: 5) ] ]; 
	with: (GtSlide withAllSubclasses);
	"Builds the content of each class shape."
	forEach: [ :aClass |
		view nodes
			shape: [ :aMethod | 
				BlElement new
					size: (5 max: 2* aMethod linesOfCode) @ (5 max: 2* aMethod numLiterals);
					background: aMethod linesOfCode > 10 ifTrue: [Color red] ifFalse: [Color green];
					border: (BlBorder paint: Color blue width: 1) ];
			with: aClass methods.
		view layout grid].
view edges
	fromRightCenter;
	toLeftCenter;
	connectToAll: #subclasses.
view layout horizontalTree.
^ view '};
				asElement ];
		elementWeight: 0.6
]

{ #category : #'api - instantiation' }
DDDPresentation >> pharo101Slide [
	^ GtSlideshowSlide new
		textWithFormat:
			'Want to learn more about the Pharo syntax? Follow the show below'
				asRopedText glamorousRegularFont;
		slideshow: [ GtPharo101 new create ] withTitle: 'Pharo101'
]

{ #category : #accessing }
DDDPresentation >> realOptionsSlide [
	^DDDSlide new
		newText: 'Real Options' asUppercase size: 140 color: self colorTextGray at: 100@200;
		newText: 'Never commit early unless you know why' size: 32 color: self colorTextRed at: 520@320
]

{ #category : #accessing }
DDDPresentation >> slideTitleTextAttributes [
	^{
		BlFontFamilyAttribute named: 'Gillius'.
		"BlFontWeightAttribute light.
		"BlFontSizeAttribute size: 70.
		BlTextSpacingAttribute spacing: 100.
		BlTextForegroundAttribute paint: (Color fromHexString: '535353').
}
]

{ #category : #accessing }
DDDPresentation >> smallIsBeautifulSlide [
	^DDDSlide new
		newText: 'Small' asUppercase size: 58 color: self colorTextRed at: 200@200;
		newText: 'Is beautiful' asUppercase size: 64 color: self colorTextGray at: 100@250
]

{ #category : #accessing }
DDDPresentation >> softwareGrows [
	^DDDSlide new
		newText: 'Software' size: 42 color: self colorTextRed at: 120@200;
		newText: 'GROWS' size: 280 color: self colorTextGray at: 100@250
]

{ #category : #accessing }
DDDPresentation >> subTitleTextAttributes [
	^{
		BlFontFamilyAttribute named: 'Gillius'.
		BlFontWeightAttribute light.
		BlFontSizeAttribute size: 25.
		BlTextForegroundAttribute paint: ((Color fromHexString: 'EB3D44')).
}
]

{ #category : #accessing }
DDDPresentation >> subTitleTextAttributesBlack [
	^{
		BlFontFamilyAttribute named: 'Gillius'.
		BlFontWeightAttribute light.
		BlFontSizeAttribute size: 25.
		BlTextForegroundAttribute paint: ((Color fromHexString: '222222')).
}
]

{ #category : #accessing }
DDDPresentation >> subtitleString: aString [
	^ aString asRopedText glamorousRegularFont; fontSize: 40.
]

{ #category : #'api - instantiation' }
DDDPresentation >> successSlide [
	^DDDSlide new
		newText: 'Succes' size: 40 color: Color black at: 100@200

]

{ #category : #accessing }
DDDPresentation >> technicalDebt [
	^DDDSlide new
		newText: 'And' size: 38 color: self colorTextRed at: 147@200;
		newText: 'SUCCESFULL SOFTWARE HAS TECHNICAL DEBT' size: 87 color: self colorTextGray at: 100@250
]

{ #category : #accessing }
DDDPresentation >> titleSlide [
	|sub ti form|
	form := PNGReadWriter formFromFileNamed: self imageDirectory / 'feature-moldable.png'.
	sub := 'Feedback done Right - Stephan Eggermont - Test Automation Days 2020' asRopedText.
	sub attributes: self subTitleTextAttributes from: 1 to: 21.
	sub attributes: self subTitleTextAttributesBlack from: 22 to: 67.
	ti :=('Debugger Driven Development' asRopedText
				attributes: self slideTitleTextAttributes
				from: 1 to: 27).
	^ GtLabelAndElementSlide new
		newTextWithFormat: ti;
		newTextWithFormat: sub;
		element: [(BlElement new 
		size: form extent;
		background: (BlImageBackground new image: form)) asScalableElement maxScale: 1]
	
]

{ #category : #accessing }
DDDPresentation >> visualizingTheCode [
	^ GtLabelAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Visualizing the Code');
		newTextWithFormat:
			(self
				descriptionString:
					'Some quality attributes of the code we are writing are much easier to see in a simple visualization of it. Here we show the definition of different kinds of slides.');
		element: [ GtPlaygroundSlide new
				snippets: {'| view |
view := GtMondrian new.
view nodes with: (GtSlide withAllSubclasses).
view'.

'| view |
view := GtMondrian new.
view nodes
	shape: [ 
		BlElement new
			border: (BlBorder paint: Color gray width: 1);
			constraintsDo: [ :c |
				c padding: (BlInsets all: 5) ] ]; 
	with: (GtSlide withAllSubclasses);
	"Builds the content of each class shape."
	forEach: [ :aClass |
		view nodes
			shape: [ :aMethod | 
				BlElement new
					size: (5 max: 2* aMethod linesOfCode) @ (5 max: 2* aMethod numLiterals);
					background: (aMethod linesOfCode > 10 ifTrue: [Color red] ifFalse: [Color green]);
					border: (BlBorder paint: Color blue width: 1) ];
			with: aClass methods.
		view layout grid].
view edges
	fromRightCenter;
	toLeftCenter;
	connectToAll: #subclasses.
view layout horizontalTree.
^ view '};
				asElement ]
]

{ #category : #accessing }
DDDPresentation >> wardleySlide [
	^(GtTextSlide new
				newTextWithFormat:(
'The technology development model by Simon Wardley shows that
the area where we should be doing our own development is the area where
there is a lot of uncertainty. '
						asRopedText
						glamorousRegularFont;
						fontSize: 18))
]

{ #category : #accessing }
DDDPresentation >> whatCanWeDoSlide [
	^(DDDPostitSlide new) postitText: ('What can
we do?' asRopedText fontSize: 95; foreground: Color white; fontName: 'Gillius')
]

{ #category : #accessing }
DDDPresentation >> whyGtoolkit [
	^DDDSlide new
		newText: 'WHY GTOOLKIT' size: 150 color: self colorTextGray at: 20@200;
		newText: 'Combat Complexity' size: 81 color: self colorTextRed at: 426@333
]
