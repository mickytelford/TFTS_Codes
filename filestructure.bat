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
    
    REM Create directories under Footage
    mkdir %drive%\Footage\Group_!groupLetter!\SD_1
    mkdir %drive%\Footage\Group_!groupLetter!\SD_2
    mkdir %drive%\Footage\Group_!groupLetter!\Zoom
    mkdir %drive%\Footage\Group_!groupLetter!\Music
    mkdir %drive%\Footage\Group_!groupLetter!\Graphics
    
    REM Create directories under Exports
    mkdir %drive%\Exports\Group_!groupLetter!
    
    REM Create directories under Extras
    mkdir %drive%\Extras\Group_!groupLetter!
)

echo File structure created successfully on %drive%
exit /b 0
