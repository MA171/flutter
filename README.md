# MyFirstApp

The project we was working on the past week

## What we did in the last lecture is 

1)  - we changed the project name in android/app/build.gradel
2)	- we created the icon of the application using this web site : https://appicon.co/
	- we add all the generated icons in android/app/src/main/res
3)	- we created a key to our application , using the following command : 

```
	keytool -genkey -v -keystore D:/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

   - then we entered the password for the key 
4) - we created the key.proprietaries file in android/ folder
   - then we added the following code in it : 
```
	storePassword = the password we used in the key
	keyPassword= the password we used in they key
	keyAlias=key
	storeFile = D:/key.jks
```
5)  - we edited again the build.gradel files located in android/app/build.gradel , and added the following code : 

```dart
	def keystorePropertiesFile = rootProject.file("key.properties")
	def keystoreProperties = new Properties()
	keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
```

   - then after android { , we added : 
  
  ```dart
	signingConfigs{
	        release{
    	        keyAlias keystoreProperties['keyAlias']
        	    keyPassword keystoreProperties['keyPassword']
            	storeFile file(keystoreProperties['storeFile'])
            	storePassword keystoreProperties['storePassword']
        	}
    	}
      
   ```

6)  - finally , we released the application using 

```
flutter build apk -release
```
command in the terminal window 

# if you have any questions you can contact me , thank you for attending the course ♥
