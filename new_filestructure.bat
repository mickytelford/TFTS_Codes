@echo off
setlocal EnableDelayedExpansion

REM Prompt the user to enter the drive letter
set /p drive=Enter the drive letter (e.g., D:):

REM Check if the drive exists
if not exist %drive%\ (
    echo Drive %drive% does not exist.
    exit /b 1
)

REM Prompt the user for the number of groups
set /p numGroups=Enter the number of groups:

REM Create the directories
set letters=ABCDEFGHIJKLMNOPQRSTUVWXYZ

REM Loop through each group letter
for /l %%i in (0,1,%numGroups%) do (
    set groupLetter=!letters:~%%i,1!
    echo Creating directories for Group_!groupLetter!
    
    REM Create directories under Projects
    mkdir %drive%\Projects\Group_!groupLetter!
    
    REM Create directories under Assets
    mkdir %drive%\Assets\Group_!groupLetter!\Footage\SD_1
    mkdir %drive%\Assets\Group_!groupLetter!\Footage\SD_2
    mkdir %drive%\Assets\Group_!groupLetter!\Sound\Extras
    mkdir %drive%\Assets\Group_!groupLetter!\Sound\Music
    mkdir %drive%\Assets\Group_!groupLetter!\Sound\Filmed
    mkdir %drive%\Assets\Group_!groupLetter!\Graphics\Graphics
    mkdir %drive%\Assets\Group_!groupLetter!\Graphics\Titles
    mkdir %drive%\Assets\Group_!groupLetter!\Graphics\Images
    mkdir %drive%\Assets\Group_!groupLetter!\Effects
    
    REM Create directories under Exports
    mkdir %drive%\Exports\Group_!groupLetter!
    
    REM Create directories under Extras
    mkdir %drive%\Extras\Group_!groupLetter!\BTS_Photos
    mkdir %drive%\Extras\Group_!groupLetter!\Marketing
    mkdir %drive%\Extras\Group_!groupLetter!\Schedules
    mkdir %drive%\Extras\Group_!groupLetter!\Submission_Sheets
    mkdir %drive%\Extras\Group_!groupLetter!\Budget
)

echo File structure created successfully on %drive%
exit /b 0