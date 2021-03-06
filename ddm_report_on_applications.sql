USE [DV]
GO
/****** Object:  StoredProcedure [dbo].[ddm_report_on_applications_4]    Script Date: 11/01/2017 11:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Салахутдинов Ильдар>
-- Create date: <23.06.16>
-- Description:	<Отчёт по заявкам>
-- =============================================
ALTER procedure [dbo].[ddm_report_on_applications_4]
	-- Add the parameters for the stored procedure here
	  @CreationDateTimeMin date
	, @CreationDateTimeMax date
	, @AccountName nvarchar(max) = null
	, @sorting_topics varchar(4) = '0'
as
begin
	
	set nocount on;

	set transaction isolation level read uncommitted;


	select	distinct
			CardRegistration_DDMSystem.RegistrationNumber as Reg_number -- Номер заявки
		,	convert(varchar, tSec1InstDate.[CreationDateTime], 104) as Creation_Date_Time -- Дата создания
		,	(
				select	top 1 convert(varchar, CardRegistration_Comments.CommentDate, 104)  
				from	[dbo].[dvtable_{8A7CCA5D-594E-464C-86CA-46C85BDA9183}] as CardRegistration_Comments
						inner join [dbo].[dvtable_{BE963903-8360-4020-A2E0-016C74CBFB02}] as CardRegistration_System 
								on CardRegistration_Comments.[InstanceID] = CardRegistration_System.[InstanceID]
				where	CardRegistration_Comments.InstanceID = tSec1InstDate.[InstanceID] 
					and CardRegistration_System.[State] = '6D8CED5B-5AFA-4EF7-B673-D493EA8A0252'
				order by CommentDate desc
			) as Date_end  -- Дата закрытия
		,	cast([_Properties_1].Value as nvarchar(max)) as Applicant -- заявитель
		,	RefCategories_Categories.Name as RefCategories_Categories_Name  -- Тематика
		,	cast([_Properties_4].Value as nvarchar(max)) as Polis_number  -- номер полиса
		,	RefUniversal_Item.Name as Territory  -- Территория
		,	RefStaff_Employees.LastName as Insurance_agency -- страховая организация
		,	RefPartners_Companies.Name as Medical_organization -- медицинская организация
		,	cast([_Properties_7].Value as nvarchar(max) ) as Additional_Information -- доп информация
		,	tSec0.Content as Content -- содержание
		,	RefTypes_EnumValues.ValueName as Kind_of_treatment -- вид обращения
		,	case
				when tSec1.[State] = '60EED5C0-3FA2-4E26-AB6A-A0A13729C70B' and 
					 (
						select	count(*)
						from	[dbo].[dvtable_{5A296B39-B9F1-406E-9CBC-1123067923C5}] as CardRegistration_Addressees
						where	tSec1InstDate.[InstanceID] = CardRegistration_Addressees.[InstanceID] 
							and CardRegistration_Addressees.AddresseeType = 2
						) = 1 
					then 'Передана на второй уровень'
				when tSec1.[State] = '60EED5C0-3FA2-4E26-AB6A-A0A13729C70B' and 
					 (
						select	count(*)
						from 	[dbo].[dvtable_{5A296B39-B9F1-406E-9CBC-1123067923C5}] as CardRegistration_Addressees
						where	tSec1InstDate.[InstanceID] = CardRegistration_Addressees.[InstanceID] 
							and CardRegistration_Addressees.AddresseeType = 2
					 ) = 0 
					then 'Регистрируется'
				when tSec1.[State] = 'AE65511D-FE75-40D7-B51D-6554527E692D' 
					then 'Исполнена'
				when tSec1.[State] = '6D8CED5B-5AFA-4EF7-B673-D493EA8A0252' 
					then 'Закрыта' 
				else null 
				end as Application_state -- состояние заявки
		,   (
				select RefStaff_Employees3.LastName + isnull(' ' + substring(RefStaff_Employees3.FirstName,1,1) + '.','') + isnull(' ' + substring(RefStaff_Employees3.MiddleName,1,1) + '.','')
				from [dbo].[dvtable_{5A296B39-B9F1-406E-9CBC-1123067923C5}] as CardRegistration_Addressees 
				join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees3 on CardRegistration_Addressees.StaffEmpl = RefStaff_Employees3.RowID
				where CardRegistration_Addressees.InstanceID = tSec1InstDate.[InstanceID] and CardRegistration_Addressees.AddresseeType = '2'
			) as Executor -- исполнитель
		,	(
				select	convert(varchar, CardRegistration_Comments2.CommentDate, 104) + ' ' + 
						RefStaff_Employees2.LastName +
						(case when RefStaff_Employees2.FirstName is null
								then ':'
							  else ' ' + substring(RefStaff_Employees2.FirstName,1,1) + '.'
							end) +
						(case when RefStaff_Employees2.MiddleName is null
								then ''
							  else substring(RefStaff_Employees2.MiddleName,1,1) + '.:'
							end) +
						CardRegistration_Comments2.Comment + ';   ' 
				from	[dbo].[dvtable_{8A7CCA5D-594E-464C-86CA-46C85BDA9183}] as CardRegistration_Comments2
						inner join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees2
								on CardRegistration_Comments2.CommentAuthor = RefStaff_Employees2.RowID
				where	CardRegistration_Comments2.InstanceID = tSec1InstDate.[InstanceID] 
				order by CardRegistration_Comments2.CommentDate
				for xml path('')
				) as Comment_user -- ход исполнения
	from	[dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as CardRegistration_Properties
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_1]
					on CardRegistration_Properties.InstanceID = _Properties_1.[InstanceID] 
					and _Properties_1.[Name] = cast(N'Заявитель' as nvarchar(max))
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_3]
					on CardRegistration_Properties.InstanceID = _Properties_3.[InstanceID]
					and _Properties_3.[Name] = cast(N'Территория' as nvarchar(max))
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_4] 
					on CardRegistration_Properties.InstanceID = _Properties_4.[InstanceID]
					and _Properties_4.[Name] = cast(N'Номер полиса' as nvarchar(max))
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_8]
					on CardRegistration_Properties.InstanceID = _Properties_8.[InstanceID]
					and _Properties_8.[Name] = cast(N'Страховая организация' as nvarchar(max))
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_7]
					on CardRegistration_Properties.InstanceID = _Properties_7.[InstanceID]
					and _Properties_7.[Name] = cast(N'Дополнительная информация' as nvarchar(max))
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_6]
					on CardRegistration_Properties.InstanceID = _Properties_6.[InstanceID]
					and _Properties_6.[Name] = cast(N'Вид обращения' as nvarchar(max))
			left  join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as [_Properties_5]
					on CardRegistration_Properties.InstanceID = _Properties_5.[InstanceID]
					and _Properties_5.[Name] = cast(N'Медицинская организация' as nvarchar(max))
			left  join [dbo].[dvtable_{F9D3EF11-A060-415A-BE69-DA9EFD3CA436}] tSec0
					on tSec0.[InstanceID] = _Properties_5.[InstanceID]
			left  join [dbo].[dvtable_{BE963903-8360-4020-A2E0-016C74CBFB02}] tSec1
					on tSec0.[InstanceID] = tSec1.[InstanceID]
			left  join [dbo].[dvsys_instances_date] tSec1InstDate
					on tSec1.[InstanceID] = tSec1InstDate.[InstanceID]
			left  join [dbo].[dvsys_instances] t_dv_instances
					on tSec1.[InstanceID] = t_dv_instances.[InstanceID]
			left  join [dbo].[dvtable_{88E884FD-5FD2-4F8F-A8CF-53CB50A8C085}] as CardRegistration_DDMSystem
					on tSec1InstDate.[InstanceID] = CardRegistration_DDMSystem.[InstanceID]
			left  join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees
					on RefStaff_Employees.[RowID] = [_Properties_8].Value
			left  join [dbo].[dvtable_{C78ABDED-DB1C-4217-AE0D-51A400546923}] as RefPartners_Companies
					on RefPartners_Companies.[RowID] = [_Properties_5].Value
			left  join [dbo].[dvtable_{DD20BF9B-90F8-4D9A-9553-5B5F17AD724E}] as RefUniversal_Item
					on RefUniversal_Item.[RowID] = [_Properties_3].Value
			left  join [dbo].[dvtable_{6272E4BF-4BA4-4F32-94CC-31941F3EE5FF}] as RefTypes_EnumValues
					on ((RefTypes_EnumValues.ValueID = [_Properties_6].Value) AND (RefTypes_EnumValues.ParentRowID = '01C0FC76-67B0-435C-A727-DA0C3D9FC214'))
			left  join [dbo].[dvtable_{C286C0E6-D876-4C9D-BA89-AC39AFC6C0C4}] as CardRegistration_Categories
					on CardRegistration_Categories.[InstanceID] = tSec0.[InstanceID]
			left  join [dbo].[dvtable_{899C1470-9ADF-4D33-8E69-9944EB44DBE7}] as RefCategories_Categories
					on RefCategories_Categories.[RowID] = CardRegistration_Categories.Category
	where	tSec0.[Kind] = '83cbc961-5cb3-4a9c-a223-17683b9d0746' 
		and t_dv_instances.Deleted = 0
		and tSec1InstDate.[CreationDateTime] >= @CreationDateTimeMin 
		and tSec1InstDate.[CreationDateTime] <= DATEADD(day, +1, @CreationDateTimeMax)
		and (exists(select	1
					from	[dbo].[dvtable_{5B607FFC-7EA2-47B1-90D4-BB72A0FE7280}] as RefStaff_AlternateHierarchy1
							inner join [dbo].[dvtable_{A960E37B-F1BD-4981-858D-AE9706E0571E}] as RefStaff_Group1
									on RefStaff_AlternateHierarchy1.RowID = RefStaff_Group1.ParentRowID
							inner join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees1
									on RefStaff_Group1.EmployeeID = RefStaff_Employees1.RowID
					where	RefStaff_AlternateHierarchy1.Name in ('Оператор 1 уровня', 'Администратор Контакт-центра')
						and RefStaff_Employees1.AccountName = @AccountName) or
			 exists(select	1
					from	[dbo].[dvtable_{5A296B39-B9F1-406E-9CBC-1123067923C5}] as CardRegistration_Addressees1
							inner join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees1
									on CardRegistration_Addressees1.StaffEmpl = RefStaff_Employees1.RowID
							inner join [dbo].[dvtable_{7473F07F-11ED-4762-9F1E-7FF10808DDD1}] as RefStaff_Units1
									on RefStaff_Employees1.ParentRowID = RefStaff_Units1.RowID
									and RefStaff_Units1.Name in ('Межрайонные ТФОМС', 'Страховые организации')
					where	tSec1InstDate.[InstanceID] = CardRegistration_Addressees1.[InstanceID] 
						and CardRegistration_Addressees1.AddresseeType = 2
						and RefStaff_Employees1.AccountName = @AccountName) or
			 exists(select	1
					from	[dbo].[dvtable_{5A296B39-B9F1-406E-9CBC-1123067923C5}] as CardRegistration_Addressees1
							inner join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees1
									on CardRegistration_Addressees1.StaffEmpl = RefStaff_Employees1.RowID
							inner join [dbo].[dvtable_{DBC8AE9D-C1D2-4D5E-978B-339D22B32482}] as RefStaff_Employees2
									on RefStaff_Employees1.RootDepartment = RefStaff_Employees2.RootDepartment
							inner join [dbo].[dvtable_{7473F07F-11ED-4762-9F1E-7FF10808DDD1}] as RefStaff_Units1
									on RefStaff_Employees2.ParentRowID = RefStaff_Units1.RowID
									and RefStaff_Units1.Name not in ('Межрайонные ТФОМС', 'Страховые организации')
					where	tSec1InstDate.[InstanceID] = CardRegistration_Addressees1.[InstanceID] 
						and CardRegistration_Addressees1.AddresseeType = 2
						and RefStaff_Employees2.AccountName = @AccountName
						and not exists(	select	1
										from	[dbo].[dvtable_{5B607FFC-7EA2-47B1-90D4-BB72A0FE7280}] as RefStaff_AlternateHierarchy1
												inner join [dbo].[dvtable_{A960E37B-F1BD-4981-858D-AE9706E0571E}] as RefStaff_Group1
														on RefStaff_AlternateHierarchy1.RowID = RefStaff_Group1.ParentRowID
										where	RefStaff_Group1.EmployeeID = CardRegistration_Addressees1.StaffEmpl
											and RefStaff_AlternateHierarchy1.Name in ('Оператор 1 уровня')))
		) 
	order by RefCategories_Categories_Name asc, Creation_Date_Time;
	
	select @sorting_topics as sorting_topics;
    
END


USE [DV]
GO
/****** Object:  StoredProcedure [dbo].[ddm_report_on_applications_3]    Script Date: 10/23/2017 14:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Салахутдинов Ильдар>
-- Update date: <24.10.17>
-- Description:	<Отчёт по заявкам 2>
-- =============================================
/*
4.01. Об обеспечении полисами ОМС. {6A96A9AE-1C5A-4EB1-A142-761BB9028E57}
4.01.1. Об обеспечении полисами ОМС иностранных граждан, беженцев{1A2D9919-AD5F-4AF4-96CB-4CAAD8ECF59D}
4.02. Выбор ЛПУ в системе ОМС {5D40387C-9C7F-40CF-8C36-E80607619BE0}
4.03. Выбор врача {54AD9A40-7B21-4219-BEE4-0D48CEE25CF9}
4.04. Выбор СМО {B01C6B47-7782-41C4-8092-119349D18C83}
4.05. Организация работы ЛПУ {19E09F46-A568-4429-806C-4770CE24EFCF}
4.06. Санитарно -гигиеническое состояние ЛПУ {E4844FF6-695F-40A9-A65F-39A8401B390E}
4.07. Этика и деонтология мед. работников {869C1052-016B-4F59-8AD8-9449CDD16373}
4.08. КМП {DD904DB5-517F-4E76-80A2-B8E26FCDEE91}
4.09. Лекарственное обеспечение {BD4AF9E4-E807-451D-8C95-2E00CFF3F8F5}
4.10. Отказ в медицинской помощи {2963419B-A3D6-42E3-A0B4-F2188B39AB63}
4.11. Получение мед. помощи по базовой программе ОМС вне территории страхования {4B93D6C7-E98E-4CF0-B498-A5AA6EFB3A63}
4.12. Взимание денежных средств за медицинскую помощь по программе ОМС {0A256351-2A7A-48A8-A366-4E175383E491}
4.12.1. О видах, кач-ве и условиях предоставления мед. помощи по программе ОМС {A95E641B-4A0D-484A-B026-6C1F0C148D02}
4.13. Платные медицинские услуги, оказываемые в МО {A4545DE8-B626-4BE8-ADA3-7D3DD962A648}
4.14. Другие {BD324A59-9C7C-42CA-AFDA-D2809B59B7F6} {A95E641B-4A0D-484A-B026-6C1F0C148D02}

Виды Обращения
Обращение Value=1 5D18DDD3-9942-4463-B71A-333B057A93E4
Жалоба Value=2 533347CD-D083-43DB-A366-C2E42C7BBF23
Заявление Value=3 001CF128-0F40-49C3-A22A-96F2997A5A59
Предложение Value=4 9C7D360A-BDEB-4E7C-BBDD-7E82E474DD65

Kind == Заявка КЦ 83CBC961-5CB3-4A9C-A223-17683B9D0746;
 
Состояние  == Завершено execution 6D8CED5B-5AFA-4EF7-B673-D493EA8A0252
*/
ALTER procedure [dbo].[ddm_report_on_applications_3]
	-- Add the parameters for the stored procedure here
	  @calendar_min date
	, @calendar_max date 
	
as
BEGIN
set nocount on;

set transaction isolation level read uncommitted;
	
declare @Temp table(
	Instance uniqueidentifier,
	Kind uniqueidentifier,
	Value sql_variant ,
	DisplayValue sql_variant,
	Category uniqueidentifier,
	State uniqueidentifier,
	RegistrationDate datetime
	
	--,	PartnerOrg uniqueidentifier
);

insert into @temp 
select CardRegistration_RegistrationData.InstanceID ,Kind, Value, DisplayValue, Category, State, RegistrationDate
from [dbo].[dvtable_{F9D3EF11-A060-415A-BE69-DA9EFD3CA436}] as CardRegistration_RegistrationData --карточки
left join [dbo].[dvtable_{C7BA000C-6203-4D7F-8C6B-5CB6F1E6F851}] as RefKinds_CardKinds --виды карточек (Заявка КЦ)
on CardRegistration_RegistrationData.Kind = RefKinds_CardKinds.RowID
left Join [dbo].[dvtable_{C286C0E6-D876-4C9D-BA89-AC39AFC6C0C4}] as CardRegistration_Categories --категории
on CardRegistration_RegistrationData.InstanceID = CardRegistration_Categories.InstanceID
left Join [dbo].[dvtable_{BE963903-8360-4020-A2E0-016C74CBFB02}] as CardRegistration_System
on CardRegistration_RegistrationData.InstanceID = CardRegistration_System.InstanceID
left Join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as CardRegistration_Properties
on CardRegistration_RegistrationData.InstanceID = CardRegistration_Properties.InstanceID
where Kind = '83CBC961-5CB3-4A9C-A223-17683B9D0746' 
and CardRegistration_System.State !='0AA3FE31-674A-4545-B680-A330A2DB06C1'
and CardRegistration_RegistrationData.RegistrationDate >= @calendar_min 
and CardRegistration_RegistrationData.RegistrationDate <= DATEADD(day, +1, @calendar_max)



declare @Temp_SMO table(
Instance uniqueidentifier,
	Kind uniqueidentifier,
	Value varchar(50),
	DisplayValue sql_variant,
	Category uniqueidentifier,
	State uniqueidentifier,
	RegistrationDate datetime,
	PartnerOrg uniqueidentifier
);
insert into @Temp_SMO 

select CardRegistration_RegistrationData.InstanceID, Kind, cast(Value as varchar(50)) as Value, DisplayValue, Category, State, CreationDateTime, PartnerOrg as "в том числе по вопросам, не относящимся к сфере ОМС"
from [dbo].[dvtable_{F9D3EF11-A060-415A-BE69-DA9EFD3CA436}] as CardRegistration_RegistrationData --карточки
left Join [dbo].[dvtable_{C286C0E6-D876-4C9D-BA89-AC39AFC6C0C4}] as CardRegistration_Categories --категории
on CardRegistration_RegistrationData.InstanceID = CardRegistration_Categories.InstanceID
left Join [dbo].[dvtable_{BE963903-8360-4020-A2E0-016C74CBFB02}] as CardRegistration_System
on CardRegistration_RegistrationData.InstanceID = CardRegistration_System.InstanceID
left Join [dbo].[dvtable_{DFAB139A-71DD-4858-9946-89275F6D883B}] as CardRegistration_Properties
on CardRegistration_RegistrationData.InstanceID = CardRegistration_Properties.InstanceID
left join [dbo].[dvtable_{5A296B39-B9F1-406E-9CBC-1123067923C5}] as CardRegistration_Addressees
on CardRegistration_RegistrationData.InstanceID = CardRegistration_Addressees.InstanceID
left join [DV].[dbo].[dvsys_instances_date] as Dates
on CardRegistration_RegistrationData.InstanceID = Dates.InstanceID
where Kind = '1185AA94-1FAF-48FE-B549-CCF911A69C2E' 
and CardRegistration_Addressees.PartnerOrg = '58DF6799-A58B-4433-A49F-688DD23493EF' 
and Dates.CreationDateTime >= @calendar_min 
and Dates.CreationDateTime <= DATEADD(day, +1, @calendar_max)
and CardRegistration_Properties.Name = 'Вид обращения'
and CardRegistration_System.State !='0AA3FE31-674A-4545-B680-A330A2DB06C1'

select * from (
select 
 SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' then 1 else 0 end) as Complaint_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category in ('6A96A9AE-1C5A-4EB1-A142-761BB9028E57','B1550141-7A4B-4871-9F0B-80DFE099952F','724BDEA6-0763-4A54-9F31-DF5D6753D1A7','79F6B0FD-F85F-4D49-B853-61C008BCB898')  then 1 else 0 end) as Policies_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '1A2D9919-AD5F-4AF4-96CB-4CAAD8ECF59D' then 1 else 0 end) as PoliciesForeign_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '79F6B0FD-F85F-4D49-B853-61C008BCB898' then 1 else 0 end) as PoliciesDouble_SMO --1.01.3. О выдаче дубликата (переоформлении) полиса ОМС, в том числе
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'B1550141-7A4B-4871-9F0B-80DFE099952F' then 1 else 0 end) as PoliciesRedeliver_SMO --1.01.3.1. о переоформлении полиса
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '724BDEA6-0763-4A54-9F31-DF5D6753D1A7' then 1 else 0 end) as PoliciesGiveDouble_SMO --1.01.3.2. о выдаче дубликата полиса
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category in ('5D40387C-9C7F-40CF-8C36-E80607619BE0','AB3C3C8A-12F5-41F2-94D5-D818EAF6EA20','5E7C43AA-7A0D-47E3-8184-5AC85E8B6299') then 1 else 0 end) as  ChoiceMO_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'AB3C3C8A-12F5-41F2-94D5-D818EAF6EA20' then 1 else 0 end) as ChoiceMO_InTerritory_SMO --1.02.1. на территории страхования
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '5E7C43AA-7A0D-47E3-8184-5AC85E8B6299' then 1 else 0 end) as ChoiceMO_BeyondTerritory_SMO --1.02.2. вне территории страхования
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '54AD9A40-7B21-4219-BEE4-0D48CEE25CF9' then 1 else 0 end) as ChoiceDoctor_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '54AD9A40-7B21-4219-BEE4-0D48CEE25CF9' then 1 else 0 end) as  ChoiceDoctor_Complaint_SMO
,SUM (case when (Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'BDB6F69E-E667-46B5-B424-4B442B53BBF5') or (Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category in ('B01C6B47-7782-41C4-8092-119349D18C83','473F4A01-C3B6-4749-9380-1E82C0ECAA95','E4DAAD3D-0583-4FA5-BA92-685AAECA28A1','D235AE16-2748-480F-9A5C-B0691FD89D42','B278866A-985A-4656-9F74-E5B81876FED4')) then 1 else 0 end) as ChoiceSMO_SMO --1.04.1. о выборе СМО
--,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'BDB6F69E-E667-46B5-B424-4B442B53BBF5' then 1 else 0 end) as ChoiceSMO_Complaint_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '473F4A01-C3B6-4749-9380-1E82C0ECAA95' then 1 else 0 end) as ChoiceSMO_ReChoice_SMO --1.04.2. о замене СМО
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'E4DAAD3D-0583-4FA5-BA92-685AAECA28A1' then 1 else 0 end) as ChoiceSMO_Permanent_SMO --1.04.3. по постоянному месту жительства
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'D235AE16-2748-480F-9A5C-B0691FD89D42' then 1 else 0 end) as ChoiceSMO_NotPermanent_SMO --1.04.4. вне постоянного места жительства
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'B278866A-985A-4656-9F74-E5B81876FED4' then 1 else 0 end) as ChoiceSMO_WithoutReg_SMO --1.04.5. без регистрации на территории РФ
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '2FC69E03-AEEC-4DF5-9CFC-51595887A23E' then 1 else 0 end) as IdentifiactionInsured_SMO --1.05. Об идентификации в качестве застрахованного лица
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '63CFBE00-B9D9-4549-AE60-CFF2AD92EA15' then 1 else 0 end) as IdentifiactionInsured_1_SMO --1.05.1. ходатайства о регистрации в качестве застрахованного лица
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '19E09F46-A568-4429-806C-4770CE24EFCF' then 1 else 0 end) as WorkMO_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'E4844FF6-695F-40A9-A65F-39A8401B390E' then 1 else 0 end) as StateMO_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'C9AE6B6F-3E05-4421-90E2-0147B7C28F94' then 1 else 0 end) as MedicalWorkers_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'DD904DB5-517F-4E76-80A2-B8E26FCDEE91' then 1 else 0 end) as KMP_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'BD4AF9E4-E807-451D-8C95-2E00CFF3F8F5' then 1 else 0 end) as MedicalProvision_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category in ('2963419B-A3D6-42E3-A0B4-F2188B39AB63','6794589E-A237-4B9E-BB2F-2AFF0DA5C947','1034E067-834D-44CD-BACE-F5CE73AE138E') then 1 else 0 end) as DeniedMedicalHelp_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '6794589E-A237-4B9E-BB2F-2AFF0DA5C947' then 1 else 0 end) as DeniedMedicalHelp_InTerritory_SMO --1.12.1. на территории страхования
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '1034E067-834D-44CD-BACE-F5CE73AE138E' then 1 else 0 end) as DeniedMedicalHelp_BeyondTerritory_SMO --1.12.2. вне территории страхования
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '4B93D6C7-E98E-4CF0-B498-A5AA6EFB3A63' then 1 else 0 end) as MedicalCare_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category in ('0A256351-2A7A-48A8-A366-4E175383E491','A0AA32DE-0E93-4F64-B316-DA3B6822120A','FCECF19C-E3AE-44EC-9793-91AEBDCCDBB2') then 1 else 0 end) as TakingMoney_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'A95E641B-4A0D-484A-B026-6C1F0C148D02' then 1 else 0 end) as KindQualityCondition_SMO --1.14.1. О видах, качестве и условиях предоставления медицинской помощи по программам ОМС
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'A0AA32DE-0E93-4F64-B316-DA3B6822120A' then 1 else 0 end) as KindQualityCondition_InTerritory_SMO --1.14.2. на территории страхования
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'FCECF19C-E3AE-44EC-9793-91AEBDCCDBB2' then 1 else 0 end) as KindQualityCondition_BeyondTerritory_SMO --1.14.3. вне территории страхования
--,SUM (case when Category = '65B4BC1B-08B8-4745-BE57-0589F2F7474A' then 1 else 0 end) as FreeMed_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'A4545DE8-B626-4BE8-ADA3-7D3DD962A648' then 1 else 0 end) as  PaidMedicalServices_SMO
,SUM (case when  value = 'C947A81D-84D5-4122-8BC4-6BF2D9F12DEB' or Category = '65B4BC1B-08B8-4745-BE57-0589F2F7474A' or (Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category in ('BD324A59-9C7C-42CA-AFDA-D2809B59B7F6','2FC69E03-AEEC-4DF5-9CFC-51595887A23E','63CFBE00-B9D9-4549-AE60-CFF2AD92EA15','869C1052-016B-4F59-8AD8-9449CDD16373','6C643BA3-EAC9-4D79-8A27-FC15A56FD644','01BFAD4F-E425-4587-80D5-EF2878DA3BFA','5170E7E4-5171-44EB-B33A-FD1316A801F0')) then 1 else 0 end) as  Others_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '01BFAD4F-E425-4587-80D5-EF2878DA3BFA' then 1 else 0 end) as  PersonalData_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '5170E7E4-5171-44EB-B33A-FD1316A801F0' then 1 else 0 end)+ SUM (case when value='C947A81D-84D5-4122-8BC4-6BF2D9F12DEB' then 1 else 0 end) as  OtherReasons_NotRelated_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '6C643BA3-EAC9-4D79-8A27-FC15A56FD644' then 1 else 0 end) as  Unfulfilled_Duties_SMO
--,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = '869C1052-016B-4F59-8AD8-9449CDD16373' then 1 else 0 end) as  TechnicalSupport_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'A0AA32DE-0E93-4F64-B316-DA3B6822120A' then 1 else 0 end) as  TakingMoney_InTerritory_SMO
,SUM (case when Value = '6C26FE28-2E72-4441-9266-01D27A1912D5' and Category = 'BD324A59-9C7C-42CA-AFDA-D2809B59B7F6' then 1 else 0 end) as  OtherReasons_SMO
,SUM (case when value = '5A0377D1-6E08-4CE5-9E65-51F5D20AEF68' then 1 else 0 end) as  Offers_SMO
,SUM (case when value = '6FEF62FE-775A-4860-8D93-92B166022608' then 1 else 0 end) as All_Zayavy_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'BD4AF9E4-E807-451D-8C95-2E00CFF3F8F5' then 1 else 0 end) as  MedicalProvision_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'DD904DB5-517F-4E76-80A2-B8E26FCDEE91' then 1 else 0 end) as  KMP_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'C9AE6B6F-3E05-4421-90E2-0147B7C28F94' then 1 else 0 end) as  MedicalWorkers_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'E4844FF6-695F-40A9-A65F-39A8401B390E' then 1 else 0 end) as  StateMO_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '19E09F46-A568-4429-806C-4770CE24EFCF' then 1 else 0 end) as  WorkMO_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '6A96A9AE-1C5A-4EB1-A142-761BB9028E57' then 1 else 0 end) as  Policies_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '5D40387C-9C7F-40CF-8C36-E80607619BE0' then 1 else 0 end) as  ChoiceMO_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'AB3C3C8A-12F5-41F2-94D5-D818EAF6EA20' then 1 else 0 end) as  ChoiceMO_InTerritory_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '5E7C43AA-7A0D-47E3-8184-5AC85E8B6299' then 1 else 0 end) as  ChoiceMO_BeyondTerritory_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'E4DAAD3D-0583-4FA5-BA92-685AAECA28A1' then 1 else 0 end) as  ChoiceSMO_Permanent_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'D235AE16-2748-480F-9A5C-B0691FD89D42' then 1 else 0 end) as  ChoiceSMO_NotPermanent_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'B278866A-985A-4656-9F74-E5B81876FED4' then 1 else 0 end) as  ChoiceSMO_WithoutReg_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '6794589E-A237-4B9E-BB2F-2AFF0DA5C947' then 1 else 0 end) as  DeniedMedicalHelp_InTerritory_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '1034E067-834D-44CD-BACE-F5CE73AE138E' then 1 else 0 end) as  DeniedMedicalHelp_BeyondTerritory_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'A0AA32DE-0E93-4F64-B316-DA3B6822120A' then 1 else 0 end) as  TakingMoney_InTerritory_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'FCECF19C-E3AE-44EC-9793-91AEBDCCDBB2' then 1 else 0 end) as  TakingMoney_BeyondTerritory_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'DAF7E94A-7679-48E2-B044-5FD016C982E8' then 1 else 0 end) as  Unfulfilled_Duties_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '01BFAD4F-E425-4587-80D5-EF2878DA3BFA' then 1 else 0 end) as  PersonalData_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '869C1052-016B-4F59-8AD8-9449CDD16373' then 1 else 0 end) as  TechnicalSupport_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = 'BD324A59-9C7C-42CA-AFDA-D2809B59B7F6' then 1 else 0 end) as  OtherReasons_Complaint_SMO
,SUM (case when Value = '3C7CC8F7-D2A0-4384-BAFA-F30AF8B5DEB8' and Category = '5170E7E4-5171-44EB-B33A-FD1316A801F0' then 1 else 0 end) as  OtherReasons_NotRelated_Complaint_SMO
from @Temp_SMO) as Temp_SMO
cross join (
select SUM (case when DisplayValue = 'Жалоба' then 1 else 0 end) as Complaint -- Жалобы
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category in ('6A96A9AE-1C5A-4EB1-A142-761BB9028E57','B1550141-7A4B-4871-9F0B-80DFE099952F','724BDEA6-0763-4A54-9F31-DF5D6753D1A7','79F6B0FD-F85F-4D49-B853-61C008BCB898') then 1 else 0 end) as Policies --1.01. Об обеспечении полисами ОМС.
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '1A2D9919-AD5F-4AF4-96CB-4CAAD8ECF59D' then 1 else 0 end) as PoliciesForeign --1.01.2. Об обеспечении полисами ОМС иностранных граждан, беженцев граждан, беженцев
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '79F6B0FD-F85F-4D49-B853-61C008BCB898' then 1 else 0 end) as PoliciesDouble --1.01.3. О выдаче дубликата (переоформлении) полиса ОМС, в том числе
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'B1550141-7A4B-4871-9F0B-80DFE099952F' then 1 else 0 end) as PoliciesRedeliver --1.01.3.1. о переоформлении полиса
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '724BDEA6-0763-4A54-9F31-DF5D6753D1A7' then 1 else 0 end) as PoliciesGiveDouble --1.01.3.2. о выдаче дубликата полиса
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category in ('5D40387C-9C7F-40CF-8C36-E80607619BE0','AB3C3C8A-12F5-41F2-94D5-D818EAF6EA20','5E7C43AA-7A0D-47E3-8184-5AC85E8B6299') then 1 else 0 end) as ChoiceMO --1.02. О выборе МО в сфере ОМС
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'AB3C3C8A-12F5-41F2-94D5-D818EAF6EA20' then 1 else 0 end) as ChoiceMO_InTerritory --1.02.1. на территории страхования
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '5E7C43AA-7A0D-47E3-8184-5AC85E8B6299' then 1 else 0 end) as ChoiceMO_BeyondTerritory --1.02.2. вне территории страхования
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '54AD9A40-7B21-4219-BEE4-0D48CEE25CF9' then 1 else 0 end) as ChoiceDoctor --1.03. О выборе врача
,SUM (case when DisplayValue = 'Жалоба' and Category = '54AD9A40-7B21-4219-BEE4-0D48CEE25CF9' then 1 else 0 end) as ChoiceDoctor_Complaint
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category in ('B01C6B47-7782-41C4-8092-119349D18C83','BDB6F69E-E667-46B5-B424-4B442B53BBF5','473F4A01-C3B6-4749-9380-1E82C0ECAA95','E4DAAD3D-0583-4FA5-BA92-685AAECA28A1','D235AE16-2748-480F-9A5C-B0691FD89D42','B278866A-985A-4656-9F74-E5B81876FED4') then 1 else 0 end) as ChoiceSMO --1.04. О выборе и замене СМО
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'BDB6F69E-E667-46B5-B424-4B442B53BBF5' then 1 else 0 end) as ChoiceSMO_Complaint --1.04.1. о выборе СМО
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '473F4A01-C3B6-4749-9380-1E82C0ECAA95' then 1 else 0 end) as ChoiceSMO_ReChoice --1.04.2. о замене СМО
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'E4DAAD3D-0583-4FA5-BA92-685AAECA28A1' then 1 else 0 end) as ChoiceSMO_Permanent --1.04.3. по постоянному месту жительства
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'D235AE16-2748-480F-9A5C-B0691FD89D42' then 1 else 0 end) as ChoiceSMO_NotPermanent --1.04.4. вне постоянного места жительства
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'B278866A-985A-4656-9F74-E5B81876FED4' then 1 else 0 end) as ChoiceSMO_WithoutReg --1.04.5. без регистрации на территории РФ
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '2FC69E03-AEEC-4DF5-9CFC-51595887A23E' then 1 else 0 end) as IdentifiactionInsured --1.05. Об идентификации в качестве застрахованного лица
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '63CFBE00-B9D9-4549-AE60-CFF2AD92EA15' then 1 else 0 end) as IdentifiactionInsured_1 --1.05.1. ходатайства о регистрации в качестве застрахованного лица
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '19E09F46-A568-4429-806C-4770CE24EFCF' then 1 else 0 end) as WorkMO --1.06. Об организации работы МО
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'E4844FF6-695F-40A9-A65F-39A8401B390E' then 1 else 0 end) as StateMO --1.07. О санитарно-гигиеническом состоянии МО
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '869C1052-016B-4F59-8AD8-9449CDD16373' then 1 else 0 end) as TechnicalSupport --1.08. О материально-техническом обеспечении МО
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'C9AE6B6F-3E05-4421-90E2-0147B7C28F94' then 1 else 0 end) as MedicalWorkers --1.09. Об этике и деонтологии медицинских работников
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'DD904DB5-517F-4E76-80A2-B8E26FCDEE91' then 1 else 0 end) as KMP --1.10. О КМП
,SUM (case when DisplayValue = 'Жалоба' and Category = 'DD904DB5-517F-4E76-80A2-B8E26FCDEE91' then 1 else 0 end) as KMP_Complaint --1.10. О КМП
,SUM (case when DisplayValue = 'Жалоба' and Category = 'C9AE6B6F-3E05-4421-90E2-0147B7C28F94' then 1 else 0 end) as  MedicalWorkers_Complaint
,SUM (case when DisplayValue = 'Жалоба' and Category = 'E4844FF6-695F-40A9-A65F-39A8401B390E' then 1 else 0 end) as  StateMO_Complaint
,SUM (case when DisplayValue = 'Жалоба' and Category = '19E09F46-A568-4429-806C-4770CE24EFCF' then 1 else 0 end) as  WorkMO_Complaint
,SUM (case when DisplayValue = 'Жалоба' and Category = '6A96A9AE-1C5A-4EB1-A142-761BB9028E57' then 1 else 0 end) as  Policies_Complaint
,SUM (case when DisplayValue = 'Жалоба' and Category = '5D40387C-9C7F-40CF-8C36-E80607619BE0' then 1 else 0 end) as  ChoiceMO_Complaint
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'BD4AF9E4-E807-451D-8C95-2E00CFF3F8F5' then 1 else 0 end) as MedicalProvision --1.11. О лекарственном обеспечении при оказании медицинской помощи
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category in ('2963419B-A3D6-42E3-A0B4-F2188B39AB63','6794589E-A237-4B9E-BB2F-2AFF0DA5C947','1034E067-834D-44CD-BACE-F5CE73AE138E') then 1 else 0 end) as DeniedMedicalHelp --1.12. Об отказе в оказании медицинской помощи по программам ОМС
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '6794589E-A237-4B9E-BB2F-2AFF0DA5C947' then 1 else 0 end) as DeniedMedicalHelp_InTerritory --1.12.1. на территории страхования
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '1034E067-834D-44CD-BACE-F5CE73AE138E' then 1 else 0 end) as DeniedMedicalHelp_BeyondTerritory --1.12.2. вне территории страхования
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '4B93D6C7-E98E-4CF0-B498-A5AA6EFB3A63' then 1 else 0 end) as MedicalCare --1.13. О получении медицинской помощи по базовой программе ОМС вне территории страхования
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category in ('0A256351-2A7A-48A8-A366-4E175383E491','A0AA32DE-0E93-4F64-B316-DA3B6822120A','FCECF19C-E3AE-44EC-9793-91AEBDCCDBB2') then 1 else 0 end) as TakingMoney --1.14. О взимании денежных средств за медицинскую помощь по программам ОМС, в том числе:
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'A95E641B-4A0D-484A-B026-6C1F0C148D02' then 1 else 0 end) as KindQualityCondition --1.14.1. О видах, качестве и условиях предоставления медицинской помощи по программам ОМС
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'A0AA32DE-0E93-4F64-B316-DA3B6822120A' then 1 else 0 end) as KindQualityCondition_InTerritory --1.14.2. на территории страхования
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'FCECF19C-E3AE-44EC-9793-91AEBDCCDBB2' then 1 else 0 end) as KindQualityCondition_BeyondTerritory --1.14.3. вне территории страхования
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'A4545DE8-B626-4BE8-ADA3-7D3DD962A648' then 1 else 0 end) as PaidMedicalServices --1.15. О платных медицинских услугах, оказываемых в МО
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'DAF7E94A-7679-48E2-B044-5FD016C982E8' then 1 else 0 end) as Unfulfilled_Duties --1.16. О неисполнении СМО обязанностей по договору
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '01BFAD4F-E425-4587-80D5-EF2878DA3BFA' then 1 else 0 end) as PersonalData --1.17. О неправомерном распространении персональных данных
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '65B4BC1B-08B8-4745-BE57-0589F2F7474A' then 1 else 0 end) as FreeMed --1.18. О выделении средств для оплаты МП в рамках ТПГГ оказания бесплатной медицинской помощи
--,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = '5170E7E4-5171-44EB-B33A-FD1316A801F0' then 1 else 0 end) as OtherReasons_NotRelated --1.19. О вопросах, не относящихся к сфере ОМС
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category = 'BD324A59-9C7C-42CA-AFDA-D2809B59B7F6' then 1 else 0 end) as OtherReasons --1.20. Другие
,SUM (case when cast(Value as nvarchar(max)) = '1' and Category in ('BD324A59-9C7C-42CA-AFDA-D2809B59B7F6','2FC69E03-AEEC-4DF5-9CFC-51595887A23E','63CFBE00-B9D9-4549-AE60-CFF2AD92EA15','869C1052-016B-4F59-8AD8-9449CDD16373','DAF7E94A-7679-48E2-B044-5FD016C982E8','01BFAD4F-E425-4587-80D5-EF2878DA3BFA','65B4BC1B-08B8-4745-BE57-0589F2F7474A','5170E7E4-5171-44EB-B33A-FD1316A801F0') then 1 else 0 end) as Others
,SUM (case when cast (DisplayValue as nvarchar(max)) = 'Предложение' then 1 else 0 end) as Offers --1.21. Предложения
,SUM (case when cast (DisplayValue as nvarchar(max)) = 'Заявление' then 1 else 0 end) as All_Zayavy
,SUM (case when Value = 1 and Category = 'A0AA32DE-0E93-4F64-B316-DA3B6822120A' then 1 else 0 end) as  TakingMoney_InTerritory
from @temp) as temp
--select * from @Temp,@Temp_SMO

END
