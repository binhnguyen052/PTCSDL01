USE QLDKCD
go

-- ========================================start 1660052 SQL=================================================

-- ========================================start TẠO TÀI KHOẢN TỰ ĐỘNG=================================================
/*
01: Công Nghệ Thông Tin
02: Vật Lý
03: Hóa Học
04: Toán Học
*/
if OBJECT_ID('Proc_TAOTK_TUDONG', 'p') is not null
	drop procedure Proc_TAOTK_TUDONG
go

create procedure Proc_TAOTK_TUDONG(@ChucVu int, @Nganh char(2), @KhoaHoc int, @Quantity int)
as
BEGIN
	declare @MaTK nchar(10)
	declare @MatKhau nchar(10)
	declare @i int = 1
	declare @na nchar(4)
	while(@i <= @Quantity)
		begin
			if(@i >= 1 and @i < 10)
				set @na = REPLICATE('0', 2) + cast (@i as varchar)
			else if (@i >= 10 and @i < 100)
				set @na = REPLICATE('0', 1) + cast (@i as varchar)
			else if (@i >= 100 and @i < 1000)
				set @na = REPLICATE('0', 0) + cast (@i as varchar)
			set @MaTK = cast(@KhoaHoc as char(2)) + @Nganh + @na
			--mật khẩu tạm: mã ngành và khoá học
			set @MatKhau =  cast (@Nganh as char(2)) + cast(@KhoaHoc as char(2))
			insert into TAIKHOAN(MaTK, MatKhau, ChucVu)
			values(@MaTK, @MatKhau, @ChucVu)
			set @i+=1
		end
END
go

execute dbo.Proc_TAOTK_TUDONG 3, '02', 16, 20 
select * from dbo.TAIKHOAN

execute dbo.Proc_TAOTK_TUDONG 3, '04', 16, 20 

delete from dbo.TAIKHOAN 
where MatKhau = N'0216'

-- proc tìm tài khoản theo nhiều tiêu chí
--if OBJECT_ID('Proc_TAIKHOAN_SELECT_By_ManyCriteria', 'p') is not null
--	drop procedure Proc_TAIKHOAN_SELECT_By_ManyCriteria
--go

--create procedure Proc_TAIKHOAN_SELECT_By_ManyCriteria(@KhoaHoc int = -1, @Nganh char(2) = null, @ChucVu int = -1)
--as
--BEGIN

--END
--go

declare @KhoaHoc char(2) = '2'
if (@KhoaHoc is null) print 'no' else print 'ok'

declare @_nganh char(2) = '04'

select * 
from dbo.TAIKHOAN tk
where tk.MaTK like '__' + @_nganh + '%'




-- ========================================start TÀI KHOẢN =================================================
-- proc để xem danh sách TAIKHOAN
if OBJECT_ID('Proc_TAIKHOAN_SELECT_All', 'p') is not null
	drop procedure Proc_TAIKHOAN_SELECT_All
go

create procedure Proc_TAIKHOAN_SELECT_All
as
BEGIN
   SELECT * FROM TAIKHOAN
END
go

-- proc để xem danh sách TAIKHOAN theo MaTK
if OBJECT_ID('Proc_TAIKHOAN_SELECT_ByMaTK', 'p') is not null
	drop procedure Proc_TAIKHOAN_SELECT_ByMaTK
go

create procedure Proc_TAIKHOAN_SELECT_ByMaTK (@MaTK nchar(10))
as
BEGIN
   SELECT * FROM TAIKHOAN where MaTK = @MaTK
END
go

-- proc để xem danh sách TAIKHOAN theo LoaiTaiKhoan
if OBJECT_ID('Proc_TAIKHOAN_SELECT_ByChucVu', 'p') is not null
	drop procedure Proc_TAIKHOAN_SELECT_ByChucVu
go

create procedure Proc_TAIKHOAN_SELECT_ByChucVu (@ChucVu int)
as
BEGIN
   SELECT * FROM TAIKHOAN where ChucVu = @ChucVu
END
go

-- proc để thêm dữ liệu vào bảng TAIKHOAN
if OBJECT_ID('Proc_TAIKHOAN_INSERT', 'p') is not null
	drop procedure Proc_TAIKHOAN_INSERT
go

create procedure Proc_TAIKHOAN_INSERT (@MaTK nchar(10), @MatKhau nchar(10), @ChucVu int)
as
BEGIN
   insert into TAIKHOAN(MaTK, MatKhau, ChucVu)
   values(@MaTK, @MatKhau, @ChucVu)
END
go

-- proc để thay đổi dữ liệu vào bảng TAIKHOAN
if OBJECT_ID('Proc_TAIKHOAN_UPDATE_ByMaTK', 'p') is not null
	drop procedure Proc_TAIKHOAN_UPDATE_ByMaTK
go

create procedure Proc_TAIKHOAN_UPDATE_ByMaTK (@MaTK nchar(10), @MatKhau nchar(10), @ChucVu int)
as
BEGIN
   update TAIKHOAN
   set MaTK = @MaTK, MatKhau = @MatKhau, ChucVu = @ChucVu
   where MaTK = @MaTK
END
go

-- proc để thay đổi dữ liệu vào bảng TAIKHOAN
if OBJECT_ID('Proc_TAIKHOAN_DELETE_ByMaTK', 'p') is not null
	drop procedure Proc_TAIKHOAN_DELETE_ByMaTK
go

create procedure Proc_TAIKHOAN_DELETE_ByMaTK (@MaTK nchar(10))
as
BEGIN
   delete from TAIKHOAN where MaTK = @MaTK
END
go

-- ========================================start CHUYÊN ĐỀ =================================================
-- proc để xem danh sách CHUYENDE
if OBJECT_ID('Proc_CHUYENDE_SELECT_All', 'p') is not null
	drop procedure Proc_CHUYENDE_SELECT_All
go

create procedure Proc_CHUYENDEN_SELECT_All
as
BEGIN
   SELECT * FROM CHUYENDE
END
go

-- proc để xem danh sách CHUYENDE theo MaCD
if OBJECT_ID('Proc_CHUYENDE_SELECT_ByMaCD', 'p') is not null
	drop procedure Proc_CHUYENDE_SELECT_ByMaCD
go

create procedure Proc_CHUYENDE_SELECT_ByMaCD (@MaCD nchar(10))
as
BEGIN
   SELECT * FROM CHUYENDE where MaCD = @MaCD
END
go

-- proc để xem danh sách CHUYENDE theo TenCD
if OBJECT_ID('Proc_CHUYENDE_SELECT_ByTenCD', 'p') is not null
	drop procedure Proc_CHUYENDE_SELECT_ByTenCD
go

create procedure Proc_CHUYENDE_SELECT_ByTenCD (@TenCD nvarchar(50))
as
BEGIN
   SELECT * FROM CHUYENDE where TenCD = @TenCD
END
go

-- proc để thêm dữ liệu vào bảng CHUYENDE
if OBJECT_ID('Proc_CHUYENDE_INSERT', 'p') is not null
	drop procedure Proc_CHUYENDE_INSERT
go

create procedure Proc_CHUYENDE_INSERT (@MaCD nchar(10), @TenCD nvarchar(50), @Deadline nvarchar(50), @SoSVMax int, @MaNganh nchar(10), @SoChi int)
as
BEGIN
   insert into CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi)
   values(@MaCD, @TenCD, @Deadline, @SoSVMax, @MaNganh, @SoChi)
END
go

-- proc để thay đổi dữ liệu vào bảng CHUYENDE
if OBJECT_ID('Proc_CHUYENDE_UPDATE_ByMaCD', 'p') is not null
	drop procedure Proc_CHUYENDE_UPDATE_ByMaCD
go

create procedure Proc_CHUYENDE_UPDATE_ByMaCD
(@MaCD nchar(10), @TenCD nvarchar(50), @Deadline nvarchar(50), @SoSVMax int, @MaNganh nchar(10), @SoChi int)
as
BEGIN
   update CHUYENDE
   set MaCD = @MaCD, @TenCD = @TenCD, Deadline = @Deadline, SoSVMax = @SoSVMax, MaNganh = @MaNganh,SoChi = @SoChi
   where MaCD = @MaCD
END
go

-- proc để thay đổi dữ liệu vào bảng CHUYENDE
if OBJECT_ID('Proc_CHUYENDE_DELETE_ByMaCD', 'p') is not null
	drop procedure Proc_CHUYENDE_DELETE_ByMaCD 
go

create procedure Proc_CHUYENDE_DELETE_ByMaCD  (@MaCD nchar(10))
as
BEGIN
   delete from CHUYENDE where MaCD = @MaCD 
END
go


-- ========================================start MÔN HỌC =================================================

	 --select * from CHUYENDE
	 -- select * from MODK

	 -- --chưa mở đăng kí
	 -- select MaCD from CHUYENDE
	 -- except
	 -- select MaCD from MODK

-- ========================================start XEM KẾT QUẢ ĐĂNG KÍ =================================================
-- proc để xem danh sách XEM KẾT QUẢ ĐĂNG KÍ
if OBJECT_ID('Proc_XEMKQDK_SELECT_All', 'p') is not null
	drop procedure Proc_XEMKQDK_SELECT_All
go

create procedure Proc_XEMKQDK_SELECT_All
as
BEGIN
   select mdk.MaMoDK, mdk.MaCD, cd.TenCD, mdk.MaGVu, dk.MaSoSV
	from dbo.MODK mdk join dbo.CHUYENDE cd on mdk.MaCD = cd.MaCD
	join DANGKY dk on dk.MaDK = mdk.MaMoDK 
END
go


-- proc để xem danh sách XEM KẾT QUẢ ĐĂNG KÍ theo MaCD
if OBJECT_ID('Proc_XEMKQDK_SELECT_ByMaCD', 'p') is not null
	drop procedure Proc_XEMKQDK_SELECT_ByMaCD
go

create procedure Proc_XEMKQDK_SELECT_ByMaCD	(@MaCD nchar(10))
as
BEGIN
	select mdk.MaMoDK, mdk.MaCD, cd.TenCD, mdk.MaGVu, dk.MaSoSV
	from dbo.MODK mdk join dbo.CHUYENDE cd on mdk.MaCD = cd.MaCD
	join DANGKY dk on dk.MaDK = mdk.MaMoDK
	where mdk.MaCD = @MaCD 
END
go

-- proc để xem danh sách XEM KẾT QUẢ ĐĂNG KÍ theo MaSoSV
if OBJECT_ID('Proc_XEMKQDK_SELECT_ByMaSoSV', 'p') is not null
	drop procedure Proc_XEMKQDK_SELECT_ByMaSoSV
go

create procedure Proc_XEMKQDK_SELECT_ByMaSoSV (@MaSoSV nchar(10))
as
BEGIN
	select mdk.MaMoDK, mdk.MaCD, cd.TenCD, mdk.MaGVu, dk.MaSoSV
	from dbo.MODK mdk join dbo.CHUYENDE cd on mdk.MaCD = cd.MaCD
	join DANGKY dk on dk.MaDK = mdk.MaMoDK
	where dk.MaSoSV = @MaSoSV 
END
go

