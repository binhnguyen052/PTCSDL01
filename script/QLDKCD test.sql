use QLDKCD
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