       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATING.
       AUTHOR. theluqmn.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *logic variables
       01 COUNTER                  PIC 9(4).
       01 CLI-INPUT                PIC X(32).
       01 WS-DATE                  PIC 9(8).
       01 WS-DATE-REDEF REDEFINES WS-DATE.
           05 WS-DATE-YEAR         PIC 9(4).
           05 WS-DATE-MONTH        PIC 9(2).
           05 WS-DATE-DAY          PIC 9(2).
      *temporary variables
       01 TP-STR-A                 PIC X(32).
       01 TP-DATE                  PIC 9(8).
       01 TP-DATE-REDEF REDEFINES TP-DATE.
           05 TP-DATE-YEAR         PIC 9(4).
           05 TP-DATE-MONTH        PIC 9(2).
           05 TP-DATE-DAY          PIC 9(2).

       PROCEDURE DIVISION.
       ACCEPT WS-DATE FROM DATE YYYYMMDD.
       DISPLAY "DATING - date calculation tool".
       DISPLAY "current date: " WS-DATE.
       PERFORM PROCEDURE-MAIN.
       CLI-HANDLER.
           DISPLAY "---------------------------------------------".
           DISPLAY "> " WITH NO ADVANCING.
           ACCEPT TP-STR-A.
           MOVE FUNCTION LOWER-CASE(TP-STR-A) TO CLI-INPUT.

           IF CLI-INPUT = "exit" THEN
               DISPLAY "exiting..."
           ELSE
               DISPLAY "unknown input"
           END-IF.
       PROCEDURE-MAIN.
           PERFORM CLI-HANDLER UNTIL CLI-INPUT = "exit".
           STOP RUN.
       END PROGRAM DATING.
