------cau1------
create function fn_Timhang(@masp nvarchar(10))
returns nvarchar(20)
as
begin
declare @ten nvarchar(20)
set @ten= (select tbHANGSX.tenhang from tbHANGSX inner join tbSANPHAM on tbHANGSX.mahangsx = tbSANPHAM.mahangsx where tbSANPHAM.MaSP = @masp)
return @ten
end
-----cau2-----------
go
create function fn_thongkenhaptheonam(@x int,@y int)
returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from tbNHAP
where year(tbNHAP.ngaynhap) between @x and @y
return @tongtien
end
go
-----cau3-----------
create function fn_thongketongsoluongnhap(@x int,@y int)
returns int
