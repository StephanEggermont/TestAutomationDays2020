Class {
	#name : #DDDPresentation,
	#superclass : #BrStencil,
	#category : #'TAD2020-GToolkit'
}

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
			self cynefinSlide.self experimentsSlide.
			self realOptionsSlide.self commitsLateSlide.
			self smallIsBeautifulSlide.self gtoolkitIsSmall.
			self visualizingTheCode.
			self reuseSlide. self reuseInGToolkitSlide.
			self tourSlide.
			self pharo101Slide.
			self underTheHood}.
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

{ #category : #accessing }
DDDPresentation >> gettingStartedSlide [
	^ GtLabelAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Getting started');
		newTextWithFormat:
			(self descriptionString: 'Install the workshop in the image,');
		newTextWithFormat:
			(self descriptionString: 'then open the git tab and load the missing package ');
		element: [ GtPlaygroundSlide new
				snippets:
					{' Metacello new
	githubUser: ''StephanEggermont'' project: ''TestAutomationDays2020'' commitish: #master path: ''src'';
	baseline: ''TAD2020'' ;
	load.'};
				asElement ]
]

{ #category : #accessing }
DDDPresentation >> gtoolkitIsSmall [
^DDDSlide new
		newText: 'GToolkit is Small' asUppercase size: 80 color: self colorTextGray at: 100@200;
	newText: '• Simple Language
• Bootstrapped image ~ 200KB
• Everything is an Object
• Message Passing
• Constant Refactoring' size: 64 color: self colorTextGray at: 100@350
]

{ #category : #accessing }
DDDPresentation >> imageDirectory [
	^(IceRepository registeredRepositoryIncludingPackage: self class package) location /'images'
]

{ #category : #accessing }
DDDPresentation >> outOfACornerSlide [
	^ DDDSlide new
		newText: 'Program yourself out of a corner' asUppercase
			size: 100
			color: self colorTextGray
			at: 100 @ 150;
		newText: 'Meta programming and code rewriting'
			size: 38
			color: self colorTextRed
			at: 100 @ 380
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
		newText: 'Never commit early unless you know why' size: 32 color: self colorTextRed at: 520@340
]

{ #category : #accessing }
DDDPresentation >> reuseInGToolkitSlide [
	^DDDSlide new
		newText: 'Reuse in GToolkit' asUppercase size: 80 color: self colorTextGray at: 100@200;
		newText: 
'• Domain Specific Languages
• Good Refactoring Tools' size: 64 color: self colorTextGray at: 100@350
]

{ #category : #accessing }
DDDPresentation >> reuseSlide [
	^DDDSlide new
		newText: 'Reuse!' asUppercase size: 250 color: self colorTextGray at: 100@200;
		newText: 'More than applications' size: 48 color: self colorTextRed at: 470@450
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
DDDPresentation >> tourSlide [
	^ GtSlideshowSlide new
		textWithFormat:
			'A tour through GToolkit'
				asRopedText glamorousRegularFont;
		slideshow: [ GtTour new create ] withTitle: 'Tour'
]

{ #category : #accessing }
DDDPresentation >> underTheHood [
	^ GtLabelAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Going to the Morphic world' );
		newTextWithFormat:
			(self
				descriptionString:
					'And switching to the Pharo style exercises');
		element: [ GtPlaygroundSlide new
				snippets: { 'PharoLightTheme beCurrent' . '"First open the morphic world now"
TAD2020Tutorial open' . 'GTPlayground open'.'"Switch to morphic debugger"
GTGenericStackDebugger register'.'"And back to the GToolkit one"
GtMoldableDebugger register'};
				asElement ]	
]

{ #category : #accessing }
DDDPresentation >> visualizingTheCode [
	^ GtLabelAndElementSlide new
		newTextWithFormat: (self subtitleString: 'Visualizing the Code');
		newTextWithFormat:
			(self
				descriptionString:
					'Some quality attributes of the code we are writing are much easier to see in a simple visualization of it.');
		newTextWithFormat:
			(self
				descriptionString: ' Here we show the definition of different kinds of slides.');
		element: [ GtPlaygroundSlide new
				snippets:
					{'| view |
view := GtMondrian new.
view nodes with: (GtSlide withAllSubclasses).
view' . '| view |
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
