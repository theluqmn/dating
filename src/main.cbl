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
           ELSE IF CLI-INPUT = "set" THEN
               PERFORM PROCEDURE-SET
           ELSE IF CLI-INPUT = "reset" THEN
               PERFORM PROCEDURE-RESET
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
           DISPLAY "[setup]            setup dating".
       PROCEDURE-SET.
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
       PROCEDURE-RESET.
           DISPLAY "---------------------------------------------".
           DISPLAY "RESET CURRENT DATE".
           DISPLAY " ".

           ACCEPT WS-CURRENT-DATE FROM DATE YYYYMMDD.

           DISPLAY "current date now reset to default (today)".
       PROCEDURE-MAIN.
           PERFORM CLI-HANDLER UNTIL CLI-INPUT = "exit".
           STOP RUN.
       END PROGRAM DATING.
