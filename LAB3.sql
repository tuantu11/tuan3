----cau1----
select mahangsx,COUNT(*) as N'tongsanpham'
from tbSANPHAM
group by mahangsx
----cau2----
select tbNHAP.masp,tbSANPHAM.tenSP,tbNHAP.soluongN * tbNHAP.soluongN as tongtiennhap 
from tbNHAP inner join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
where YEAR(tbNHAP.ngaynhap) = 2018
group by tbNHAP.masp,tbSANPHAM.tenSP, soluongN, dongiaN
----cau3----
select tbXUAT.masp,tbSANPHAM.tenSP,soluongX,ngayxuat
from tbXUAT
join tbSANPHAM on tbXUAT.masp = tbSANPHAM.MaSP
join tbHANGSX on tbHANGSX.mahangsx = tbSANPHAM.mahangsx
where YEAR(tbXUAT.ngayxuat) = 2018 and tbXUAT.soluongX > 10000 and tbHANGSX.tenhang = 'samsung'
group by tbSANPHAM.tenSP,tbXUAT.masp, soluongX,ngayxuat
----cau4----
select COUNT(manv),tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbNHANVIEN
where tbNHANVIEN.gioitinh = N'nam'
group by tbNHANVIEN.manv,tbNHANVIEN.tennv,tbNHANVIEN.phong
----cau5----
select tbNHAP.masp,tbHANGSX.mahangsx,tbHANGSX.tenhang,SUM(soluongN) as 'tongsoluongnhap',ngaynhap 
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
join tbHANGSX on tbHANGSX.mahangsx = tbSANPHAM.mahangsx
where YEAR(tbNHAP.ngaynhap) = 2018
group by tbNHAP.masp,tbHANGSX.mahangsx,tbHANGSX.tenhang,soluongN,ngaynhap
----cau6----
select tbNHANVIEN.manv,tbNHANVIEN.tennv,SUM(tbXUAT.soluongX * tbSANPHAM.giaban) as tongtienxuat
from tbXUAT
join tbSANPHAM on tbXUAT.masp = tbSANPHAM.MaSP
join tbNHANVIEN on tbXUAT.manv = tbNHANVIEN.manv
where YEAR(tbXUAT.ngayxuat) = 2020
group by tbNHANVIEN.manv,tbNHANVIEN.tennv
----cau7----
select tbNHANVIEN.manv,tbNHANVIEN.tennv,SUM(dongiaN*soluongN) as 'tongtiennhap',ngaynhap 
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
where MONTH(tbNHAP.ngaynhap) = 8 and YEAR(tbNHAP.ngaynhap) = 2018 and giaban > 100000
group by  tbNHANVIEN.manv,tbNHANVIEN.tennv,soluongN,ngaynhap
----cau8----
select*from tbNHAP
where tbNHAP.masp not in(select tbXUAT.masp from tbXUAT)
----cau9----
select tbSANPHAM.MaSP, tbSANPHAM.tenSP 
from tbNHAP
inner join tbSANPHAM on tbNHAP.masp = tbSANPHAM.MaSP
inner join tbXUAT on tbXUAT.masp = tbSANPHAM.MaSP
where YEAR(tbNHAP.ngaynhap) = 2018 and YEAR(tbXUAT.ngayxuat) = 2018
----cau10----
select tbNHANVIEN.manv, tbNHANVIEN.tennv
from tbNHANVIEN
where exists (select *from tbNHAP inner join  tbXUAT on tbNHAP.manv = tbXUAT.manv)
----cau11----
select manv, tennv
from tbNHANVIEN
where not exists (select *from tbNHAP inner join  tbXUAT on tbNHAP.manv = tbXUAT.manv)