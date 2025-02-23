USE [Kampus_06]
GO
/****** Object:  Table [dbo].[Mahasiswa]    Script Date: 8/10/2019 8:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mahasiswa](
	[nim] [varchar](50) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[tmp_lahir] [varchar](50) NULL,
	[tgl_lahir] [date] NULL,
	[prodi] [varchar](50) NULL,
	[alamat] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[nohp] [varchar](15) NULL,
 CONSTRAINT [PK_Mahasiswa] PRIMARY KEY CLUSTERED 
(
	[nim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MataKuliah]    Script Date: 8/10/2019 8:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MataKuliah](
	[id_matkul] [varchar](30) NOT NULL,
	[nama_matkul] [varchar](50) NULL,
 CONSTRAINT [PK_MataKuliah] PRIMARY KEY CLUSTERED 
(
	[id_matkul] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nilai]    Script Date: 8/10/2019 8:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nilai](
	[nim] [varchar](50) NOT NULL,
	[id_matkul] [varchar](30) NOT NULL,
	[uts] [int] NULL,
	[uas] [int] NULL,
	[tugas] [int] NULL,
	[nilai_total] [int] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[nim] ASC,
	[id_matkul] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nilai]  WITH CHECK ADD  CONSTRAINT [FK_Nilai_Mahasiswa] FOREIGN KEY([nim])
REFERENCES [dbo].[Mahasiswa] ([nim])
GO
ALTER TABLE [dbo].[Nilai] CHECK CONSTRAINT [FK_Nilai_Mahasiswa]
GO
ALTER TABLE [dbo].[Nilai]  WITH CHECK ADD  CONSTRAINT [FK_Nilai_MataKuliah] FOREIGN KEY([id_matkul])
REFERENCES [dbo].[MataKuliah] ([id_matkul])
GO
ALTER TABLE [dbo].[Nilai] CHECK CONSTRAINT [FK_Nilai_MataKuliah]
GO
