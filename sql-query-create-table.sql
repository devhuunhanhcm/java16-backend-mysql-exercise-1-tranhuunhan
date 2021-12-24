create database if not exists db_QLBanSach;

use db_QLBanSach;

create table if not exists khach_hang(
	ma_khach_hang 		int auto_increment,
	ho_ten 				varchar(255) not null,
    tai_khoan			varchar(255) not null,
    mat_khau 			varchar(255) not null,
    email 				varchar(255) not null,
    dia_chi 			varchar(255) not null,
    dien_thoai 			varchar(20) not null,
    gioi_tinh 			char(5) not null,
    ngay_sinh			date,
    
    primary key (ma_khach_hang)
);
create table if not exists don_hang(
	ma_don_hang 			int auto_increment,
	ngay_dat 				datetime not null,
	ngay_giao 				datetime not null,
    tinh_trang_don_hang 	varchar(255) not null,
    email 					varchar(255) not null,
    da_thanh_toan			bit not null,
    ma_khach_hang 			int not null,
    primary key (ma_don_hang)
);

create table if not exists don_hang_chi_tiet(
	ma_sach			int,
	ma_don_hang 	int,
    so_luong 		int not null,
    don_gia 		float not null,
    primary key (ma_sach,ma_don_hang)
);

create table if not exists sach(
	ma_sach 		int auto_increment,
	gia_sach 		float not null,
	mo_ta 			varchar(255) not null,
    anh_bia			varchar(255) not null,
    ngay_cap_nhat 	datetime not null,
    so_luong_ton 	int not null,
    ma_chu_de 		int not null,
    ma_nxb 			int not null,
    primary key (ma_sach)
);

create table if not exists chu_de(
	ma_chu_de 			int auto_increment,
	ten_chu_de 			varchar(255) not null,
    
    primary key (ma_chu_de)
);
create table if not exists nha_xuat_ban(
	ma_nxb 			int auto_increment,
	ten_nxb			varchar(255) not null,
	dia_chi 		varchar(255) not null,
    dien_thoai 		varchar(20) not null,
    
    primary key (ma_nxb)
);
create table if not exists tac_gia(
	ma_tac_gia 			int auto_increment,
	ten_tac_gia 		varchar(255) not null,
	dia_chi 			varchar(255) not null,
    tieu_su 			varchar(255),
    dien_thoai 			varchar(20) not null,
    
    primary key (ma_tac_gia)
);
create table if not exists chi_tiet_tac_gia(
	ma_tac_gia 		int,
	ma_sach 		int,
	vai_tro 		varchar(255) not null,
    vi_tri 			varchar(255),
    
    primary key (ma_tac_gia,ma_sach)
);
-- tao khoa ngoai
alter table don_hang
	add constraint fk_ma_khach_hang
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang);
    
alter table sach
	add constraint fk_sach_chu_de
    foreign key (ma_chu_de) references chu_de(ma_chu_de);
alter table sach
	add constraint fk_sach_nxb
    foreign key (ma_nxb) references nha_xuat_ban(ma_nxb); 
    
alter table chi_tiet_tac_gia
	add constraint fk_tac_gia
    foreign key (ma_tac_gia) references tac_gia(ma_tac_gia);    
alter table chi_tiet_tac_gia
	add constraint fk_sach
    foreign key (ma_sach) references sach(ma_sach);    

alter table don_hang_chi_tiet
	add constraint fk_ma_don_hang
    foreign key (ma_don_hang) references don_hang(ma_don_hang);    
alter table don_hang_chi_tiet
	add constraint fk_ma_sach
    foreign key (ma_sach) references sach(ma_sach);    
                                


