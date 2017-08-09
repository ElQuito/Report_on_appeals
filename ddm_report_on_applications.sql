/****** Object:  StoredProcedure [dbo].[ddm_report_on_applications]    Script Date: 26.07.2016 15:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Салахутдинов Ильдар>
-- Create date: <23.06.16>
-- Description:	<Отчёт по заявкам>
-- =============================================
ALTER procedure [dbo].[ddm_report_on_applications]
	-- Add the parameters for the stored procedure here
	  @CreationDateTimeMin date
	, @CreationDateTimeMax date
	, @AccountName nvarchar(max) = null
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
		,	cast([_Properties_1].Value as nchar(30)) as Applicant -- заявитель
		,	RefCategories_Categories.Name as RefCategories_Categories_Name  -- Тематика
		,	cast([_Properties_4].Value as nchar(20)) as Polis_number  -- номер полиса
		,	RefUniversal_Item.Name as Territory  -- Территория
		,	RefStaff_Employees.LastName as Insurance_agency -- страховая организация
		,	RefPartners_Companies.Name as Medical_organization -- медицинская организация
		,	cast([_Properties_7].Value as nchar ) as Additional_Information -- доп информация
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
				select RefStaff_Employees3.LastName + ' ' + substring(RefStaff_Employees3.FirstName,1,1) + '.' + substring(RefStaff_Employees3.MiddleName,1,1) + '.'
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
		and tSec1InstDate.[CreationDateTime] <= @CreationDateTimeMax
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
	order by RefCategories_Categories_Name asc, Creation_Date_Time 
    
END
