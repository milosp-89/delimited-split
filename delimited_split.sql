use [db]; -- specify database name where the function will be created
go

create function [dbo].[DelimitedSplit]
(@pstring varchar(8000), @pdelimiter char(1))
        returns table with schemabinding as
                return
                        with e1(n) as (
                                 select 1 union all select 1 union all select 1 union all
                                 select 1 union all select 1 union all select 1 union all
                                 select 1 union all select 1 union all select 1 union all select 1
                                ),
                             e2(n) as (select 1 from e1 a, e1 b),
                             e4(n) as (select 1 from e2 a, e2 b),
cte1(n) as (select top (isnull(datalength(@pstring),0)) row_number() over (order by (select null)) from e4
                ),
cte2(n1) as (select 1 union all
                 select t.n+1 from cte1 t where substring(@pstring,t.n,1) = @pdelimiter
                ),
cte3(n1,l1) as(select s.n1,
        isnull(nullif(charindex(@pdelimiter,@pstring,s.n1),0)-s.n1,8000)
        from cte2 s
                )
select itemnumber = row_number() over(order by l.n1),
        item = substring(@pstring, l.n1, l.l1)
from cte3 l;
go
