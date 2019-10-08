alter proc sp_insertMhs
@nim varchar(50),
@nama varchar(50),
@tmp_lahir varchar(50),
@tgl_lahir date,
@prodi varchar(50),
@alamat varchar(100),
@email varchar(50),
@nohp varchar(15)
as
begin
	insert into Mahasiswa values (@nim,@nama,@tmp_lahir,@tgl_lahir,@prodi,
		@alamat,@email,@nohp,'Aktif')
end


alter proc sp_UpdateMhs
@nim varchar(50),
@nama varchar(50),
@tmp_lahir varchar(50),
@tgl_lahir date,
@prodi varchar(50),
@alamat varchar(100),
@email varchar(50),
@nohp varchar(15)
as
begin
	update Mahasiswa set
	nama = @nama,
	tmp_lahir = @tmp_lahir,
	tgl_lahir = @tgl_lahir,
	prodi = @prodi,
	alamat =@alamat,
	email = @email,
	nohp = @nohp
	where nim = @nim
end



alter proc sp_DeleteMhs
@nim varchar(50)
as
begin
	update Mahasiswa set
	status = 'Nonaktif'
	where nim = @nim
end

alter proc sp_SelectMhs
@nama varchar(50),
@prodi varchar(50),
@alamat varchar(100)
as
begin
	select * from Mahasiswa where status = 'Aktif' and nama LIKE '%'+@nama+'%' or prodi LIKE '%'+@prodi+'%' and status = 'Aktif' or alamat LIKE '%'+@alamat+'%' and status = 'Aktif'
end
------------------------------------------CREATE PROCEDURE Mata Kuliah
alter proc sp_insertMatkul
@id_matkul varchar(30),
@nama_matkul varchar(50)
as
begin
	insert into MataKuliah values (@id_matkul,@nama_matkul,'Aktif')
end

create proc sp_UpdateMatkul
@id_matkul varchar(30),
@nama_matkul varchar(50)
as
begin
	update MataKuliah set
	nama_matkul = @nama_matkul
	where id_matkul = @id_matkul
end

create proc sp_deleteMatkul
@id_matkul varchar(30)
as
begin
	update MataKuliah set
	status = 'Nonaktif'
	where id_matkul = @id_matkul
end

alter proc sp_selectMatkul
@nama_matkul varchar(50)
as
begin
	select * from MataKuliah where status = 'Aktif' and nama_matkul LIKE '%'+@nama_matkul+'%'
end

-------------------------------------CREATE NILAI
create proc sp_insertNilai
@nim varchar(50),
@id_matkul varchar(50),
@uts int,
@uas int,
@tugas int,
@nilai_total int,
@status varchar(50)
as
begin
	insert into Nilai values (@nim,@id_matkul,@uts,@uas,@tugas,@nilai_total,@status)
end

create proc sp_selectNilai
as
begin
	select * from Nilai
end



create proc sp_updateNilai
@nim varchar(50),
@id_matkul varchar(50),
@uts int,
@uas int,
@tugas int,
@nilai_total int,
@status varchar(50)
as
begin
	update Nilai set
	uts = @uts,
	uas = @uas,
	tugas = @tugas,
	nilai_total = @nilai_total,
	status = @status
	where nim = @nim and id_matkul= @id_matkul
end


create proc sp_deleteNilai
@nim varchar(50),
@id_matkul varchar(30)
as
begin
update nilai set
status = 'Nonaktif'
where nim = @nim and id_matkul = @id_matkul
end