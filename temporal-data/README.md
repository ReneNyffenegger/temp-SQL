  https://docs.microsoft.com/en-us/sql/relational-databases/tables/temporal-tables?view=sql-server-2017

  https://sigmodrecord.org/publications/sigmodRecord/1203/pdfs/10.industry.zemke.pdf

  https://www.postgresql.eu/events/fosdem2019/sessions/session/2299/slides/161/Periods%20and%20System-Versioned%20Tables.pdf

  Any table that contains a period definition with the standard-specified name,
  SYSTEM_TIME, and includes the keywords WITH SYSTEM VERSIONING in its
  definition is a system-versioned table

  CREATE TABLE Emp (
    ENo INTEGER,
    Sys_start TIMESTAMP(12) GENERATED ALWAYS AS ROW START,
    Sys_end TIMESTAMP(12) GENERATED ALWAYS AS ROW END,
    EName VARCHAR(30),
    PERIOD FOR SYSTEM_TIME (Sys_start, Sys_end)
  ) WITH SYSTEM VERSIONING


 
  -- > does not run on PostgreSQL OR SQL Server
  CREATE TABLE Emp(
    ENo INTEGER,
    EStart DATE,
    EEnd DATE,
    EDept INTEGER,
    PERIOD FOR EPeriod (EStart, EEnd)
  )

   UPDATE Emp FOR PORTION OF EPeriod FROM DATE '2011-02-03' TO DATE '2011-09-10' SET EDept = 4 WHERE ENo = 22217

   DELETE Emp FOR PORTION OF EPeriod FROM DATE '2011-02-03' TO DATE '2011-09-10' WHERE ENo = 22217 


  CREATE TABLE Dept( DNo INTEGER, DStart DATE, DEnd DATE, DName VARCHAR(30), PERIOD FOR DPeriod (DStart, DEnd), PRIMARY KEY (DNo, DPeriod WITHOUT OVERLAPS) )

  SELECT Name, Edept FROM Emp WHERE ENo = 22217 AND EStart <= DATE '2011-01-02' AND EEnd > DATE '2011-01-02' 

  PERIOD operators:
    CONTAINS,
    OVERLAPS ,
    EQUALS ,
    PRECEDES ,
    SUCCEEDS,
    IMMEDIATELY PRECEDES ,
    IMMEDIATELY SUCCEEDS



  SELECT Ename, Edept FROM Emp WHERE ENo = 22217 AND EPeriod OVERLAPS PERIOD (DATE '2010-01-01', DATE '2011-01-01') 


### Window functions

   over (partition by xxx order by yyy groups between 2 preceeding and 2 following)


    select
       item,
       val,
       sum(case when val > value_of (val at current_row) then 1 else 0 end)
           over (order by item rows between 30 preceding and current row)    -- how many vals greater than current val in last 30 records
    from
      

