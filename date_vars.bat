@echo off
::Setta un'insieme di variabili che riguardano la data
:: N.B. basta chiamare questo una volta nel bat di partenza per avere le varibili a disposizione negli altri bat/ambienti

for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j


set giorno=%ldt:~6,2%
set mese=%ldt:~4,2%
set anno=%ldt:~0,4%
set ora=%ldt:~8,2%
set minuti=%ldt:~10,2%
set secondi=%ldt:~12,2%
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,2%
echo Local date is [%ldt%]


set miadata=%anno%_%mese%_%giorno%
set miadataora=%anno%_%mese%_%giorno%-T%ora%_%minuti%

exit /b 0
