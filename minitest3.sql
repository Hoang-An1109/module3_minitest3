create database minitest3;

use minitest3;

create table Vattu(
id int primary key,
ma_vat_tu int ,
ten_vat_tu varchar(255),
don_vi_tinh varchar(255),
gia_tien double
);

create table Tonkho(
id int primary key,
vat_tu_id int,
so_luong_dau double,
tong_so_luong_nhap int,
tong_so_luong_xuat int,
foreign key(vat_tu_id) references Vattu(id)
);

create table Nhacungcap(
id int primary key,
ma_nha_cung_cap int,
ten_nha_cung_cap varchar(255),
dia_chi varchar(255),
so_dien_thoai int
);

create table Dondathang(
id int primary key,
ma_don int,
ngay_dat_hang date,
nha_cung_cap_id int,
foreign key(nha_cung_cap_id) references Nhacungcap(id)
);

create table Phieunhap(
id int primary key,
so_phieu_nhap int,
ngay_nhap date,
don_hang_id int,
foreign key(don_hang_id) references Dondathang(id)
);

create table Phieuxuat(
id int primary key,
ngay_xuat date,
ten_khach_hang varchar(255)
);

create table CTDonhang(
id int primary key,
don_hang_id int,
vat_tu_id int,
so_luong_dat int,
foreign key(don_hang_id) references Dondathang(id),
foreign key(vat_tu_id) references Vattu(id)
);

create table CTPhieunhap(
id int primary key,
phieu_nhap_id int,
vat_tu_id int,
so_luong_nhap int,
don_gia_nhap double,
ghi_chu varchar(255),
foreign key(phieu_nhap_id) references Phieunhap(id),
foreign key(vat_tu_id) references Vattu(id)
);

create table CTPhieuxuat(
id int primary key,
phieu_xuat_id int,
vat_tu_id int,
so_luong_xuat int,
don_gia_xuat double,
ghi_chu varchar(255),
foreign key(phieu_xuat_id) references Phieuxuat(id),
foreign key(vat_tu_id) references Vattu(id)
);

-- Nhập 5 bản ghi bảng Vattu
insert into Vattu values (1, 123, 'Vật liệu 1', 'Cái', 10.5);
insert into Vattu values (2, 456, 'Vật liệu 2', 'Kg', 20.7);
insert into Vattu values (3, 789, 'Vật liệu 3', 'Hộp', 5.2);
insert into Vattu values (4, 987, 'Vật liệu 4', 'Cây', 15.3);
insert into Vattu values (5, 654, 'Vật liệu 5', 'Thùng', 8.9);

-- Nhập 10 bản ghi bảng Tonkho
insert into Tonkho values (1, 1, 100, 50, 20);
insert into Tonkho values (2, 2, 200, 100, 50);
insert into Tonkho values (3, 3, 150, 80, 40);
insert into Tonkho values (4, 4, 120, 60, 30);
insert into Tonkho values (5, 5, 180, 90, 45);
insert into Tonkho values (6, 1, 120, 60, 30);
insert into Tonkho values (7, 2, 250, 120, 60);
insert into Tonkho values (8, 3, 130, 70, 35);
insert into Tonkho values (9, 4, 140, 70, 35);
insert into Tonkho values (10, 5, 160, 80, 40);

-- Nhập 3 bản ghi bảng Nhacungcap
insert into Nhacungcap values (1, 1001, 'Nhà cung cấp A', 'Địa chỉ A', 123456789);
insert into Nhacungcap values (2, 1002, 'Nhà cung cấp B', 'Địa chỉ B', 987654321);
insert into Nhacungcap values (3, 1003, 'Nhà cung cấp C', 'Địa chỉ C', 456123789);

-- Nhập 3 bản ghi bảng Donhang
insert into Dondathang values (1, 2001, '2024-04-15', 1);
insert into Dondathang values (2, 2002, '2024-04-16', 2);
insert into Dondathang values (3, 2003, '2024-04-17', 3);

-- Nhập 3 bản ghi bảng Phieunhap
insert into Phieunhap values (1, 3001, '2024-04-16', 1);
insert into Phieunhap values (2, 3002, '2024-04-17', 2);
insert into Phieunhap values (3, 3003, '2024-04-18', 3);

-- Nhập 3 bản ghi bảng Phieuxuat
insert into Phieuxuat values (1, '2024-04-17', 'Khách hàng A');
insert into Phieuxuat values (2, '2024-04-18', 'Khách hàng B');
insert into Phieuxuat values (3, '2024-04-19', 'Khách hàng C');

-- Nhập 6 bản ghi bảng CTDonhang
insert into CTDonhang values (1, 1, 1, 20);
insert into CTDonhang values (2, 1, 2, 30);
insert into CTDonhang values (3, 2, 3, 25);
insert into CTDonhang values (4, 2, 4, 15);
insert into CTDonhang values (5, 3, 5, 40);
insert into CTDonhang values (6, 3, 1, 10);

-- Nhập 6 bản ghi bảng CTPhieunhap
insert into CTPhieunhap values (1, 1, 1, 25, 8.5, 'Ghi chú cho bản ghi 1');
insert into CTPhieunhap values (2, 1, 2, 35, 12.3, 'Ghi chú cho bản ghi 2');
insert into CTPhieunhap values (3, 2, 3, 30, 6.7, 'Ghi chú cho bản ghi 3');
insert into CTPhieunhap values (4, 2, 4, 20, 10.2, 'Ghi chú cho bản ghi 4');
insert into CTPhieunhap values (5, 3, 5, 45, 7.8, 'Ghi chú cho bản ghi 5');
insert into CTPhieunhap values (6, 3, 1, 15, 9.1, 'Ghi chú cho bản ghi 6');

-- Nhập 6 bản ghi bảng CTPhieuxuat
insert into CTPhieuxuat values (1, 1, 1, 15, 10.2, 'Ghi chú cho bản ghi 1');
insert into CTPhieuxuat values (2, 1, 2, 25, 15.6, 'Ghi chú cho bản ghi 2');
insert into CTPhieuxuat values (3, 2, 3, 20, 8.3, 'Ghi chú cho bản ghi 3');
insert into CTPhieuxuat values (4, 2, 4, 10, 12.7, 'Ghi chú cho bản ghi 4');
insert into CTPhieuxuat values (5, 3, 5, 35, 9.5, 'Ghi chú cho bản ghi 5');
insert into CTPhieuxuat values (6, 3, 1, 20, 11.8, 'Ghi chú cho bản ghi 6');

-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP as
select pn.so_phieu_nhap, vt.ma_vat_tu, so_luong_nhap, don_gia_nhap, so_luong_nhap*don_gia_nhap as "thanh_tien_nhap" from CTPhieunhap ctpn
inner join Phieunhap pn on ctpn.phieu_nhap_id = pn.id
inner join Vattu vt on ctpn.vat_tu_id = vt.id;

select * from vw_CTPNHAP;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT as
select pn.so_phieu_nhap, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_nhap, don_gia_nhap, so_luong_nhap*don_gia_nhap as "thanh_tien_nhap" from CTPhieunhap ctpn
inner join Phieunhap pn on ctpn.phieu_nhap_id = pn.id
inner join Vattu vt on ctpn.vat_tu_id = vt.id;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: 
-- số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN as
select pn.so_phieu_nhap, pn.ngay_nhap, ddh.ma_don, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_nhap, don_gia_nhap,
 so_luong_nhap*don_gia_nhap as "thanh_tien_nhap" from CTPhieunhap ctpn
inner join Phieunhap pn on ctpn.phieu_nhap_id = pn.id
inner join Dondathang ddh on pn.don_hang_id = ddh.id
inner join Vattu vt on ctpn.vat_tu_id = vt.id;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: 
-- số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN_DH as
select pn.so_phieu_nhap, pn.ngay_nhap, ddh.ma_don, ncc.ma_nha_cung_cap, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_nhap, don_gia_nhap,
 so_luong_nhap*don_gia_nhap as "thanh_tien_nhap" from CTPhieunhap ctpn
inner join Phieunhap pn on ctpn.phieu_nhap_id = pn.id
inner join Dondathang ddh on pn.don_hang_id = ddh.id
inner join Nhacungcap ncc on ddh.nha_cung_cap_id = ncc.id
inner join Vattu vt on ctpn.vat_tu_id = vt.id;






