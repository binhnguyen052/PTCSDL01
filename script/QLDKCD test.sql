use QLDKCD1
go

select * from TAIKHOAN

if OBJECT_ID('Func_Check_Login', 'fn') is not null
	drop function Func_Check_Login
go

create function Func_Check_Login(@MaTK nchar(10), @MatKhau nchar(10))
returns int
as
BEGIN
	declare @ChucVu int = -1
	select @ChucVu = tk.ChucVu from dbo.TAIKHOAN tk where tk.MaTK = @MaTK and tk.MatKhau = @MatKhau
	return @ChucVu
END
go

if OBJECT_ID('Proc_UserProfile', 'p') is not null
	drop procedure Proc_UserProfile
go

create procedure Proc_UserProfile(@MaTK nchar(10))
as
BEGIN
	select * 
	from TAIKHOAN tk join SINHVIEN sv on tk.MaTK = sv.MaTK
		join DIACHI dc on dc.MaDC = sv.MaDC
	where sv.MaTK = @MaTK
END
go

execute dbo.Proc_UserProfile N'sinhvien1'

declare @ChucVu int = dbo.Func_Check_Login (N'giaovu1', N'admin')
print @ChucVu


declare @ChucVu int = dbo.Func_Check_Login (N'giaovu1', N'admin1')
print @ChucVu

select @ChucVu = tk.ChucVu from dbo.TAIKHOAN tk where tk.MaTK = N'giaovu1' and tk.MatKhau = N'admin'
print @ChucVu


select * from TAIKHOAN tk join SINHVIEN sv on tk.MaTK = sv.MaTK
		join DIACHI dc on dc.MaDC = sv.MaDC

select * from SINHVIEN  

select * from  dbo.NGANH

if OBJECT_ID('Proc_LayNganhHoc', 'p') is not null
	drop procedure Proc_LayNganhHoc
go

create procedure Proc_LayNganhHoc
as
BEGIN
	select * from  dbo.NGANH
END
go

execute dbo.Proc_LayNganhHoc

select * from dbo.LOP
select * from dbo.NHOM

select sv.MaSoSV, sv.MaNganh, n.TenNganh, n.TongSoSV, n.SlCDe
from dbo.SINHVIEN sv join dbo.NGANH n on sv.MaNganh = n.MaNganh
order by n.TenNganh asc


select sv.MaSoSV, sv.MaNganh, n.TenNganh, n.TongSoSV, n.SlCDe, cd.MaCD, cd.TenCD, cd.TgHoc
from dbo.SINHVIEN sv join dbo.NGANH n on sv.MaNganh = n.MaNganh
	join dbo.CHUYENDE cd on cd.MaNganh = n.MaNganh
where n.TenNganh = N'Công Nghệ Thông Tin'
order by n.TenNganh asc, cd.TenCD asc

select distinct cd.TenCD
from dbo.SINHVIEN sv join dbo.NGANH n on sv.MaNganh = n.MaNganh
	join dbo.CHUYENDE cd on cd.MaNganh = n.MaNganh
where sv.MaSoSV = N'SV001'


select distinct cd.TenCD
from  dbo.SINHVIEN sv join dbo.CHUYENDE cd on sv.MaNganh = cd.MaNganh
where sv.MaSoSV = N'SV001'

-- proc lấy danh sách chuyên của sinh viên theo ngành
if OBJECT_ID('Proc_LayDSChuyenDeTheoNganh_SV', 'p') is not null
	drop procedure Proc_LayDSChuyenDeTheoNganh_SV
go

create procedure Proc_LayDSChuyenDeTheoNganh_SV(@MaSoSV nchar(10))
as
BEGIN
	select cd.TenCD 
	from  dbo.SINHVIEN sv join dbo.CHUYENDE cd on sv.MaNganh = cd.MaNganh
END
go


if OBJECT_ID('Proc_TAOTK_TUDONG', 'p') is not null
	drop procedure Proc_TAOTK_TUDONG
go

create procedure Proc_TAOTK_TUDONG(@KhoaHoc int, @Nganh nvarchar(10), @ChucVu int, @Quantity int)
as
BEGIN
	
	-- kiểm tra khoá học có tồn tại trong bảng sinh viên hay không
	if (not exists (select distinct KhoaHoc from SINHVIEN where KhoaHoc = @KhoaHoc))
		begin return end

	declare @MaTK nchar(10)
	declare @MatKhau nchar(10)
	declare @i int = 1
	declare @na char(4)
	declare @cv char(2)

	if(@ChucVu = 1) begin set @cv = '01'  end -- giáo vụ

	if (@ChucVu = 2) begin set @cv = '02'  end -- giáo viên

	if (@ChucVu = 3)
	begin
		declare @mssv nchar(10)
		declare cur cursor for select sv.MaSoSV
								from dbo.SINHVIEN sv	
								where sv.KhoaHoc = @KhoaHoc and sv.MaNganh = @Nganh
		--mở con trỏ
		open cur
		--nạp con trỏ
		fetch next from cur into @mssv
		while(@@fetch_status = 0)
		begin
			set @MaTK = @mssv
			--mật khẩu trùng với mssv
			set @MatKhau =  @mssv
			insert into TAIKHOAN(MaTK, MatKhau, ChucVu)
			values(@MaTK, @MatKhau, @ChucVu)
			-- mã tài khoản trùng với MSSV	
			update SINHVIEN 
			set MaTK = @mssv
			where MaSoSV = @mssv
			fetch next from cur into @mssv
		end
		close cur 
		deallocate cur
		return 
	end -- sinh viên

	while(@i <= @Quantity)
		begin
			if(@i >= 1 and @i < 10)
				set @na = REPLICATE('0', 2) + cast (@i as varchar(4))
			else if (@i >= 10 and @i < 100)
				set @na = REPLICATE('0', 1) + cast (@i as varchar(4))
			else if (@i >= 100 and @i < 1000)
				set @na = REPLICATE('0', 0) + cast (@i as varchar(4))
			set @MaTK = cast(@KhoaHoc as char(2)) + @Nganh + @cv + @na -- 2 + 2 + 2 + 4
			--mật khẩu tạm: mã ngành và khoá học
			set @MatKhau =  cast (@Nganh as char(2)) + cast(@KhoaHoc as char(2))
			insert into TAIKHOAN(MaTK, MatKhau, ChucVu)
			values(@MaTK, @MatKhau, @ChucVu)
			set @i+=1
		end
END
go

update SINHVIEN 
set MaTK = '11'
where MaSoSV = '1701001'

if (not exists (select distinct KhoaHoc from SINHVIEN where KhoaHoc = 2017)) print 'not' else print 'ok'


select distinct KhoaHoc from SINHVIEN where KhoaHoc = 2018

--đổi tên cột Khoa thành KhoaHoc sp_rename 'SINHVIEN.Khoa', 'KhoaHoc', 'COLUMN';

--while(@i <= @Quantity)
--			begin
--				if(@i >= 1 and @i < 10)
--					set @na = REPLICATE('0', 2) + cast (@i as varchar(4))
--				else if (@i >= 10 and @i < 100)
--					set @na = REPLICATE('0', 1) + cast (@i as varchar(4))
--				else if (@i >= 100 and @i < 1000)
--					set @na = REPLICATE('0', 0) + cast (@i as varchar(4))


--				set @MaTK = cast(@KhoaHoc as char(2)) + @Nganh + @na -- 2 + 2 + 4
--				--mật khẩu tạm: mã ngành và khoá học
--				set @MatKhau =  cast (@Nganh as char(2)) + cast(@KhoaHoc as char(2))
--				insert into TAIKHOAN(MaTK, MatKhau, ChucVu)
--				values(@MaTK, @MatKhau, @ChucVu)
--				-- mã tài khoản trùng với MSSV
--				set @i+=1
--			end

select * from SINHVIEN sv
where sv.MaNganh = N'NG001' and sv.KhoaHoc = 2017

select sv.MaSoSV
from dbo.SINHVIEN sv	
where sv.KhoaHoc = 2017 and sv.MaNganh = 'NG001'

execute dbo.Proc_TAOTK_TUDONG 2017, 'NG001', 3, 4 
select * from dbo.TAIKHOAN

delete from dbo.TAIKHOAN where MatKhau = '0116'

select * from dbo.DsGvu_CDe

select * from dbo.NGANH

select * from dbo.TAIKHOAN

select * from dbo.SINHVIEN

select * from dbo.TAIKHOAN tk join dbo.SINHVIEN sv on tk.MaTK = sv.MaTK

select * from dbo.DANGKY

select * from dbo.DsGvu_CDe

update dbo.DsGvu_CDe
set TgMo = '02/01/2018 22:27'
where MaDsGvu_CDe = 1


select * from dbo.DsGvu_CDe g join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 

select g.MaDsGvu_CDe, cd.MaCD, cd.TenCD, g.TgMo, g.TgianKt, g.Loai, g.MaGVu, cd.TgHoc, cd.Deadline, g.NienKhoa, g.SoHK, cd.SoChi
from dbo.DsGvu_CDe g join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 

select g.MaDsGvu_CDe, g.TgMo, g.TgianKt, g.MaCD, cd.TenCD, cd.TgHoc, g.Loai
from dbo.DsGvu_CDe g join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 

select g.MaDsGvu_CDe, g.TgMo, g.TgianKt, g.MaCD, cd.TenCD, cd.TgHoc, g.Loai
from dbo.DsGvu_CDe g join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
where g.Loai = 1

select sv.MaSoSV, n.MaNganh, n.TenNganh, n.TongSoSV, cd.MaCD, cd.TenCD, g.TgMo
from dbo.SINHVIEN sv join dbo.NGANH n on sv.MaNganh = n.MaNganh
	join dbo.CHUYENDE cd on cd.MaNganh = n.MaNganh
	join dbo.DsGvu_CDe g on g.MaCD = cd.MaCD
where year(g.TgMo) = 2018 
order by n.TenNganh asc, cd.TenCD asc

select * 
from dbo.TAIKHOAN tk
where tk.MaTK like '__' + @_nganh + '%'

-- func đếm số sinh viên đăng kí chuyên đề
if OBJECT_ID('Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD', 'fn') is not null
	drop function Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD
go

create function Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD(@MaCD nchar(10))
returns int
as
BEGIN
	declare @count int = 0
	select @count = count(dk.MaSoSV)
	from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
		left join dbo.DANGKY dk on dk.MaDsGvu_CDe = g.MaDsGvu_CDe
	where cd.MaCD = @MaCD
	group by cd.MaCD
	return @count
END
go

select * from dbo.CHUYENDE

select cd.MaCD, cd.TenCD, g.MaDsGvu_CDe, g.TgMo, g.TgianKt, cd.TgHoc, g.Loai
from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
order by cd.MaCD asc

select * from dbo.DANGKY order by MaSoSV desc
select * from dbo.NHOM order by MaNhom desc
select * from dbo.DANGKY order by MaSoSV desc
select cd.MaCD,cd.TenCD, g.MaDsGvu_CDe, g.TgMo, g.TgianKt, g.Loai , l.MaLop, l.SoNhomMax, dk.MaSoSV
from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
	left join dbo.DANGKY dk on dk.MaDsGvu_CDe = g.MaDsGvu_CDe
	left join dbo.NHOM nh on nh.MaNhom = dk.MaNhom 
	left join dbo.LOP l on l.MaLop = nh.MaLop 
order by cd.MaCD asc


-- func đếm số sinh viên đăng kí chuyên đề
if OBJECT_ID('Func_COUNT_LopDangKiChuyenDe_TheoMaCD', 'fn') is not null
	drop function Func_COUNT_LopDangKiChuyenDe_TheoMaCD
go

create function Func_COUNT_LopDangKiChuyenDe_TheoMaCD(@MaCD nchar(10))
returns int
as
BEGIN
	declare @count int = 0
	select @count = count(l.MaLop)
	from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
	left join dbo.DANGKY dk on dk.MaDsGvu_CDe = g.MaDsGvu_CDe
	left join dbo.NHOM nh on nh.MaNhom = dk.MaNhom 
	left join dbo.LOP l on l.MaLop = nh.MaLop 
	where cd.MaCD = @MaCD
	group by cd.MaCD
	return @count
END
go



declare @t int 
set @t = dbo.f(N'CD001')
print @t

select cd.MaCD,cd.TenCD, g.MaDsGvu_CDe, g.TgMo, g.TgianKt, g.Loai , l.MaLop, dk.MaSoSV
from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
	left join dbo.DANGKY dk on dk.MaDsGvu_CDe = g.MaDsGvu_CDe
	left join dbo.NHOM nh on nh.MaNhom = dk.MaNhom 
	left join dbo.LOP l on l.MaLop = nh.MaLop 
order by cd.MaCD asc

select cd.MaCD,cd.TenCD, g.MaDsGvu_CDe, g.TgMo, g.TgianKt, g.Loai 
from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
order by cd.MaCD asc

if OBJECT_ID('Func_TABLE_DanhSachMoDKChuyenDe','tf') is not null
	drop function Func_TABLE_DanhSachMoDKChuyenDe
go

create function Func_TABLE_DanhSachMoDKChuyenDe()
returns @tb table(MaCD nchar(10), TenCD nvarchar(50), MaDsGvu_CDe int, TgMo datetime, TgianKt datetime, Loai int, 
SoLopDangKi int, SoSinhVienDangKi int)
as
BEGIN
	
	declare @SoLopDK int = 0
	declare @SoSVDK int = 0 
	--khai báo con trỏ
	declare cur cursor for select cd.MaCD,cd.TenCD, g.MaDsGvu_CDe, g.TgMo, g.TgianKt, g.Loai 
							from dbo.DsGvu_CDe g right join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
							order by cd.MaCD asc

	declare @CMaCD nchar(10) 
	declare @CTenCD nvarchar(50)
	declare @CMaDsGvu_CDe int
	declare @CTgMo datetime
	declare @CTgianKt datetime
	declare @CLoai int
	--mở con trỏ
	open cur
	--nạp con trỏ
	fetch next from cur into @CMaCD, @CTenCD, @CMaDsGvu_CDe, @CTgMo, @CTgianKt, @CLoai
	while(@@fetch_status = 0 )
		begin
			set @SoLopDK = dbo.Func_COUNT_LopDangKiChuyenDe_TheoMaCD(@CMaCD)
			set @SoSVDK = dbo.Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD(@CMaCD)

			insert into @tb
			values(@CMaCD, @CTenCD, @CMaDsGvu_CDe, @CTgMo, @CTgianKt, @CLoai, @SoLopDK, @SoSVDK)
			fetch next from cur into @CMaCD, @CTenCD, @CMaDsGvu_CDe, @CTgMo, @CTgianKt, @CLoai
		end
		close cur 
		deallocate cur
	return 
END
go


select * from dbo.Func_TABLE_DanhSachMoDKChuyenDe()
-- proc cập nhật mở đăng kí chuyên đề theo mã chuyên đề, 1: đang mở, 0: vô hiệu hoá
if OBJECT_ID('Proc_SELECT_DanhSachMoDKChuyenDe', 'p') is not null
	drop procedure Proc_SELECT_DanhSachMoDKChuyenDe
go

create procedure Proc_SELECT_DanhSachMoDKChuyenDe
as
BEGIN
	select * from dbo.Func_TABLE_DanhSachMoDKChuyenDe()
END
go

execute dbo.Proc_SELECT_DanhSachMoDKChuyenDe

select TgMo, TgianKt from dbo.DsGvu_CDe

select * from dbo.CHUYENDE

declare @i int = 1
declare @_mcd nchar(10)

set @_mcd = 'CD00' + cast(@i as varchar(8))
while (exists (select * from dbo.CHUYENDE where MaCD = @_mcd))
BEGIN
 set @i+=1
 if (@i >= 0 and @i < 10)
	begin
		set @_mcd = 'CD00' + cast(@i as varchar(8))
	end
 if (@i >= 10 and @i < 100)
	begin
		set @_mcd = 'CD0' + cast(@i as varchar(8))
	end
 
 print @_mcd
END

-- func tạo tự động mã chuyên đề
if OBJECT_ID('Func_TaoTuDong_MaChuyenDe', 'fn') is not null
	drop function Func_TaoTuDong_MaChuyenDe
go

create function Func_TaoTuDong_MaChuyenDe()
returns nchar(10)
as
BEGIN
	declare @i int = 1
	declare @_mcd nchar(10)
	set @_mcd = 'CD00' + cast(@i as varchar(8))
	while (exists (select * from dbo.CHUYENDE where MaCD = @_mcd))
	BEGIN
	 set @i+=1
	 if (@i >= 0 and @i < 10)
		begin
			set @_mcd = 'CD00' + cast(@i as varchar(8))
		end
	 if (@i >= 10 and @i < 100)
		begin
			set @_mcd = 'CD0' + cast(@i as varchar(8))
		end
	END
	return @_mcd
END
go

declare @_mcd2 nchar(10)
set @_mcd2 = dbo.Func_TaoTuDong_MaChuyenDe()
print @_mcd2

