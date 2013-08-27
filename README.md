Windows-Batch-Utils
===================

Windows Batch Utilities that make my life a little easier sometimes.

Files
-----

+ options.bat
  - a file for parsing a batch files command line arguments
  
+ example.bat
  - a working example which deletes all but the number "-keep" of files matching a "-pattern" in a directory "-dir"
  - it shows how the parsed options can be used directly to print ":help" or shoe ":debug" info.

+ date_vars.bat
  - a .bat which uses WMIC to set the various parts of a standard, international date-time, it sets:
    + anno (year)
    + mese (month)
    + giorno (day)
    + ora (hour)
    + minuti (minute)
    + secondi (second)
  - I use this value for creating date-time values for file names and for various logging tasks


