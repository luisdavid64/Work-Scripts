@ECHO OFF

ECHO STARTING AUTHOR INSTANCE... 
start C:\Users\luisd\Desktop\AEM\author-folder\crx-quickstart\bin\start.bat
ECHO STARTING PUBLISH INSTANCE
start C:\Users\luisd\Desktop\AEM\publish-folder\crx-quickstart\bin\start.bat

ECHO GOING TO PROJECT FOLDER
cd C:\Users\luisd\Desktop\AEM\ImmerProject\aem-base-reweb
npm start
pause