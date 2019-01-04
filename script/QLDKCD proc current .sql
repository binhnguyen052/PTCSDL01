use QLDKCD1
go


-- func kiểm tra login: -1: login thất bại
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


-- ====== NGÀNH ======

-- proc lấy danh sách ngành
if OBJECT_ID('Proc_SELECT_NGANH', 'p') is not null
	drop procedure Proc_SELECT_NGANH
go

create procedure Proc_SELECT_NGANH
as
BEGIN
	select * from dbo.NGANH
END
go

-- ====== CHUYÊN ĐỀ ======

-- proc lấy danh sách chuyên đề
if OBJECT_ID('Proc_SELECT_CHUYENDE', 'p') is not null
	drop procedure Proc_SELECT_CHUYENDE
go

create procedure Proc_SELECT_CHUYENDE
as
BEGIN
select * from dbo.CHUYENDE
END
go

-- proc cập nhật mở đăng kí chuyên đề theo mã chuyên đề, 1: đang mở, 0: vô hiệu hoá
if OBJECT_ID('Proc_UPDATE_MoDKCHUYENDE_BY_MACD', 'p') is not null
	drop procedure Proc_UPDATE_MoDKCHUYENDE_BY_MACD
go

create procedure Proc_UPDATE_MoDKCHUYENDE_BY_MACD(@MaCD nchar(10), @Loai int, @TgMo datetime = null, @TgianKt datetime = null)
as
BEGIN
	if (@Loai != 0) begin set @Loai = 1 end

	if (@MaCD is not null) 
	begin
		update dbo.DsGvu_CDe 
		set Loai = @Loai
		where MaCD = @MaCD
	end

	if (@TgMo is not null)
	begin 
		update dbo.DsGvu_CDe 
		set TgMo = @TgMo
		where MaCD = @MaCD
	end

	if (@TgianKt is not null)
	begin 
		update dbo.DsGvu_CDe 
		set TgianKt = @TgianKt
		where MaCD = @MaCD
	end

END
go

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

-- func đếm số lớp đăng kí chuyên đề
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

-- function trả về 1 bảng danh sách mở đăng kí chuyên đề
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

-- proc xem danh sách mở đăng kí và chuyên đề theo mã chuyên đề
if OBJECT_ID('Proc_SELECT_DanhSachMoDKChuyenDe', 'p') is not null
	drop procedure Proc_SELECT_DanhSachMoDKChuyenDe
go

create procedure Proc_SELECT_DanhSachMoDKChuyenDe
as
BEGIN
	select * from dbo.Func_TABLE_DanhSachMoDKChuyenDe() 
END
go

-- proc xem danh sách mở đăng kí và chuyên đề theo mã chuyên đề
if OBJECT_ID('Proc_SELECT_DanhSachMoDKChuyenDe_BY_MACD', 'p') is not null
	drop procedure Proc_SELECT_DanhSachMoDKChuyenDe_BY_MACD
go

create procedure Proc_SELECT_DanhSachMoDKChuyenDe_BY_MACD(@MaCD nchar(10))
as
BEGIN
	select * from dbo.Func_TABLE_DanhSachMoDKChuyenDe() 
	where MaCD = @MaCD
END
go

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
	if (@i >= 100 and @i < 1000)
		begin
			set @_mcd = 'CD0' + cast(@i as varchar(8))
		end	
	END
	return @_mcd
END
go

-- proc thêm một chuyên đề
if OBJECT_ID('Proc_INSERT_ChuyenDe', 'p') is not null
	drop procedure Proc_INSERT_ChuyenDe
go

create procedure Proc_INSERT_ChuyenDe(@TenCD nvarchar(50), @SoSVMax int, @MaNganh nchar(10),
 @Deadline nvarchar(50) = null, @SoChi int = null, @TgHoc nvarchar(50) = null)
as
BEGIN
	declare @MaCD nchar(10)
	set @MaCD = dbo.Func_TaoTuDong_MaChuyenDe()
	if(exists (select * from dbo.CHUYENDE where TenCD = @TenCD)) begin return end
	insert into dbo.CHUYENDE(MaCD, TenCD, SoSVMax, MaNganh, Deadline, SoChi, TgHoc)
	values (@MaCD, @TenCD, @SoSVMax, @MaNganh, @Deadline, @SoChi, @TgHoc)
END
go

-- proc xoá một chuyên đề
if OBJECT_ID('Proc_DELETE_ChuyenDe_BY_MaCD', 'p') is not null
	drop procedure Proc_DELETE_ChuyenDe_BY_MaCD
go

create procedure Proc_DELETE_ChuyenDe_BY_MaCD(@MaCD nchar(10))
as
BEGIN
	declare @SoSV_DKCD int
	set @SoSV_DKCD = dbo.Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD(@MaCD)
	if(@SoSV_DKCD > 0) begin return end
	else delete from dbo.CHUYENDE where MaCD = @MaCD
END
go

-- function trả về 1 bảng danh sách chuyên đề gồm số lớp đăng kí, số sinh viên đăng kí
if OBJECT_ID('Func_TABLE_DanhSachChuyenDe','tf') is not null
	drop function Func_TABLE_DanhSachChuyenDe
go

create function Func_TABLE_DanhSachChuyenDe()
returns @tb table(MaCD nchar(10), TenCD nvarchar(50), Dealine nvarchar(50), SoSVMax int, MaNganh nchar(10), 
SoChi int, TgHoc nvarchar(50), SoLopDangKi int, SoSinhVienDangKi int)
as
BEGIN
	
	declare @SoLopDK int = 0
	declare @SoSVDK int = 0 
	--khai báo con trỏ
	declare cur cursor for select cd.MaCD, cd.TenCD, cd.Deadline, cd.SoSVMax, cd.MaNganh, cd.SoChi, cd.TgHoc
							from dbo.CHUYENDE cd
							order by cd.MaCD asc

	declare @CMaCD nchar(10) 
	declare @CTenCD nvarchar(50)
	declare @CDeadline nvarchar(50)
	declare @CSoSVMax int
	declare @CMaNganh nchar(10)
	declare @CSoChi int
	declare @CTgHoc nvarchar(50)
	--mở con trỏ
	open cur
	--nạp con trỏ
	fetch next from cur into @CMaCD, @CTenCD, @CDeadline, @CSoSVMax, @CMaNganh, @CSoChi, @CTgHoc
	while(@@fetch_status = 0 )
		begin
			set @SoLopDK = dbo.Func_COUNT_LopDangKiChuyenDe_TheoMaCD(@CMaCD)
			set @SoSVDK = dbo.Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD(@CMaCD)

			insert into @tb
			values(@CMaCD, @CTenCD, @CDeadline, @CSoSVMax, @CMaNganh, @CSoChi, @CTgHoc, @SoLopDK, @SoSVDK)
			fetch next from cur into @CMaCD, @CTenCD, @CDeadline, @CSoSVMax, @CMaNganh, @CSoChi, @CTgHoc
		end
		close cur 
		deallocate cur
	return 
END
go

-- proc xem danh sách chuyên đề
if OBJECT_ID('Proc_SELECT_DanhSachChuyenDe', 'p') is not null
	drop procedure Proc_SELECT_DanhSachChuyenDe
go

create procedure Proc_SELECT_DanhSachChuyenDe
as
BEGIN
	select * from dbo.Func_TABLE_DanhSachChuyenDe() 
END
go

-- proc xem danh sách chuyên đề theo mã chuyên đề
if OBJECT_ID('Proc_SELECT_DanhSachChuyenDe_BY_MACD', 'p') is not null
	drop procedure Proc_SELECT_DanhSachChuyenDe_BY_MACD
go

create procedure Proc_SELECT_DanhSachChuyenDe_BY_MACD(@MaCD nchar(10))
as
BEGIN
	select * from dbo.Func_TABLE_DanhSachChuyenDe() 
	where MaCD = @MaCD
END
go