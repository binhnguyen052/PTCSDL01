USE QLDKCD
go


use QLDKCD
go

-- ========================================start 1660052 SQL=================================================

-- ========================================start TẠO TÀI KHOẢN TỰ ĐỘNG=================================================
if OBJECT_ID('Proc_TAOTK_TUDONG', 'p') is not null
	drop procedure Proc_TAOTK_TUDONG
go

create procedure Proc_TAOTK_TUDONG(@ChucVu nchar(2), @Nganh nchar(2), @KhoaHoc int, @min int, @max int)
as
BEGIN
	declare @MaTK nchar(10)
	declare @MatKhau nchar(10)
	declare @i int = @min
	while(@i <= @max)
		begin
			set @MaTK = cast(@KhoaHoc as nchar(2)) + cast(@Nganh as nchar(2)) + cast (@i as varchar(4))
			--mật khẩu tạm
			set @MatKhau = cast(@KhoaHoc as nchar(2)) + cast(@Nganh as nchar(2)) + cast (@i as varchar(4)) + cast(year(getdate()) as nchar)
			insert into TAIKHOAN(MaTK, MatKhau, ChucVu)
			values(@MaTK, @MatKhau, @ChucVu)
			set @i+=1
		end
END
go


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

