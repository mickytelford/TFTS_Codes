@echo off
setlocal EnableDelayedExpansion

REM Prompt the user to enter the drive letter
set /p drive=Enter the drive letter (e.g., D:)

REM Check if the drive exists
if not exist %drive%\ (
    echo Drive %drive% does not exist.
    exit /b 1
)

REM Prompt the user for the number of weeks
set /p numWeeks=Enter the number of weeks:

REM Prompt the user for the number of groups
set /p numGroups=Enter the number of groups:

REM Create the directories
set letters=ABCDEFGHIJKLMNOPQRSTUVWXYZ

REM Loop through each week
for /l %%w in (1,1,%numWeeks%) do (
    echo Creating directories for Week_%%w
    REM Create Week directory
    mkdir %drive%\Week_%%w
    
    REM Loop through each group for the current week
    for /l %%i in (0,1,%numGroups%) do (
        set groupLetter=!letters:~%%i,1!
        echo Creating directories for Week_%%w\Group_!groupLetter!
        
        REM Create directories under Projects
        mkdir %drive%\Week_%%w\Projects\Group_!groupLetter!
        
        REM Create directories under Footage
        mkdir %drive%\Week_%%w\Footage\Group_!groupLetter!\SD_1
        mkdir %drive%\Week_%%w\Footage\Group_!groupLetter!\SD_2
        mkdir %drive%\Week_%%w\Footage\Group_!groupLetter!\Zoom
        mkdir %drive%\Week_%%w\Footage\Group_!groupLetter!\Music
        mkdir %drive%\Week_%%w\Footage\Group_!groupLetter!\Graphics
        
        REM Create directories under Exports
        mkdir %drive%\Week_%%w\Exports\Group_!groupLetter!
        
        REM Create directories under Extras
        mkdir %drive%\Week_%%w\Extras\Group_!groupLetter!
    )
)

echo File structure created successfully on %drive%
exit /b 0
