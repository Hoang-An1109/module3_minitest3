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


-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: 
-- số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
create view vw_CTPNHAP_loc as
select pn.so_phieu_nhap, vt.ma_vat_tu, so_luong_nhap, don_gia_nhap, so_luong_nhap*don_gia_nhap as "thanh_tien_nhap" from CTPhieunhap ctpn
inner join Phieunhap pn on ctpn.phieu_nhap_id = pn.id
inner join Vattu vt on ctpn.vat_tu_id = vt.id
where so_luong_nhap > 5;

-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: 
-- số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
create view vw_CTPNHAP_VT_loc as
select pn.so_phieu_nhap, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_nhap, don_gia_nhap, so_luong_nhap*don_gia_nhap as "thanh_tien_nhap" from CTPhieunhap ctpn
inner join Phieunhap pn on ctpn.phieu_nhap_id = pn.id
inner join Vattu vt on ctpn.vat_tu_id = vt.id
where vt.don_vi_tinh like 'Bộ';

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
create view vw_CTPXUAT as
select count(px.id) as "Số phiếu xuất hàng", vt.ma_vat_tu, so_luong_xuat, don_gia_xuat, so_luong_xuat*don_gia_xuat as " Thành tiền xuất" from ctphieuxuat ctpx
inner join phieuxuat px on ctpx.phieu_xuat_id = px.id
inner join vattu vt on ctpx.vat_tu_id = vt.id
group by px.id, vt.ma_vat_tu, so_luong_xuat, don_gia_xuat, so_luong_xuat*don_gia_xuat;

-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT as
select count(px.id) as "Số phiếu xuất hàng", vt.ma_vat_tu, vt.ten_vat_tu, so_luong_xuat, don_gia_xuat from ctphieuxuat ctpx
inner join phieuxuat px on ctpx.phieu_xuat_id = px.id
inner join vattu vt on ctpx.vat_tu_id = vt.id
group by px.id, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_xuat, don_gia_xuat;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT_PX as
select count(px.id) as "Số phiếu xuất hàng", px.ten_khach_hang, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_xuat, don_gia_xuat from ctphieuxuat ctpx
inner join phieuxuat px on ctpx.phieu_xuat_id = px.id
inner join vattu vt on ctpx.vat_tu_id = vt.id
group by px.id, px.ten_khach_hang, vt.ma_vat_tu, vt.ten_vat_tu, so_luong_xuat, don_gia_xuat;

-- Tạo các stored procedure sau

-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
delimiter //
create procedure tong_so_luong_cuoi(in in_ma_vat_tu int)
begin
	select vt.id, vt.ma_vat_tu, vt.ten_vat_tu, sum(so_luong_dau + tong_so_luong_nhap - tong_so_luong_xuat) as "Tổng số lượng cuối", vt.don_vi_tinh, vt.gia_tien from tonkho tk
	inner join vattu vt on tk.vat_tu_id = vt.id
	where in_ma_vat_tu = vt.ma_vat_tu
	group by vt.id, vt.ma_vat_tu, vt.ten_vat_tu, vt.don_vi_tinh, vt.gia_tien;
end //
delimiter ;

-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
delimiter //
create procedure tong_tien_xuat(in in_ma_vat_tu int)
begin
	select ma_vat_tu, ten_vat_tu, sum(ctpx.so_luong_xuat * ctpx.don_gia_xuat) as "Tổng tiền xuất" from vattu vt
	inner join ctphieuxuat ctpx on ctpx.vat_tu_id = vt.id
	where in_ma_vat_tu = vt.ma_vat_tu
	group by ma_vat_tu, ten_vat_tu;
end //
delimiter ;

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
delimiter //
create procedure tong_so_luong_dat(in in_ma_don int)
begin
	select ma_don, sum(ctdh.so_luong_dat) as "Tổng số lượng đặt" from dondathang ddh
	inner join ctdonhang ctdh on ctdh.don_hang_id = ddh.id 
	where ddh.ma_don = in_ma_don
	group by ma_don;
end //
delimiter ;

-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.
delimiter //
create procedure them_mot_don_hang(in id int, in ma_don int, in ngay_dat_hang date, in nha_cung_cap_id int)
begin
	insert into dondathang values (id, ma_don, ngay_dat_hang, nha_cung_cap_id);
end //
delimiter ;

-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
delimiter //
create procedure them_mot_ct_don_hang(in id int, in don_hang_id int, in vat_tu_id int, so_luong_dat int)
begin
	insert into ctdonhang values (id, don_hang_id, vat_tu_id, so_luong_dat);
end //
delimiter ;

-- Câu 6. Tại SP dùng để xoá 1 nhà cung cấp theo id. Trong đó:
-- 			+Tất cả những khoá ngoại đến nhà cung cấp chuyển thành null
-- 			+Xoá nhà cung cấp.
delimiter //
create procedure xoa_nha_cung_cap (in in_id int)
begin
	update dondathang set nha_cung_cap_id = null where nha_cung_cap_id = in_id;
	delete from nhacungcap where id = in_id;
end //
delimiter ;

insert into Nhacungcap values (10, 1010, 'Nhà cung cấp X', 'Địa chỉ X', 123456789);
insert into Dondathang values (10, 2010, '2024-04-15', 10);


