
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

SELECT top 10
        CompanyID,
        CAST(YEAR AS VARCHAR) + '_' + CAST(Id AS VARCHAR) AS Year_Id,
        ENDING_VALUE
from FinancialValue

SELECT
    CompanyID,
    [2015_11], [2015_12], [2015_13], [2015_14], [2015_15], [2015_16], [2015_17], [2015_18], [2015_19], [2015_20], [2015_21], [2015_22], [2015_23], [2015_24], [2016_11], [2016_12], [2016_13], [2016_14], [2016_15], [2016_16], [2016_17], [2016_18], [2016_19], [2016_20], [2016_21], [2016_22], [2016_23], [2016_24], [2017_11], [2017_12], [2017_13], [2017_14], [2017_15], [2017_16], [2017_17], [2017_18], [2017_19], [2017_20], [2017_21], [2017_22], [2017_23], [2017_24], [2018_11], [2018_12], [2018_13], [2018_14], [2018_15], [2018_16], [2018_17], [2018_18], [2018_19], [2018_20], [2018_21], [2018_22], [2018_23], [2018_24], [2019_11], [2019_12], [2019_13], [2019_14], [2019_15], [2019_16], [2019_17], [2019_18], [2019_19], [2019_20], [2019_21], [2019_22], [2019_23], [2019_24], [2020_11], [2020_12], [2020_13], [2020_14], [2020_15], [2020_16], [2020_17], [2020_18], [2020_19], [2020_20], [2020_21], [2020_22], [2020_23], [2020_24], [2021_11], [2021_12], [2021_13], [2021_14], [2021_15], [2021_16], [2021_17], [2021_18], [2021_19], [2021_20], [2021_21], [2021_22], [2021_23], [2021_24], [2022_11], [2022_12], [2022_13], [2022_14], [2022_15], [2022_16], [2022_17], [2022_18], [2022_19], [2022_20], [2022_21], [2022_22], [2022_23], [2022_24]
into FinancialValue2
FROM (
    SELECT
        CompanyID,
        CAST(YEAR AS VARCHAR) + '_' + CAST(Id AS VARCHAR) AS Year_Id,
        ENDING_VALUE
    FROM FinancialValue
) AS SourceTable
PIVOT (
    MAX(ENDING_VALUE) FOR Year_Id IN ([2015_11], [2015_12], [2015_13], [2015_14], [2015_15], [2015_16], [2015_17], [2015_18], [2015_19], [2015_20], [2015_21], [2015_22], [2015_23], [2015_24], [2016_11], [2016_12], [2016_13], [2016_14], [2016_15], [2016_16], [2016_17], [2016_18], [2016_19], [2016_20], [2016_21], [2016_22], [2016_23], [2016_24], [2017_11], [2017_12], [2017_13], [2017_14], [2017_15], [2017_16], [2017_17], [2017_18], [2017_19], [2017_20], [2017_21], [2017_22], [2017_23], [2017_24], [2018_11], [2018_12], [2018_13], [2018_14], [2018_15], [2018_16], [2018_17], [2018_18], [2018_19], [2018_20], [2018_21], [2018_22], [2018_23], [2018_24], [2019_11], [2019_12], [2019_13], [2019_14], [2019_15], [2019_16], [2019_17], [2019_18], [2019_19], [2019_20], [2019_21], [2019_22], [2019_23], [2019_24], [2020_11], [2020_12], [2020_13], [2020_14], [2020_15], [2020_16], [2020_17], [2020_18], [2020_19], [2020_20], [2020_21], [2020_22], [2020_23], [2020_24], [2021_11], [2021_12], [2021_13], [2021_14], [2021_15], [2021_16], [2021_17], [2021_18], [2021_19], [2021_20], [2021_21], [2021_22], [2021_23], [2021_24], [2022_11], [2022_12], [2022_13], [2022_14], [2022_15], [2022_16], [2022_17], [2022_18], [2022_19], [2022_20], [2022_21], [2022_22], [2022_23], [2022_24])
) AS PivotTable;

update CompanyProfile
set Status = 2
where Status = 1

update CompanyProfile
set Status = 1
where Status = 0

update CompanyProfile
set Status = 0
where Status = 2

select cp.CompanyId, CompanyAge, CompanyType, FDI, CapitalAmount, NumberOfLabors, Region, Status,
        [2015_11], [2015_12], [2015_13], [2015_14], [2015_15], [2015_16], [2015_17], [2015_18], [2015_19], [2015_20], [2015_21], [2015_22], [2015_23], [2015_24],
        [2016_11], [2016_12], [2016_13], [2016_14], [2016_15], [2016_16], [2016_17], [2016_18], [2016_19], [2016_20], [2016_21], [2016_22], [2016_23], [2016_24],
        [2017_11], [2017_12], [2017_13], [2017_14], [2017_15], [2017_16], [2017_17], [2017_18], [2017_19], [2017_20], [2017_21], [2017_22], [2017_23], [2017_24],
        [2018_11], [2018_12], [2018_13], [2018_14], [2018_15], [2018_16], [2018_17], [2018_18], [2018_19], [2018_20], [2018_21], [2018_22], [2018_23], [2018_24],
        [2019_11], [2019_12], [2019_13], [2019_14], [2019_15], [2019_16], [2019_17], [2019_18], [2019_19], [2019_20], [2019_21], [2019_22], [2019_23], [2019_24],
        [2020_11], [2020_12], [2020_13], [2020_14], [2020_15], [2020_16], [2020_17], [2020_18], [2020_19], [2020_20], [2020_21], [2020_22], [2020_23], [2020_24],
        [2021_11], [2021_12], [2021_13], [2021_14], [2021_15], [2021_16], [2021_17], [2021_18], [2021_19], [2021_20], [2021_21], [2021_22], [2021_23], [2021_24],
        [2022_11], [2022_12], [2022_13], [2022_14], [2022_15], [2022_16], [2022_17], [2022_18], [2022_19], [2022_20], [2022_21], [2022_22], [2022_23], [2022_24]
from ProjectNew..CompanyProfile cp
join ProjectNew..FinancialValue2 fv on cp.CompanyId = fv.CompanyId
where CompanyAge > 9


select Status, count (*)
from CompanyProfile
group by Status

select Status, count (*)
from FullCompanyInfo
group by Status



