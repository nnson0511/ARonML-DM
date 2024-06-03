
select distinct
       cp.CompanyID                           CompanyId,
       (2024 - year(REGISTRATION_DATE)) as CompanyAge,
       nbrs_ent_type                       CompanyType,
       IIF([ddi/fdi] = 'FDI', 1, 0)     as FDI,
       capital_amount                      CapitalAmount,
       total_labors                        NumberOfLabors,
       IIF([REG_CITY/PROVINCE] in ('Ho Chi Minh','Ha Noi','Da Nang','Hai Phong','Can Tho'), 1, 0)     as Region,
       IIF(NBRS_ENT_STATUS = 'ACT', 1, 0)                     Status
into CompanyProfile
from ProjectNUS..CompanyProfile cp
join ProjectNUS..RegisteredAddress ra on cp.CompanyID = ra.CompanyID
where NBRS_ENT_TYPE not in ('BR','BL')

create index CompanyId on CompanyProfile (CompanyId)

select CompanyID, YEAR, '11' as Id,  sum(ENDING_VALUE) as ENDING_VALUE
into FinancialValue
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '100'						and ID_DN_BO_BC in (3,4,5,6,7,8,9,11,24,27,28,33))
				or (MA_CTBC in ('110','120','130','140')	and ID_DN_BO_BC in (10,12,23,25,31,32))
				or (MA_CTBC in ('TS.A')						and ID_DN_BO_BC = 30)
				or (MA_CTBC in ('01','05','10','20')		and ID_DN_BO_BC = 34)
				or (MA_CTBC in ('01','03','05')				and ID_DN_BO_BC = 35)
				)
group by CompanyID, ID_DN_BO_BC, YEAR
go

insert into FinancialValue
select CompanyID, YEAR, '12' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '130'        and ID_DN_BO_BC in (3,4,5,6,7,8,9,11,24,33))
				or (MA_CTBC ='TS.II'		and ID_DN_BO_BC = 30)
				or (MA_CTBC = '117'			and ID_DN_BO_BC in (27,28))
				)
go

insert into FinancialValue
select CompanyID, YEAR, '13' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '140'        and ID_DN_BO_BC in (3,4,5,6,7,8,9,10,11,12,23,24,25,26,31,32,33))
				or (MA_CTBC = 'TS.III'    and ID_DN_BO_BC = 30)
				or (MA_CTBC = '20'          and ID_DN_BO_BC = 34)
				or (MA_CTBC = '05'          and ID_DN_BO_BC = 35)
			)
go

insert into FinancialValue
select CompanyID, YEAR, '14' as Id, sum(ENDING_VALUE) as ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
				(MA_CTBC = '200'							and ID_DN_BO_BC in (3,4,5,6,7,8,9,11,24,27,28,33))
				or (MA_CTBC = 'TS.B'						and ID_DN_BO_BC in (30))
				or (MA_CTBC in ('25','30')					and ID_DN_BO_BC in (34))
				or (MA_CTBC in ('10','20')					and ID_DN_BO_BC in (35))
				or (MA_CTBC in ('150','160','170','180')	and ID_DN_BO_BC in (10,12,23,32))
				or (MA_CTBC in ('150','160','170')			and ID_DN_BO_BC in (25,31))
				or (MA_CTBC in ('160','170','180')			and ID_DN_BO_BC in (32))
			)
group by CompanyID, ID_DN_BO_BC, YEAR
go

insert into FinancialValue
select CompanyID, YEAR, '15' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '300'        and ID_DN_BO_BC in (3,4,5,6,7,8,9,10,11,12,23,25,26,27,28,31,32))
				or (MA_CTBC ='NV.A'         and ID_DN_BO_BC in (30))
				or (MA_CTBC = '400'         and ID_DN_BO_BC in (24,33))
				or (MA_CTBC = '60'          and ID_DN_BO_BC in (34))
				or (MA_CTBC = '40'          and ID_DN_BO_BC in (35))
			)
go

insert into FinancialValue
select CompanyID, YEAR, '16' as Id, ENDING_VALUE
from  ProjectNUS..Financial

go

insert into FinancialValue
select CompanyID, YEAR, '17' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
				(MA_CTBC = '320'            and ID_DN_BO_BC = 4)
				or (MA_CTBC = '330'         and ID_DN_BO_BC in (3,5,6,7,8,9,11))
				or (MA_CTBC = '340'         and ID_DN_BO_BC in (27,28))
				or (MA_CTBC = '420'         and ID_DN_BO_BC in (24,33))
			)
go

insert into FinancialValue
select CompanyID, YEAR, '18' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '321'	 and ID_DN_BO_BC in (4))
				or (MA_CTBC = '331'		 and ID_DN_BO_BC in (6))
				or (MA_CTBC = '334'		 and ID_DN_BO_BC in (3,5,7,8))
				or (MA_CTBC = '338'		 and ID_DN_BO_BC in (9,11,30))
				or (MA_CTBC = '341'		 and ID_DN_BO_BC in (27,28))
				or (MA_CTBC = '425'		 and ID_DN_BO_BC in (24,33))
			)
go


insert into FinancialValue
select CompanyID, YEAR, '19' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '400'	and ID_DN_BO_BC in (3,4,5,6,7,8,9,10,11,12,23,25,26,27,28,31,32))
				or (MA_CTBC = '500'		and ID_DN_BO_BC in (24,33))
				or (MA_CTBC = 'NV.B'	and ID_DN_BO_BC in (30))
				or (MA_CTBC = '70'		and ID_DN_BO_BC in (34))
			)
go

insert into FinancialValue
select CompanyID, YEAR, '20' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 1 and (
					(MA_CTBC = '270'	and ID_DN_BO_BC in (3,5,7,8,9,11,27,28))
				or (MA_CTBC = '250'		and ID_DN_BO_BC in (4,6))
				or (MA_CTBC = '100'		and ID_DN_BO_BC in (10,12))
				or (MA_CTBC = '200'		and ID_DN_BO_BC in (23,25,26,31,32))
				or (MA_CTBC = '300'		and ID_DN_BO_BC in (24,33))
				or (MA_CTBC = 'TCTS'	and ID_DN_BO_BC in (30))
				or (MA_CTBC = '50'		and ID_DN_BO_BC in (34))
				or (MA_CTBC = '30'		and ID_DN_BO_BC in (35))
			)
go

insert into FinancialValue
select CompanyID, YEAR, '21' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 2 and (
					(MA_CTBC = '10'		and ID_DN_BO_BC in (3,4,5,6,7,9,10,11,12,23,24,25,30,31,32,33))
				or (MA_CTBC = '09'		and ID_DN_BO_BC in (8))
				or (MA_CTBC = '01'		and ID_DN_BO_BC in (26))
			)
go

insert into FinancialValue
select CompanyID, YEAR, '22' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 2 and (
					(MA_CTBC = '20'		 and ID_DN_BO_BC in (3,4,5,6,7,8,9,10,11,12,23,24,25,30,32,33))
				)
go

insert into FinancialValue
select CompanyID, YEAR, '23' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 2 and (
				(MA_CTBC = '50'			and ID_DN_BO_BC in (3,4,5,6,7,8,9,10,11,12,23,24,25,30,31,32,33,34))
				or (MA_CTBC = '70'		and ID_DN_BO_BC in (35))
				or (MA_CTBC = '90'		and ID_DN_BO_BC in (27,28))
				or (MA_CTBC = '05'		and ID_DN_BO_BC in (26))
			)
go

insert into FinancialValue
select CompanyID, YEAR, '24' as Id, ENDING_VALUE
from  ProjectNUS..Financial
where  ID_LOAI_BC = 2 and (
					(MA_CTBC = '60'		and ID_DN_BO_BC in (3,4,5,6,7,8,9,10,11,12,23,24,25,30,31,32,33))
				or (MA_CTBC = '200'		and ID_DN_BO_BC in (27,28))
				or (MA_CTBC = '07'		and ID_DN_BO_BC in (26))
			)
go

create index CompanyId on FinancialValue (CompanyId)

SELECT
    CompanyID,
    MAX(CASE WHEN Id = 11 THEN Value END) AS FS11,
    MAX(CASE WHEN Id = 12 THEN Value END) AS FS12,
    MAX(CASE WHEN Id = 13 THEN Value END) AS FS13,
    MAX(CASE WHEN Id = 14 THEN Value END) AS FS14,
    MAX(CASE WHEN Id = 15 THEN Value END) AS FS15,
    MAX(CASE WHEN Id = 16 THEN Value END) AS FS16,
    MAX(CASE WHEN Id = 17 THEN Value END) AS FS17,
    MAX(CASE WHEN Id = 18 THEN Value END) AS FS18,
    MAX(CASE WHEN Id = 19 THEN Value END) AS FS19,
    MAX(CASE WHEN Id = 20 THEN Value END) AS FS20,
    MAX(CASE WHEN Id = 21 THEN Value END) AS FS21,
    MAX(CASE WHEN Id = 22 THEN Value END) AS FS22,
    MAX(CASE WHEN Id = 23 THEN Value END) AS FS23,
    MAX(CASE WHEN Id = 24 THEN Value END) AS FS24
into MeanFinancialValue
FROM
    (SELECT CompanyID, Id, CAST(ROUND(AVG(ENDING_VALUE), 2) AS DECIMAL(18,2)) AS Value
     FROM FinancialValue
     GROUP BY CompanyID, Id) AS SourceTable
GROUP BY
    CompanyID;

create index CompanyId on MeanFinancialValue (CompanyId)

select cp.CompanyId, CompanyAge, CompanyType, FDI, CapitalAmount, NumberOfLabors, Region,
       FS11, FS12, FS13, FS14, FS15, FS16, FS17, FS18, FS19, FS20, FS21, FS22, FS23, FS24,
       Status
into FullCompanyInfo
from MeanFinancialValue mfv
join CompanyProfile CP on mfv.CompanyID = CP.CompanyId