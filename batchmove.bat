@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

:: Config parameters
SET groupsize=200
:: initial counter, everytime counter is 1, we create new folder
SET n=1
:: folder counter
SET nf=0

FOR %%f IN (*.jpg) DO (
  :: if counter is 1, create new folder
  IF !n!==1 (
    SET /A nf+=1
    MD folder!nf!
  )

  :: move file into folder
  MOVE /Y "%%f" folder!nf!

  :: reset counter if larger than group size
  IF !n!==!groupsize! (
    SET n=1
  ) ELSE (
    SET /A n+=1
  )
)

ENDLOCAL

PAUSE