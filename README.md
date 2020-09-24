# TestAutomationDays2020
 Debugger Driven Development workshop. 
 
 ### notes 
 This workshop was given on september 22, 2020, using release 145 https://github.com/feenkcom/gtoolkit/releases/tag/v0.8.145 of GToolkit.
 A significant memory leak https://github.com/feenkcom/gtoolkit/issues/1478 was fixed in release 160.
 
 ## Installing in GToolkit
 Open a playground and do-it:
 
  ```
 Metacello new
    	githubUser: 'StephanEggermont' project: 'TestAutomationDays2020' commitish: #master path: 'src';
    	baseline: 'TAD2020' ;
     load.
```
then open the git browser on the repo, open it and load the missing package.

 ## Installing Pharo 8
 In a Pharo 8, open a playground and do-it: 
 
 ```
 Metacello new
    	githubUser: 'StephanEggermont' project: 'TestAutomationDays2020' commitish: #master path: 'src';
    	baseline: 'TAD2020' ;
     load.
```

Then do-it ```TAD2020Tutorial open```

Not compatible with Pharo 9, uses Glamour
