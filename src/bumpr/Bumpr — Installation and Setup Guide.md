# **Bumpr — Installation and Setup Guide**



Project: Bumpr — AI-Assisted Accident Documentation Application

Technology Stack: Android (Java/XML), PHP, MySQL, XAMPP, Ollama and Gemma 4 E2B

###### 

###### **1.) Project Overview**



Bumpr is an Android application designed to assist drivers with documenting vehicle accidents.



The application allows users to register and log in, manage vehicles and documents, capture accident information, upload photographic evidence, record additional parties involved, generate PDF reports and analyse accident photographs using artificial intelligence.



The AI feature uses the locally hosted Gemma 4 E2B model through Ollama. Users can review and edit AI-generated observations before including them in accident reports.



###### **2.) Software Requirements**



Each group member requires:



* Android Studio with the Android SDK and an Android emulator



* XAMPP with Apache, PHP and MySQL/MariaDB



* Ollama for local AI processing



* Gemma 4 E2B AI model



* A computer with sufficient RAM and storage



**Note:** The AI model runs locally and will perform differently depending on the computer's specifications.



###### **3.) Configure XAMPP**



1. Install XAMPP.

2. Open the XAMPP Control Panel.

3. Start Apache and MySQL.

4. Open a browser and navigate to:



*http://localhost/phpmyadmin*



5\. Confirm that phpMyAdmin loads successfully.



***If Apache or MySQL cannot start, check whether another application is already using the required ports.***

###### 

###### **4.) Import Bumpr Database**



1. Open phpMyAdmin.

2. Click New.

3. Create a database named: 'bumpr'



4\. Select the newly created database.



5\. Open the Import tab.



6\. Select: Database/bumpr.sql



7\. Click **Import** or **Go**.



###### **5.) Configure the PHP Backend** 



**Bumpr makes use of two PHP backend folders: bumpr and bumpr\_api. Both are required for the application to function correctly.**



1. Open the XAMPP installation directory.

2. Navigate to: *C:\\xampp\\htdocs\\*



3\. Copy both of the PHP backend folder into htdocs.



**bumpr** — Handles accident documentation, vehicle management, photographic evidence, AI analysis and reporting.



**bumpr\_api** — Handles user authentication, registration, password recovery and profile management.



4\. Ensure the resulting path is: *C:\\xampp\\htdocs\\bumpr\\*



5\. Open: *C:\\xampp\\htdocs\\bumpr\\db\_connect.php*



###### **6.) Install \& Configure Ollama**



1. Download and install Ollama -> https://ollama.com/download



2\. Open PowerShell or Command Prompt and run: ollama --version



**\*If Ollama is installed successfully, its version should be displayed.\*** 



3\. Download the AI model: ollama pull gemma4:e2b



4\. Verify the model is available: ollama list



\*You should have an output like - gemma4:e2b



###### **7.) Open the Android Project**



1. Open Android Studio.

2. Select Open.

3. Navigate to the shared Android-App directory.

4. Select the actual Android Studio project folder containing *settings.gradle* or *settings.gradle.kts*.

5. Allow Gradle to synchronize.

6. Wait for the required dependencies to download.



###### **8.) Run the Application**



1. Start Apache and MySQL in XAMPP.

2. Ensure Ollama is running.

3. Open the Bumpr project in Android Studio.

4. Start an Android emulator.

5. Click Run.

6. Wait for Bumpr to install and launch.



###### **9.) Test Application** 



The following tests will confirm that the Android application, PHP backend, database and AI model are communicating successfully.



* Perform the following tests after installation:



* Register a new user account.



* Log in successfully.



* Navigate through the home screen.



* Add a vehicle.



* Create a new accident record.



* Upload photographic evidence.



* Add additional accident information.



* Open the saved accident report.



* Generate an AI analysis for an uploaded photograph.



* Review and save the AI-generated observations.



* Generate a PDF accident report.



* Confirm that reviewed AI observations appear in the PDF.



* Open and share the generated PDF.





##### **Recommended Startup Order**



Each time the project is run:



1. Start XAMPP Apache.

2. Start XAMPP MySQL.

3. Ensure Ollama is running.

4. Open Android Studio.

5. Start the emulator.

6. Run Bumpr.



The application should then be ready for testing and demonstration.

