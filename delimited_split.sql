-- custom function to split entries/rows intro the multiple rows based on values, delimited with commas
-- this is useful when one entry/row of data has mutluple values stacked in one column, for repeated answers
-- the function will create 5 rows for the same id if detected values are 5 and so on...

use [xxx];
go

create function [dbo].[delimitedsplit]
        (@pstring varchar(8000), @pdelimiter char(1))
-- do not use max data-types here!
returns table with schemabinding as
 return
  with e1(n) as (
                 select 1 union all select 1 union all select 1 union all
                 select 1 union all select 1 union all select 1 union all
                 select 1 union all select 1 union all select 1 union all select 1
                ),
       e2(n) as (select 1 from e1 a, e1 b),
       e4(n) as (select 1 from e2 a, e2 b),
 cteTally(n) as (select top (isnull(datalength(@pstring),0)) row_number() over (order by (select null)) from e4
                ),
cteStart(n1) as (select 1 union all
                 select t.n+1 from cteTally t where substring(@pstring,t.n,1) = @pdelimiter
                ),
cteLen(n1,l1) as(select s.n1,
  isnull(nullif(charindex(@pdelimiter,@pstring,s.n1),0)-s.n1,8000)
  from cteStart s
                )
 select itemnumber = row_number() over(order by l.n1),
        item       = substring(@pstring, l.n1, l.l1)
   from cteLen l;
go
