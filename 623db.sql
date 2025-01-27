
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
  `branch` varchar(50) NOT NULL,
  `sales` varchar(50) NOT NULL,
  `credit` varchar(50) NOT NULL,
  `contract` varchar(50) NOT NULL,
  `accounting` varchar(50) NOT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- first add


-- check and add every day



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


-- update every day
SELECT  pm.id as 'Schedule_id', pm.prospect_id, pm.payment_date, p.trading_currency ,pm.payment_amount, pm.principal_amount, pm.interest_amount
FROM tblpaymentschedule pm
left join tblcontract c on (c.id = pm.contract_id )
LEFT JOIN tblprospect p on (p.id = pm.prospect_id)
WHERE c.status in (4)
and FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d') >= '2024-01-01'; -- update date by date








