-- CREATE TABLE `623_disbursement` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    disbursed_datetime DATETIME NOT NULL,
    contract_id INT NOT NULL,
    prospect_id INT NOT NULL,
    customer_id INT NOT NULL,
    loan_amount DECIMAL(15, 2) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    account_staff VARCHAR(100),
    credit_staff VARCHAR(100),
    sales_staff VARCHAR(100),
    unit VARCHAR(100),
    `sec-br` VARCHAR(100),
    dept VARCHAR(100)
);


SELECT "" as 'id',c.disbursed_datetime,c.id 'contract_id', p.id 'prospect_id', p.customer_id,
p.loan_amount, p.trading_currency 'currency', concat(UPPER(ua.nickname), "-" , ua.staff_no) 'account_staff',
concat(UPPER(uct.nickname), "-" , uct.staff_no)'contract_staff',
concat(UPPER(ucd.nickname), "-" , ucd.staff_no)'credit_staff',
concat(UPPER(uav.nickname), "-" , uav.staff_no)'assessesed_staff',
concat(UPPER(us.nickname), "-" , us.staff_no)'sales_staff'
FROM tblcontract c 
left join tblprospect p on (p.id = c.prospect_id)
LEFT JOIN tblprospectasset pa on (pa.prospect_id = p.id)
LEFT JOIN tblassetvaluation av on (pa.assetvaluation_id = av.id)
LEFT JOIN tbluser ua on (disbursed_by_account_staff_id = ua.id)
LEFT JOIN tbluser uct on (uct.id = approve_by_contract_staff_id)
LEFT JOIN tbluser ucd on (ucd.id = p.approve_by_credit_manager_id)
LEFT JOIN tbluser uav on (uav.id = av.last_update_user_id)
LEFT JOIN tbluser us on (us.id = p.salesperson_id)
WHERE --  FROM_UNIXTIME(c.disbursed_datetime , '%Y-%m-%d')  = '2024-10-10'
 c.status in (4) order by c.disbursed_datetime asc
