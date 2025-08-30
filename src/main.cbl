       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATING.
       AUTHOR. theluqmn.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *logic variables
       01 COUNTER                          PIC 9(4).
       01 CLI-INPUT                        PIC X(32).
       01 WS-CURRENT-DATE                  PIC 9(8).
       01 WS-CURRENT-DATE-REDEF REDEFINES WS-CURRENT-DATE.
           05 WS-CURRENT-DATE-YEAR         PIC 9(4).
           05 WS-CURRENT-DATE-MONTH        PIC 9(2).
           05 WS-CURRENT-DATE-DAY          PIC 9(2).
      *temporary variables
       01 TP-STR-A                         PIC X(32).
       01 TP-STR-B                         PIC X(32).
       01 TP-INT-A                         PIC 9(8).
       01 TP-INT-B                         PIC 9(8).
       01 TP-INT-C                         PIC 9(8).
       01 TP-DATE-A                        PIC 9(8).
       01 TP-DATE-A-REDEF REDEFINES TP-DATE-A.
           05 TP-DATE-A-YEAR               PIC 9(4).
           05 TP-DATE-A-MONTH              PIC 9(2).
           05 TP-DATE-A-DAY                PIC 9(2).
       01 TP-DATE-B                        PIC 9(8).
       01 TP-DATE-B-REDEF REDEFINES TP-DATE-B.
           05 TP-DATE-B-YEAR               PIC 9(4).
           05 TP-DATE-B-MONTH              PIC 9(2).
           05 TP-DATE-B-DAY                PIC 9(2).

       PROCEDURE DIVISION.
       ACCEPT WS-CURRENT-DATE FROM DATE YYYYMMDD.
       DISPLAY "DATING - date calculation tool".
       DISPLAY "current date: " WS-CURRENT-DATE.
       PERFORM PROCEDURE-MAIN.
       CLI-HANDLER.
           DISPLAY "---------------------------------------------".
           DISPLAY "> " WITH NO ADVANCING.
           ACCEPT TP-STR-A.
           MOVE FUNCTION LOWER-CASE(TP-STR-A) TO CLI-INPUT.

           IF CLI-INPUT = "help" THEN
               PERFORM PROCEDURE-HELP
      *    current date
           ELSE IF CLI-INPUT = "cd" THEN
               PERFORM PROCEDURE-CURRENT-DATE
           ELSE IF CLI-INPUT = "cd set" THEN
               PERFORM CURRENT-DATE-SET
           ELSE IF CLI-INPUT = "cd reset" THEN
               PERFORM CURRENT-DATE-RESET
      *    calculations
           ELSE IF CLI-INPUT = "get date" THEN
               PERFORM PROCEDURE-DATE-GET
           ELSE IF CLI-INPUT = "exit" THEN
               DISPLAY "exiting..."
           ELSE
               DISPLAY "unknown input"
           END-IF.
       PROCEDURE-HELP.
           DISPLAY "---------------------------------------------".
           DISPLAY "HELP".
           DISPLAY "github: https://github.com/theluqmn/dating"
           DISPLAY " ".
           DISPLAY "[cd]               view the current date".
           DISPLAY "[cd set]           set the current date".
           DISPLAY "[cd reset]         reset current date to today".
           DISPLAY "-".
           DISPLAY "[exit]             exit dating".
       PROCEDURE-CURRENT-DATE.
           DISPLAY "---------------------------------------------".
           DISPLAY "CURRENT DATE".
           DISPLAY " ".
           DISPLAY
           WS-CURRENT-DATE-YEAR "-"
           WS-CURRENT-DATE-MONTH "-"
           WS-CURRENT-DATE-DAY " " WITH NO ADVANCING.
           
           ACCEPT TP-DATE-A FROM DATE YYYYMMDD
           IF WS-CURRENT-DATE = TP-DATE-A THEN
               DISPLAY "(defaulted to today)"
           ELSE
               DISPLAY "(configured date)"
           END-IF.
           
           CURRENT-DATE-SET.
           DISPLAY "---------------------------------------------".
           DISPLAY "SET CURRENT DATE".
           DISPLAY "note: please use YYYY-MM-DD".
           DISPLAY " ".

           DISPLAY "date: " WITH NO ADVANCING.
           ACCEPT TP-STR-A.
           
           MOVE TP-STR-A(1:4) TO TP-DATE-A(1:4).
           MOVE TP-STR-A(6:2) TO TP-DATE-A(5:2).
           MOVE TP-STR-A(9:2) TO TP-DATE-A(7:2).
           DISPLAY TP-DATE-A.
           MOVE TP-DATE-A TO WS-CURRENT-DATE.

           DISPLAY "set current date to "
           WS-CURRENT-DATE-YEAR "-"
           WS-CURRENT-DATE-MONTH "-"
           WS-CURRENT-DATE-DAY.
           
           CURRENT-DATE-RESET.
           DISPLAY "---------------------------------------------".
           DISPLAY "RESET CURRENT DATE".
           DISPLAY " ".

           ACCEPT WS-CURRENT-DATE FROM DATE YYYYMMDD.
           
           DISPLAY "current date now reset to default (today)".
       PROCEDURE-DATE-GET.
           DISPLAY "---------------------------------------------".
           DISPLAY "CALCULATE DATE FOR # DAYS".
           DISPLAY "enter a negative value for days into the past"
           DISPLAY " ".

           DISPLAY "days:"
           ACCEPT TP-INT-B.

           COMPUTE TP-INT-A = FUNCTION INTEGER-OF-DATE(WS-CURRENT-DATE)
           COMPUTE TP-INT-C = TP-INT-A + TP-INT-B
           COMPUTE TP-DATE-A = FUNCTION DATE-OF-INTEGER(TP-INT-C)
           DISPLAY TP-DATE-A.
       PROCEDURE-MAIN.
           PERFORM CLI-HANDLER UNTIL CLI-INPUT = "exit".
           STOP RUN.
       END PROGRAM DATING.
