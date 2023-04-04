----LAB2----
create view view1 as
select*from tbSANPHAM
go
----------------------
select*from view1
go
--------------------
create view view2 as
select top 100 percent tbSANPHAM.MaSP,tbSANPHAM.tenSP,tbHANGSX.tenhang,tbSANPHAM.soluong,mausac,giaban,donvitinh,mota 
from tbSANPHAM inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
order by tbSANPHAM.giaban desc
go
---------------------
go
create view view3 as
select tbSANPHAM.MaSP,tbSANPHAM.tenSP,tbHANGSX.tenhang,tbSANPHAM.soluong,mausac,giaban,donvitinh,mota 
from tbSANPHAM inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
where tbHANGSX.tenhang = 'samsung'
go
-----------------------
create view view4 as
select*from tbNHANVIEN
where phong = 'ke toan' and gioitinh = N'nu'
go
-----------------------
create view view5 as
select top 100 percent tbNHAP.sohdn,tbSANPHAM.masp,tbSANPHAM.tensp,tenhang,tbNHAP.soluongN,tbNHAP.dongiaN,tbNHAP.soluongN*tbNHAP.dongiaN as tiennhap,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbNHAP.ngaynhap,tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.masp
join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
order by tbNHAP.sohdn asc
go
----------------------
create view view6 as
select top 100 percent tbXUAT.sohdx,tbSANPHAM.masp,tbSANPHAM.tensp,tbHANGSX.tenhang,tbXUAT.soluongX,tbSANPHAM.giaban,tbXUAT.soluongX*tbSANPHAM.giaban as tienxuat,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbXUAT.ngayxuat,tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbXUAT
inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
inner join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
inner join tbNHANVIEN on tbXUAT.manv = tbNHANVIEN.manv
where MONTH(tbXUAT.ngayxuat) = 10 and YEAR(tbXUAT.ngayxuat) = 2018
order by tbXUAT.sohdx asc
go
------------------------
create view view7 as
select top 100 percent sohdn,tbSANPHAM.masp,tensp,soluongN,dongiaN,ngaynhap,tennv,phong
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.masp
join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
where tbHANGSX.tenhang = 'samsung' and YEAR(ngaynhap) = 2017
go
-------------------------
create view view8 as
select top 10 tbXUAT.sohdx, tbSANPHAM.tensp, tbXUAT.soluongX
from tbXUAT inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
where YEAR(tbXUAT.ngayxuat) = '2020'
order by tbXUAT.soluongX desc
go
-------------------------
create view view9 as
select top 10 percent masp,tensp,soluong,mausac,MAX(giaban) as 'giacaonhat',donvitinh,mota
from tbSANPHAM
group by masp,tensp,soluong,mausac,giaban,donvitinh,mota
order by tbSANPHAM.giaban desc
go
-------------------------
create view view10 as
select masp,tensp,soluong,mausac,giaban,donvitinh,mota,tbHANGSX.tenhang 
from tbSANPHAM inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
where tbSANPHAM.giaban between 100 and 500 AND tbHANGSX.tenhang = 'samsung'
go
------------------------
create view view11 as
select tbNHAP.sohdn,tbSANPHAM.masp,tbSANPHAM.tensp,tenhang,tbNHAP.soluongN,tbNHAP.dongiaN,SUM(tbNHAP.soluongN)*SUM(tbNHAP.dongiaN) as tiennhap,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbNHAP.ngaynhap,tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.masp
join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
where YEAR(tbNHAP.ngaynhap) = 2018 and tbHANGSX.tenhang = 'samsung'
group by tbNHAP.sohdn,tbSANPHAM.masp,tbSANPHAM.tensp,tenhang,tbNHAP.soluongN,tbNHAP.dongiaN,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbNHAP.ngaynhap,tbNHANVIEN.tennv,tbNHANVIEN.phong
go
-----------------------
create view view12 as
select tbXUAT.sohdx,tbSANPHAM.masp,tbSANPHAM.tensp,tbHANGSX.tenhang,tbXUAT.soluongX,tbSANPHAM.giaban,
tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbXUAT.ngayxuat,tbNHANVIEN.tennv,tbNHANVIEN.phong,SUM(tbXUAT.soluongX*tbSANPHAM.giaban) as 'tongiendaxuat'
from tbXUAT
inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
inner join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
inner join tbNHANVIEN on tbXUAT.manv = tbNHANVIEN.manv
where tbXUAT.ngayxuat = '2018-02-09'
group by tbXUAT.sohdx,tbSANPHAM.masp,tbSANPHAM.tensp,tbHANGSX.tenhang,tbXUAT.soluongX,tbSANPHAM.giaban,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbXUAT.ngayxuat,tbNHANVIEN.tennv,tbNHANVIEN.phong
go
---------------------
-------LAB3---------------------
create view view31 as
select mahangsx,COUNT(*) as N'tongsanpham'
from tbSANPHAM
group by mahangsx
go
------------------------------
create view view32 as
select tbNHAP.masp,tbSANPHAM.tenSP,tbNHAP.soluongN * tbNHAP.soluongN as tongtiennhap 
from tbNHAP inner join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
where YEAR(tbNHAP.ngaynhap) = 2020
group by tbNHAP.masp,tbSANPHAM.tenSP, soluongN, dongiaN
go
------------------------------
create view view33 as
select tbXUAT.masp,tbSANPHAM.tenSP,soluongX,ngayxuat
from tbXUAT
join tbSANPHAM on tbXUAT.masp = tbSANPHAM.MaSP
join tbHANGSX on tbHANGSX.mahangsx = tbSANPHAM.mahangsx
where YEAR(tbXUAT.ngayxuat) = 2018 and tbXUAT.soluongX > 10000 and tbHANGSX.tenhang = 'samsung'
group by tbSANPHAM.tenSP,tbXUAT.masp, soluongX,ngayxuat
go
-----------------------------
create view view34 as
select COUNT(manv) as 'tongsonhanviennam',tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbNHANVIEN
where tbNHANVIEN.gioitinh = N'nam'
group by tbNHANVIEN.manv,tbNHANVIEN.tennv,tbNHANVIEN.phong
go
---------------------------
create view view35 as
select tbNHAP.masp,tbHANGSX.mahangsx,tbHANGSX.tenhang,SUM(soluongN) as 'tongsoluongnhap',ngaynhap 
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
join tbHANGSX on tbHANGSX.mahangsx = tbSANPHAM.mahangsx
where YEAR(tbNHAP.ngaynhap) = 2018
group by tbNHAP.masp,tbHANGSX.mahangsx,tbHANGSX.tenhang,soluongN,ngaynhap
go
--------------------------
create view view36 as
select tbNHANVIEN.manv,tbNHANVIEN.tennv,SUM(tbXUAT.soluongX * tbSANPHAM.giaban) as tongtienxuat
from tbXUAT
join tbSANPHAM on tbXUAT.masp = tbSANPHAM.MaSP
join tbNHANVIEN on tbXUAT.manv = tbNHANVIEN.manv
where YEAR(tbXUAT.ngayxuat) = 2020
group by tbNHANVIEN.manv,tbNHANVIEN.tennv
go
-------------------------
create view view37 as
select tbNHANVIEN.manv,tbNHANVIEN.tennv,SUM(dongiaN*soluongN) as 'tongtiennhap',ngaynhap 
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
where MONTH(tbNHAP.ngaynhap) = 8 and YEAR(tbNHAP.ngaynhap) = 2018 and giaban > 100000
group by  tbNHANVIEN.manv,tbNHANVIEN.tennv,soluongN,ngaynhap
go
-------------------------
create view view38 as
select*from tbNHAP
where tbNHAP.masp not in(select tbXUAT.masp from tbXUAT)
go 
-------------------------
create view view39 as
select tbSANPHAM.MaSP, tbSANPHAM.tenSP 
from tbNHAP
inner join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
inner join tbXUAT on tbXUAT.masp = tbSANPHAM.MaSP
where YEAR(tbNHAP.ngaynhap) = 2018 and YEAR(tbXUAT.ngayxuat) = 2018
go
------------------------
create view view310 as
select tbNHANVIEN.manv, tbNHANVIEN.tennv
from tbNHANVIEN
where exists (select *from tbNHAP inner join  tbXUAT on tbNHAP.manv = tbXUAT.manv)
go
--------------------------
create view view311 as
select manv, tennv
from tbNHANVIEN
where not exists (select *from tbNHAP inner join  tbXUAT on tbNHAP.manv = tbXUAT.manv)
go