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
create function fn_thongketongsoluongnhap(@tensp nvarchar(20),@y int)
returns int
as
begin 
declare @TongNhapXuat int
select @TongNhapXuat = soluongN - soluongX from tbNHAP INNER JOIN tbXUAT on tbNHAP.masp = tbXUAT.masp inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
where tbSANPHAM.tensp = @tensp AND YEAR(tbNHAP.Ngaynhap) = @y AND YEAR(tbXUAT.Ngayxuat) = @y
return @TongNhapXuat
end
go
-----cau4----------
create function fn_TongGiaTriNhapNgay(@x int, @y int)
returns int
as
begin 
declare @TongGiaTriNhapNgay int
select @TongGiaTriNhapNgay = SUM(tbNHAP.soluongN*tbNHAP.dongiaN) 
from tbNHAP 
where DAY(Ngaynhap) BETWEEN @x and @y
return @TongGiaTriNhapNgay
end
go
-----cau5-------
create function fn_tongiatrixuat(@tenhang nvarchar(20),@y int)
returns int
as
begin 
declare @tonggiatrixuat int
select @tonggiatrixuat = SUM(tbXUAT.soluongX*tbSANPHAM.giaban) 
from tbXUAT 
inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp 
inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
where tbHANGSX.Tenhang = @tenhang AND YEAR(Ngayxuat) = @y
return @tonggiatrixuat
end
go
------cau6------
create function fn_thongkenhanvien(@tenphong nvarchar(30))
returns int
as
begin
declare @thongkenhanvien int
select @thongkenhanvien = COUNT(Phong) 
from tbNHANVIEN 
where tbNHANVIEN.Phong = @tenphong
return @thongkenhanvien
end
go
------cau7-----
create function fn_soluongxuattheongay(@tensp nvarchar(20),@y int)
returns int
as
begin 
declare @soluongxuattheongay int
select @soluongxuattheongay = Sum(soluongX) 
from tbXUAT inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
where tbSANPHAM.tensp = @tensp AND DAY(tbXUAT.Ngayxuat) = @y
return @soluongxuattheongay
end
go
------cau8-----
CREATE FUNCTION fn_sodienthoainhanvienxuat(@x nchar(10))
returns int
as
begin 
declare @sodienthoainhanvienxuat int
select @sodienthoainhanvienxuat = tbNHANVIEN.Sodt 
from tbNHANVIEN inner join tbXUAT on tbNHANVIEN.manv = tbXUAT.manv
where tbXUAT.Sohdx = @x
return @sodienthoainhanvienxuat
end
go