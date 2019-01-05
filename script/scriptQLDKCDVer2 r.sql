if object_ID('QLDKCD1') is not null
drop database QLDKCD1
go
create database QLDKCD1
go

use QLDKCD1
go

create table DIACHI 
(
	MaDC int identity primary key,
	SoNha nvarchar(50),
	Quan nvarchar(50) not null default N'Mặc định',
	TP nvarchar(50) not null default N'Mặc định'
)
go

create table NGANH
(
	MaNganh nchar(10) primary key,
	TenNganh nvarchar(50) not null default N'Chưa đặt tên',
	TongSoSV int not null default 0,
	SlCDe int not null default 0
)
go

create table CHUYENDE
(
	MaCD nchar(10) primary key, 
	TenCD nvarchar(50) not null default N'Chưa đặt tên',
	Deadline nvarchar(50),
	SoSVMax int not null default 0,
	MaNganh nchar(10) not null,
	SoChi int,
	TgHoc nvarchar(50),

	foreign key (MaNganh) references NGANH(MaNganh)	
)	
go

create table HOCKY
(
	NienKhoa int not null default 0,
	SoHK int not null default 0,
	NgBD datetime,
	NgKT datetime,

	primary key (NienKhoa, SoHK)
)
go

create table TAIKHOAN
(
	MaTK nchar(10) primary key,
	MatKhau nvarchar(max) not null default 'admin',
	ChucVu int not null default 0  
)
go

create table LOP
(
	MaLop nchar(10) primary key,
	SoNhomMax int not null default 0
)
go

create table SINHVIEN
(
	MaSoSV nchar(10) primary key,
	HoTen nvarchar(50) not null default N'Chưa đặt tên',
	Phai nvarchar(10) not null default N'Giới tính',
	NgSinh datetime not null default '1/1/1',
	MaDC int not null,
	MaNganh nchar(10) not null,
	MaTK nchar(10),
	KhoaHoc int,
	-- MaLop nchar(10),
	foreign key (MaDC) references DIACHI(MaDC),
	foreign key (MaNganh) references NGANH(MaNganh),
	foreign key (MaTK) references TAIKHOAN(MaTK),
	-- foreign key (MaLop) references LOP(MaLop)
)
go

create table GIAOVIEN
(
	MaGV nchar(10) primary key,
	HoTen nvarchar(50) not null default N'Chưa đặt tên',
	Phai nvarchar(10) not null default N'Giới tính',
	NgSinh datetime not null default '1/1/1',
	MaDC int not null,
	MaTK nchar(10),
	MaNganh nchar(10) not null,

	foreign key (MaDC) references DIACHI(MaDC),
	foreign key (MaTK) references TAIKHOAN(MaTK),
	foreign key (MaNganh) references NGANH(MaNganh)
)
go

create table GIAOVU
(
	MaGVu nchar(10) primary key,
	HoTen nvarchar(50) not null default N'Chưa đặt tên',
	Phai nvarchar(10) not null default N'Giới tính',
	NgSinh datetime not null default '1/1/1',
	MaDC int not null,
	MaTK nchar(10),

	foreign key (MaDC) references DIACHI(MaDC),
	foreign key (MaTK) references TAIKHOAN(MaTK)
)
go


create table NHOM
(
	MaNhom int identity primary key,
	TenNhom nvarchar(50) not null default N'Chưa đặt tên',
	MaLop nchar(10) not null,

	foreign key (MaLop) references LOP(MaLOP)
)
go

create table PHUTRACH
(
	MaPhuTrach int identity primary key,
	MaCD nchar(10) not null,
	MaGV nchar(10) not null,

	foreign key (MaCD) references CHUYENDE(MaCD),
	foreign key (MaGV) references GIAOVIEN(MaGV)
)
go

create table DsGvu_CDe
(
	MaDsGvu_CDe int identity primary key,
	TgMo datetime not null default '01/01/2018 08:00:00',
	TgianKt datetime not null default '10/01/2018 08:00:00',
	Loai int,
	MaCD nchar(10) not null,
	MaGVu nchar(10) not null,
	NienKhoa int not null,
	SoHK int not null,

	foreign key (MaCD) references CHUYENDE(MaCD),
	foreign key (MaGVu) references GIAOVU(MaGVu),
	foreign key (NienKhoa, SoHK) references HOCKY(NienKhoa, SoHK)
)
go

create table DANGKY
(
	MaDK int identity primary key,
	MaDsGvu_CDe int not null,
	MaSoSV nchar(10) not null,
	MaNhom int,
	Diem float,
	TgianDK datetime not null default '05/01/2018 08:00:00', 

	foreign key (MaDsGvu_CDe) references DsGvu_CDe(MaDsGvu_CDe),
	foreign key (MaSoSV) references SINHVIEN(MaSoSV),
	foreign key (MaNhom) references Nhom(MaNhom)
)
go


--DIACHI
insert DIACHI(SoNha, Quan, TP) values ('1/10', N'Quận 1', N'Hồ Chí Minh')
insert DIACHI(SoNha, Quan, TP) values ('15/3', N'Quận 12', N'Hồ Chí Minh')
insert DIACHI(SoNha, Quan, TP) values ('16/10', N'Quận 5', N'Hà Nội')
insert DIACHI(SoNha, Quan, TP) values ('20/108', N'Quận Tân Bình', N'Hồ Chí Minh')
insert DIACHI(SoNha, Quan, TP) values ('35/10/20', N'Quận Ba Đình', N'Hà Nội')

--NGANH
insert NGANH(MaNganh, TenNganh, TongSoSV, SlCDe) values ('NG001', N'Công Nghệ Thông Tin', 500, 4)
insert NGANH(MaNganh, TenNganh, TongSoSV, SlCDe) values ('NG002', N'Vật Lý', 100, 5)
insert NGANH(MaNganh, TenNganh, TongSoSV, SlCDe) values ('NG003', N'Hóa Học', 100, 5)
insert NGANH(MaNganh, TenNganh, TongSoSV, SlCDe) values ('NG004', N'Toán Học', 70, 4)

--CHUYENDE
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD001', N'Nhập môn lập trình', null, 100, 'NG001', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD002', N'Lập trình hướng đối tượng', null, 100, 'NG001', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD003', N'Thông minh nhân tạo', null, 80, 'NG001', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD004', N'Hệ điều hành', null, 80, 'NG001', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD005', N'Điện tử căn bản', null, 100, 'NG002', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD006', N'Cơ lượng tử', null, 100, 'NG002', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD007', N'Điện từ quang', null, 80, 'NG002', 3)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD008', N'Vật lý thống kê', null, 80, 'NG002', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD009', N'Thiên văn học', null, 50, 'NG002', 3)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD010', N'Hóa vô cơ', null, 100, 'NG003', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD011', N'Hóa hữu cơ', null, 100, 'NG003', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD012', N'Hóa sinh lý', null, 80, 'NG003', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD013', N'Hóa đại cương', null, 80, 'NG003', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD014', N'Hệ điều hành', null, 80, 'NG003', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD015', N'Giải tích', null, 100, 'NG004', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD016', N'Đại số', null, 100, 'NG004', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD017', N'Toán rời rạc', null, 80, 'NG004', 4)
insert CHUYENDE(MaCD, TenCD, Deadline, SoSVMax, MaNganh, SoChi) values('CD088', N'Xác suất thống kê', null, 80, 'NG004', 4)

--TAIKHOAN
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('admin', 'admin', 0)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('giaovu1', 'admin', 1)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('giaovu2', 'admin', 1)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('giaovien1', 'admin', 2)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('giaovien2', 'admin', 2)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('giaovien3', 'admin', 2)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('giaovien4', 'admin', 2)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('sinhvien1', 'admin', 3)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('sinhvien2', 'admin', 3)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('sinhvien3', 'admin', 3)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('sinhvien4', 'admin', 3)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('sinhvien5', 'admin', 3)
insert TAIKHOAN(MaTK, MatKhau, ChucVu) values ('sinhvien6', 'admin', 3)

--LOP
insert LOP(MaLop, SoNhomMax) 
values 
('LH001', 8),
('LH002', 8)

--('17CNTT1', 8),
--('17CNTT2', 8),
--('18CNTT1', 8),
--('18CNTT2', 8),

--('17VL1', 8),
--('17VL2', 8),
--('18VL1', 8),
--('18VL2', 8),

--('17HH1', 8),
--('17HH2', 8),
--('18HH1', 8),
--('18HH2', 8),

--('17TH1', 8),
--('17TH2', 8),
--('18TH1', 8),
--('18TH2', 8)

--NHOM
insert NHOM(TenNhom, MaLop) 
values 
('A', 'LH001'),
('B', 'LH001'),
('A', 'LH002'),
('B', 'LH002')

--('N1', '17CNTT1'),
--('N2', '17CNTT2'),
--('N1', '18CNTT1'),
--('N2', '18CNTT2'),

--('N1', '17VL1'),
--('N2', '17VL2'),
--('N1', '18VL1'),
--('N2', '18VL2'),

--('N1', '17HH1'),
--('N2', '17HH2'),
--('N1', '18HH1'),
--('N2', '18HH2'),

--('N1', '17TH1'),
--('N2', '17TH2'),
--('N1', '18TH1'),
--('N2', '18TH2')


--SINHVIEN
insert SINHVIEN(MaSoSV, HoTen, Phai, NgSinh, MaDC, MaNganh) 
values
('SV001', N'Phạm Văn A', N'Nam', '1996/01/13', 1, 'NG001'),
('SV002', N'Phạm Văn B', N'Nam', '1997/08/20', 2, 'NG001'),
('SV003', N'Phạm Thị C', N'Nữ', '1996/06/01', 5, 'NG002'),
('SV004', N'Phạm Văn D', N'Nam', '1995/05/18', 3, 'NG003'),
('SV005', N'Phạm Thị E', N'Nữ', '1998/12/14', 4, 'NG002'),
('SV006', N'Phạm Thị F', N'Nữ', '1993/01/25', 1, 'NG004'),
('SV007', N'Phạm Văn G', N'Nam', '1996/01/13', 1, 'NG001'),
('SV008', N'Phạm Văn H', N'Nam', '1997/08/20', 2, 'NG001'),
('SV009', N'Phạm Thị I', N'Nữ', '1996/06/01', 5, 'NG002'),
('SV0010', N'Phạm Văn J', N'Nam', '1995/05/18', 3, 'NG003'),
('SV0011', N'Phạm Thị K', N'Nữ', '1998/12/14', 4, 'NG002'),
('SV0012', N'Phạm Thị L', N'Nữ', '1993/01/25', 1, 'NG004')

insert SINHVIEN(MaSoSV, HoTen, Phai, NgSinh, MaDC, MaNganh, KhoaHoc) 
values
('1701001', N'Phạm Văn 711', N'Nam', '1996/01/13', 1, 'NG001', 2017),
('1701002', N'Phạm Văn 712', N'Nam', '1997/08/20', 2, 'NG001', 2017),
('1801001', N'Phạm Văn 811', N'Nam', '1996/01/13', 1, 'NG001', 2018),
('1801002', N'Phạm Văn 812', N'Nam', '1997/08/20', 2, 'NG001', 2018),

('1702001', N'Phạm Thị 721', N'Nữ', '1996/06/01', 5, 'NG002', 2017),
('1702002', N'Phạm Văn 721', N'Nam', '1995/05/18', 3, 'NG002', 2017),
('1802001', N'Phạm Thị 821', N'Nữ', '1998/12/14', 4, 'NG002', 2018),
('1802002', N'Phạm Thị 821', N'Nữ', '1993/01/25', 1, 'NG002', 2018),

('1703001', N'Phạm Văn 731', N'Nam', '1996/01/13', 1, 'NG003', 2017),
('1703002', N'Phạm Văn 731', N'Nam', '1997/08/20', 2, 'NG003', 2017),
('1803001', N'Phạm Thị 831', N'Nữ', '1996/06/01', 5, 'NG003', 2018),
('1803002', N'Phạm Thị 831', N'Nữ', '1998/12/14', 4, 'NG003', 2018),

('1704001', N'Phạm Văn 741', N'Nam', '1995/05/18', 3, 'NG004', 2017),
('1704002', N'Phạm Thị 741', N'Nữ', '1993/01/25', 1, 'NG004', 2017),
('1804001', N'Phạm Văn 841', N'Nam', '1995/05/18', 3, 'NG004', 2018),
('1804002', N'Phạm Thị 841', N'Nữ', '1993/01/25', 1, 'NG004', 2018)


--HOCKY
insert HOCKY(NienKhoa, SoHK, NgBD, NgKT) values (2017, 1, '2017/01/01', '2014/06/01')
insert HOCKY(NienKhoa, SoHK, NgBD, NgKT) values (2017, 2, '2017/09/01', '2014/12/31')
insert HOCKY(NienKhoa, SoHK, NgBD, NgKT) values (2018, 1, '2018/01/01', '2018/06/01')
insert HOCKY(NienKhoa, SoHK, NgBD, NgKT) values (2018, 2, '2018/09/01', '2018/12/31')

--GIAOVIEN
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV001', N'Phạm Văn A', N'Nam', '1980/12/01', '1', 'NG001')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV002', N'Phạm Thị B', N'Nữ', '1982/01/15', '5', 'NG002')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV003', N'Phạm Văn C', N'Nam', '1975/02/28', '4', 'NG003')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV004', N'Phạm Thị D', N'Nữ', '1983/03/31', '2', 'NG004')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV005', N'Phạm Văn E', N'Nam', '1980/12/01', '1', 'NG001')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV006', N'Phạm Thị F', N'Nữ', '1982/01/15', '5', 'NG002')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV007', N'Phạm Văn G', N'Nam', '1975/02/28', '4', 'NG003')
insert GIAOVIEN(MaGV, HoTen, Phai, NgSinh, MaDC, MaNganh) values ('GV008', N'Phạm Thị H', N'Nữ', '1983/03/31', '2', 'NG004')

--GIAOVU
insert GIAOVU(MaGVu, HoTen, Phai, NgSinh, MaDC) values ('GVU001', N'Huỳnh Văn A', N'Nam', '1980/12/01', '1')
insert GIAOVU(MaGVu, HoTen, Phai, NgSinh, MaDC) values ('GVU002', N'Huỳnh Thị B', N'Nữ', '1986/02/22', '5')


--PHUTRACH
insert PHUTRACH(MaCD, MaGV) values ('CD001', 'GV001')
insert PHUTRACH(MaCD, MaGV) values ('CD002', 'GV002')
insert PHUTRACH(MaCD, MaGV) values ('CD005', 'GV003')
insert PHUTRACH(MaCD, MaGV) values ('CD006', 'GV004')

--DsGvu_CDe
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD001', 1, 'GVU001',2017,1)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD002', 1, 'GVU001',2017,1)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD003', 0, 'GVU001',2017,1)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD004', 0, 'GVU001',2017,1)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD009', 1, 'GVU002',2018,1)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD010', 1, 'GVU002',2018,1)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD011', 0, 'GVU002',2018,2)
insert DsGvu_CDe(MaCD, Loai, MaGVu, NienKhoa, SoHK) values ('CD012', 1, 'GVU002',2018,2)

--DANGKY
insert DANGKY(MaDsGvu_CDe, MaSoSV, MaNhom) values (1, 'SV001', 1)
insert DANGKY(MaDsGvu_CDe, MaSoSV, MaNhom) values (1, 'SV002', 3)
insert DANGKY(MaDsGvu_CDe, MaSoSV, MaNhom) values (3, 'SV003', 2)
insert DANGKY(MaDsGvu_CDe, MaSoSV, MaNhom) values (2, 'SV004', 1)
insert DANGKY(MaDsGvu_CDe, MaSoSV, MaNhom) values (4, 'SV005', 1)
insert DANGKY(MaDsGvu_CDe, MaSoSV, MaNhom) values (2, 'SV006', 2)


