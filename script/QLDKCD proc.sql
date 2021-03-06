﻿USE QLDKCD1
go

-- ========================================start 1660052 SQL=================================================

-- ========================================start Proc và Function khác=================================================

-- proc kiểm tra login: -1: login thất bại
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

-- proc lấy thông tin tài khoản
if OBJECT_ID('Proc_SELECT_TAIKHOAN_SINHVIEN', 'p') is not null
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

-- lấy bảng ngành học
if OBJECT_ID('Proc_SELECT_NganhHoc', 'p') is not null
	drop procedure Proc_SELECT_NganhHoc
go

create procedure Proc_SELECT_NganhHoc
as
BEGIN
	select * from  dbo.NGANH
END
go

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
-- proc xem danh sách mở đăng kí và chuyên đề
if OBJECT_ID('Proc_SELECT_MoDK_CHUYENDE', 'p') is not null
	drop procedure Proc_SELECT_MoDK_CHUYENDE
go

create procedure Proc_SELECT_MoDK_CHUYENDE
as
BEGIN
select g.MaDsGvu_CDe, cd.MaCD, cd.TenCD, g.TgMo, g.TgianKt, g.Loai, g.MaGVu, cd.TgHoc, cd.Deadline, g.NienKhoa, g.SoHK, cd.SoChi
from dbo.DsGvu_CDe g join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
END
go

-- proc xem danh sách mở đăng kí và chuyên đề theo mã chuyên đề
if OBJECT_ID('Proc_SELECT_MoDK_CHUYENDE_BY_MACD', 'p') is not null
	drop procedure Proc_SELECT_MoDK_CHUYENDE_BY_MACD
go

create procedure Proc_SELECT_MoDK_CHUYENDE_BY_MACD(@MaCD nchar(10))
as
BEGIN
select g.MaDsGvu_CDe, cd.MaCD, cd.TenCD, g.TgMo, g.TgianKt, g.Loai, g.MaGVu, cd.TgHoc, cd.Deadline, g.NienKhoa, g.SoHK, cd.SoChi
from dbo.DsGvu_CDe g join dbo.CHUYENDE cd on g.MaCD = cd.MaCD 
where g.MaCD = @MaCD
END
go

-- proc cập nhậ mở đăng kí chuyên đề theo mã chuyên đề, 1: đang mở, 0: vô hiệu hoá
if OBJECT_ID('Proc_UPDATE_LOAI_MoDKCHUYENDE_BY_MACD', 'p') is not null
	drop procedure Proc_UPDATE_LOAI_MoDKCHUYENDE_BY_MACD
go

create procedure Proc_UPDATE_LOAI_MoDKCHUYENDE_BY_MACD(@MaCD nchar(10), @Loai int)
as
BEGIN
if (@Loai != 0) begin set @Loai = 1 end
update dbo.DsGvu_CDe 
set Loai = @Loai
where MaCD = @MaCD
END
go


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

