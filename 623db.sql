select @@global.sql_mode global, @@session.sql_mode session;
set sql_mode = '', global sql_mode = '';


-- this table will update contract when disburse just need to add like table contract
-- will goto >> asset valuation >> tablecar >> maker ...// table customer ....
-- 1. created table 623_lcontract

CREATE TABLE `623_lcontract` (
  `contract_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `prospect_id` int(11) NOT NULL,
  `contract_type` varchar(50) NOT NULL,
  `loan_amount` decimal(18,2) NOT NULL,
  `trading_currency` varchar(10) NOT NULL,
  `exchange_rate` decimal(10,4) NOT NULL,
  `eqv_usd` decimal(10,4) NOT NULL,
  `monthly_interest` decimal(5,2) NOT NULL,
  `payment_schedule_type` varchar(50) NOT NULL,
  `no_of_payment` int(11) NOT NULL,
  `min_repayment_period` int(11) NOT NULL,
  `initial_date` date NOT NULL,
  `first_payment_date` date NOT NULL,
  `last_payment_date` date NOT NULL,
  `contract_date` date NOT NULL,
  `disbursed_date` date DEFAULT NULL,
  `branch` varchar(50) default NULL,
  `sales` varchar(50) default NULL,
  `credit` varchar(50) default NULL,
  `contract` varchar(50) default NULL,
  `accounting` varchar(50) default NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


SELECT * FROM `623_lcontract` l 

-- DROP table `623_lcontract`;
-- --- ---------------------------------------------------------------
-- first add
SELECT	
c.id as contract_id,	
p.customer_id,	
p.id AS prospect_id,	
case p.contract_type when 1 then 'SME Car'	
when 2 then 'SME Bike' when 3 then 'Car Leasing'	
when 4 then 'Bike Leasing' when 5 then 'Real Estate'	
when 6 then 'Trade Finance'ELSE NULL	
end `contract_type`,	
p.loan_amount,	
p.trading_currency,	
case when p.trading_currency = 'USD' then 1	
when p.trading_currency = 'LAK' then cr.usd2lak	
when p.trading_currency = 'THB' then cr.usd2thb	
end 'exchange_rate',	
ROUND( p.loan_amount /	
(case when p.trading_currency = 'USD' then 1	
when p.trading_currency = 'LAK' then cr.usd2lak	
when p.trading_currency = 'THB' then cr.usd2thb	
end) ) 'eqv_usd',	
p.monthly_interest,	
CASE p.payment_schedule_type	
WHEN '1' THEN 'Normal'	
WHEN '2' THEN 'Bullet'	
WHEN '3' THEN 'Bullet-MOU'	
ELSE ''	
END AS payment_schedule_type,	
p.no_of_payment,	
p.min_repayment_period,	
p.initial_date,	
p.first_payment_date,	
p.last_payment_date,	
c.contract_date,	
FROM_UNIXTIME(disbursed_datetime , '%Y-%m-%d') 'disbursed_date',	
case p.call_centre
when 16 Then 'Attapeu'
when 56 Then 'Tonpherng(BKO) - Bokeo'
when 27 Then 'Bokeo'
when 47 Then 'Pakkading(PKN) - Borikhamxay'
when 12 Then 'Paksan - Bolikhamxay'
when 48 Then 'Khong(PKS) - Champasack'
when 8 Then 'Sukhuma(PKS) - Champasack'
when 3 Then 'Pakse - Champasack'
when 10 Then 'Houaphan'
when 52 Then 'Nhommalth(TKK) - Khammuane'
when 14 Then 'Thakek - Khammuane'
when 36 Then 'Khamkeut - Borikhamxay'
when 22 Then 'Luangnamtha'
when 53 Then 'Nane(LPB) - Luangprabang'
when 4 Then 'Luangprabang'
when 39 Then 'Nam Bak - Luangprabang'
when 54 Then 'Hoon(ODX) - Oudomxay'
when 5 Then 'Oudomxay'
when 21 Then 'Other'
when 28 Then 'Phongsaly'
when 50 Then 'Khongxedone(SLV) - Saravane'
when 15 Then 'Salavan'
when 40 Then 'Songkhone - Savanakhet'
when 18 Then 'Phin - Savanakhet'
when 51 Then 'Atsaphangthong(SVK) - Savanakhet'
when 13 Then 'Paksong - Savanakhet'
when 38 Then 'Chongmeg - Champasack'
when 2 Then 'Savannakhet'
when 29 Then 'Sekong'
when 1 Then 'Head Office'
when 42 Then 'Sikhottabong - Vientiane Capital'
when 33 Then 'Parkngum - Vientiane Capital'
when 31 Then 'Hadxayfong - Vientiane Capital'
when 34 Then 'Xaythany - Vientiane Capital'
when 32 Then 'Naxaythong - Vientiane Capital'
when 43 Then 'Xanakharm(VTP) - Vientiane Province'
when 45 Then 'Thoulakhom(VTP) - Vientiane Province'
when 44 Then 'Feuang(VTP) - Vientiane Province'
when 6 Then 'Vientiane province'
when 26 Then 'Vangvieng - Vientiane province'
when 55 Then 'Hongsa(XYB) - Xayaboury'
when 9 Then 'Xainyabuli'
when 41 Then 'Parklai - Xayaboury'
when 30 Then 'Xaysomboun'
when 46 Then 'Khoune(XKH) - Xienkhuang'
when 11 Then 'Xiengkhouang'
when 17 Then 'Kham - Xiengkhuang'
when 7 Then 'Xeno - Savanakhet'
when 24 Then 'Dongdok - Vientiane Capital'
when 35 Then 'Saysetha - Attapeu'
when 37 Then 'Paksong - Champasack'
end branch, -- https://docs.google.com/spreadsheets/d/1yzG8ASRGIUje9mly31H16JzxdUb0IGoNCYtPUJwiurg/edit?gid=232186766#gid=232186766	
CONCAT(us.staff_no, '-', us.nickname) AS sales,	
concat(uc.staff_no, '-', uc.nickname) as credit,	
concat(ut.staff_no, '-', ut.nickname) as contract,	
concat(ua.staff_no, '-',ua.nickname) as accounting	
FROM	
tblcontract c	
LEFT JOIN	tblprospect p ON p.id = c.prospect_id	
LEFT JOIN	tbluser us ON us.id = p.salesperson_id	
LEFT JOIN	tbluser uc ON uc.id = p.approve_by_credit_manager_id	
LEFT JOIN	tbluser ut on (ut.id = c.approve_by_contract_staff_id)	
LEFT JOIN	tbluser ua ON ua.id = c.disbursed_by_account_staff_id	
left join	tblcurrencyrate cr on (cr.date_for = FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d'))	
WHERE	
c.status in (6,7)	
AND p.contract_type = 1	
and c.date_closed >= '2025-01-01'
-- AND p.initial_date > '2024-11-01'




-- ----------------------------------------------------------------
-- check and add every day
SELECT	
c.id as contract_id,	
p.customer_id,	
p.id AS prospect_id,	
case p.contract_type when 1 then 'SME Car'	
when 2 then 'SME Bike' when 3 then 'Car Leasing'	
when 4 then 'Bike Leasing' when 5 then 'Real Estate'	
when 6 then 'Trade Finance'ELSE NULL	
end `contract_type`,	
p.loan_amount,	
p.trading_currency,	
case when p.trading_currency = 'USD' then 1	
when p.trading_currency = 'LAK' then cr.usd2lak	
when p.trading_currency = 'THB' then cr.usd2thb	
end 'exchange_rate',	
ROUND( p.loan_amount /	
(case when p.trading_currency = 'USD' then 1	
when p.trading_currency = 'LAK' then cr.usd2lak	
when p.trading_currency = 'THB' then cr.usd2thb	
end) ) 'eqv_usd',	
p.monthly_interest,	
CASE p.payment_schedule_type	
WHEN '1' THEN 'Normal'	
WHEN '2' THEN 'Bullet'	
WHEN '3' THEN 'Bullet-MOU'	
ELSE ''	
END AS payment_schedule_type,	
p.no_of_payment,	
p.min_repayment_period,	
p.initial_date,	
p.first_payment_date,	
p.last_payment_date,	
c.contract_date,	
FROM_UNIXTIME(disbursed_datetime , '%Y-%m-%d') 'disbursed_date',	
case p.call_centre
when 16 Then 'Attapeu'
when 56 Then 'Tonpherng(BKO) - Bokeo'
when 27 Then 'Bokeo'
when 47 Then 'Pakkading(PKN) - Borikhamxay'
when 12 Then 'Paksan - Bolikhamxay'
when 48 Then 'Khong(PKS) - Champasack'
when 8 Then 'Sukhuma(PKS) - Champasack'
when 3 Then 'Pakse - Champasack'
when 10 Then 'Houaphan'
when 52 Then 'Nhommalth(TKK) - Khammuane'
when 14 Then 'Thakek - Khammuane'
when 36 Then 'Khamkeut - Borikhamxay'
when 22 Then 'Luangnamtha'
when 53 Then 'Nane(LPB) - Luangprabang'
when 4 Then 'Luangprabang'
when 39 Then 'Nam Bak - Luangprabang'
when 54 Then 'Hoon(ODX) - Oudomxay'
when 5 Then 'Oudomxay'
when 21 Then 'Other'
when 28 Then 'Phongsaly'
when 50 Then 'Khongxedone(SLV) - Saravane'
when 15 Then 'Salavan'
when 40 Then 'Songkhone - Savanakhet'
when 18 Then 'Phin - Savanakhet'
when 51 Then 'Atsaphangthong(SVK) - Savanakhet'
when 13 Then 'Paksong - Savanakhet'
when 38 Then 'Chongmeg - Champasack'
when 2 Then 'Savannakhet'
when 29 Then 'Sekong'
when 1 Then 'Head Office'
when 42 Then 'Sikhottabong - Vientiane Capital'
when 33 Then 'Parkngum - Vientiane Capital'
when 31 Then 'Hadxayfong - Vientiane Capital'
when 34 Then 'Xaythany - Vientiane Capital'
when 32 Then 'Naxaythong - Vientiane Capital'
when 43 Then 'Xanakharm(VTP) - Vientiane Province'
when 45 Then 'Thoulakhom(VTP) - Vientiane Province'
when 44 Then 'Feuang(VTP) - Vientiane Province'
when 6 Then 'Vientiane province'
when 26 Then 'Vangvieng - Vientiane province'
when 55 Then 'Hongsa(XYB) - Xayaboury'
when 9 Then 'Xainyabuli'
when 41 Then 'Parklai - Xayaboury'
when 30 Then 'Xaysomboun'
when 46 Then 'Khoune(XKH) - Xienkhuang'
when 11 Then 'Xiengkhouang'
when 17 Then 'Kham - Xiengkhuang'
when 7 Then 'Xeno - Savanakhet'
when 24 Then 'Dongdok - Vientiane Capital'
when 35 Then 'Saysetha - Attapeu'
when 37 Then 'Paksong - Champasack'
end branch, -- https://docs.google.com/spreadsheets/d/1yzG8ASRGIUje9mly31H16JzxdUb0IGoNCYtPUJwiurg/edit?gid=232186766#gid=232186766	
CONCAT(us.staff_no, '-', us.nickname) AS sales,	
concat(uc.staff_no, '-', uc.nickname) as credit,	
concat(ut.staff_no, '-', ut.nickname) as contract,	
concat(ua.staff_no, '-',ua.nickname) as accounting	
FROM	
tblcontract c	
LEFT JOIN	tblprospect p ON p.id = c.prospect_id	
LEFT JOIN	tbluser us ON us.id = p.salesperson_id	
LEFT JOIN	tbluser uc ON uc.id = p.approve_by_credit_manager_id	
LEFT JOIN	tbluser ut on (ut.id = c.approve_by_contract_staff_id)	
LEFT JOIN	tbluser ua ON ua.id = c.disbursed_by_account_staff_id	
left join	tblcurrencyrate cr on (cr.date_for = FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d'))	
WHERE	
c.status in (4)	
AND p.contract_type = 1	
and FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d') >= '2025-02-25' -- update everyday
-- and c.date_closed >= '2025-01-01'
-- AND p.initial_date > '2024-11-01'

-- check last disburse date before import
SELECT prospect_id, disbursed_date from `623_lcontract` 
order by disbursed_date desc 
LIMIT 1

-- ================================================================
-- create table close for follow the closed case and monitor it

CREATE TABLE `623_lcontract_closed` (
  `contract_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `prospect_id` int(11) NOT NULL,
  `first_payment_date` date NOT NULL,
  `last_payment_date` date NOT NULL,
  `contract_status` varchar (50) not null,
  `closed_date` date NOT NULL,
  `last_collection_id` int(11) default NULL,
  `trading_currency` varchar (50) not null,
  `last_paid_date` date default NULL,
  `disbursed_date` date DEFAULT NULL,
  `last_paid_amount` decimal(5,2) default NULL,
  `create_collection` varchar(50) default NULL,
  `approved_collection` varchar(50) default NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

 -- DROP table `623_lcontract_closed`

-- -----------------------------------------------
-- first import the close case

SELECT 
p.customer_id as 'customer_id',
c.id as 'contract_id',
p.id as 'prospect_id',
p.first_payment_date as 'first_payment_date',
p.last_payment_date as 'last_payment_date',
case c.status when 0 then 'Pending' when 1 then 'Pending Approval'
		when 2 then 'Pending Disbursement' when 3 then 'Disbursement Approval'
		when 4 then 'Active' when 5 then 'Cancelled'
		when 6 then 'Refinance' when 7 then 'Closed' ELSE NULL
	end `contract_status`,
c.date_closed as 'closed_date',
p.trading_currency
FROM 
tblcontract c 
left join tblprospect p on (c.prospect_id = p.id)
WHERE c.status in (6,7)
and c.date_closed >= '2025-02-026' -- change and update every day


SELECT * FROM `623_lcontract_closed` lc 

-- -------------------------------------------------------------

SELECT cd.contract_status,count(ct.contract_id) FROM `623_lcontract` ct
left join `623_lcontract_closed` cd on (ct.contract_id = cd.contract_id)
GROUP by cd.contract_status 

-- =================================================================
-- 2. create table first payment schedule because some time we update the
-- for save first payment schedule
-- create table

CREATE TABLE original_payments_schedule (
    schedule_id INT PRIMARY KEY,
    prospect_id INT NOT NULL,
    payment_date DATE NOT NULL,
    trading_currency VARCHAR(10) NOT NULL,
    payment_amount DECIMAL(18, 2) NOT NULL,
    principal_amount DECIMAL(18, 2) NOT NULL,
    interest_amount DECIMAL(18, 2) NOT null
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- import db
SELECT  pm.id as 'Schedule_id', pm.prospect_id, pm.payment_date, p.trading_currency ,pm.payment_amount, pm.principal_amount, pm.interest_amount
FROM tblpaymentschedule pm
left join tblcontract c on (c.id = pm.contract_id )
LEFT JOIN tblprospect p on (p.id = pm.prospect_id)
WHERE c.status in (4)
and FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d') >= '2024-01-01';


-- import db
SELECT  pm.id as 'Schedule_id', pm.prospect_id, pm.payment_date, p.trading_currency ,pm.payment_amount, pm.principal_amount, pm.interest_amount
FROM tblpaymentschedule pm
left join tblcontract c on (c.id = pm.contract_id )
LEFT JOIN tblprospect p on (p.id = pm.prospect_id)
WHERE c.status in (4)
and FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d') >= '2024-01-01' and pm.id > 25134363;

select * from original_payments_schedule ops 



-- need to check the original number payment is difference the normal
select prospect_id, count(prospect_id) from original_payments_schedule ops 
group by prospect_id 





-- for check the target start on jan2025
  
CREATE TABLE `623_paymentschedule` (
  `id` int(11) NOT NULL,
  `prospect_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` decimal(20,2) NOT NULL,
  `principal_amount` decimal(20,2) NOT NULL,
  `interest_amount` decimal(20,2) NOT NULL,
  `status` varchar (50) Default null,
  `collected_id` int (11) default null,
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`),
  KEY `prospect_id` (`prospect_id`),
  KEY `payment_date` (`payment_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




-- ====================*****************************=========================
-- management db
branch office

CREATE TABLE `lalco_office` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_code` varchar(50) DEFAULT NULL,
  `opened_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `village_id` varchar(50) DEFAULT NULL,
  `location` varchar(2083) DEFAULT NULL,
  `lms_callcentre_code` varchar(50) DEFAULT NULL,
  `lms_callcentre_je_code` varchar (50) Default null,
  `lms_callcentre_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

SELECT * FROM lalco_office lo 


















