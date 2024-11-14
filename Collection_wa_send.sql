-- WA send to collection
-- 1. inport data source to frappe table [sme_collection_wa_msg]
/*
1. check project list in LMS such as
1) upload target to LMS
2) download from LMS (But Org on LMS still not correct so we need to update by manual first)
3) update table header format / https://docs.google.com/spreadsheets/d/1oD0r2ozGnW8-ejCaU8Bcm36x8DcvphfRf8UjYDCv0lo/edit?gid=1330890754#gid=1330890754 
4) check the data type (date format in column af-ak-ar-as)
5) save csv file and import to frappe table [sme_collection_wa_msg]
*/
-- before import new data we need to delete old data first. so, we can run this sql
TRUNCATE TABLE sme_collection_wa_msg; -- for clear table first then will inport new data then will run script

-- then import csv file to table [sme_collection_wa_msg]


-- 2. make file name to frappe table [wa_send_bulk_files]
/*
up to you. but last time I do in this spread sheet: https://docs.google.com/spreadsheets/d/1oD0r2ozGnW8-ejCaU8Bcm36x8DcvphfRf8UjYDCv0lo/edit?gid=0#gid=0 
in table i have column like
1) id,	file_name,	file_type,	target_date,	staff_incharge,	remark1
2) if create file name in spread sheet then save csv file and import to frappe table [wa_send_bulk_files]
*/

-- 3. make list and import to table [wa_send_bulk_list]
/* run these sql and export to wa_send_bulk_list]*/
-- BEFORE 5TH
-- 1.1) Last month 5th
SELECT -- COUNT(name)
 '' as 'id', 
concat('856',customer_tel_1) 'WHATSAPP',
CONCAT('ເຖິງລູກຄ້າທຸກທ່ານທີຮັກແພງ ແລະ ນັບຖື
ຂໍຂອບໃຈ ທີ່ນຳໃຊ້ບໍລິການ Lao ASEAN Leasing (LALCO) ຂອງພວກເຮົາຕະຫຼອດມາ.

ອີງຕາມ: ສັນຍາເລກທີ *',contract_no,'* ອອກຊື່ ທ່ານ *', customer_name,'* 
ແລະ ຂໍ້ມູນການຊຳລະຄ່າງວດແລ້ວ, ທ່ານຍັງບໍ່ທັນໄດ້ຊຳລະຄ່າງວດ ຕົ້ນທຶນ・ດອກເບ້ຍ ຂອງວັນທີ່ *5 ເດືອນແລ້ວ* ມາເທື່ອ. ແລະ *ໃນວັນທີ່ 5 ເດືອນນີ້* ກະເປັນມື້ກຳນົດຊຳລະຄ່າງວດຂອງເດືອນນີ້
ສະນັ້ນ ຈຶ່ງຂໍໃຫ້ທ່ານລູກຄ້າຈ່າຍຊຳລະຄ່າງວດມາພາຍໃນມື້ນີ້. *ເນື່ອງຈາກທ່ານລູກຄ້າໄດ້ຈ່າຍຊ້າໃນເດືອນແລ້ວ,* ໂດຍອີງຕາມເງື່ອນໄຂຂອງສັນຍາແລ້ວ ①ແມ່ນທ່ານລູກຄ້າໄດ້ *ເສຍສິດຂອງເງື່ອນໄຂປິດງວດກ່ອນກຳນົດ* ໃນຕອນເຮັດສັນຍາແລ້ວ. ② ສຳລັບລູກຄ້າທີ່ເຮັດສັນຍາ ດດຕ ແມ່ນ *ສັນຍາຈະຖືກປ່ຽນເປັນສັນຍາໄລຍະຍາວແບບອັດຕະໂນມັດ* ແລະ ③ ສຳລັບລູກຄ້າທີ່ເຮັດ *ສັນຍາເປັນເງິນກີບ-ບາດ ແມ່ນຈະຖືກປ່ຽນເປັນສັນຍາເງິນໂດລາ.*
 ກ່ຽວກັບການຈ່າຍຊຳລະຄັ້ງຕໍ່ໆໄປ ແລະ ການຕໍ່ສັນຍາເອົາວົງເງິນເພີ່ມ ແມ່ນທ່ານສາມາດໂທປຶກສາກັບພະນັກງານການຕະຫຼາດຂອງບໍລິສັດເຮົາໄດ້, ໃນກໍລະນີທີ່ທ່ານລູກຄ້າຫາກຊຳລະຄ່າງວດໃນມື້ນີ້ບໍ່ທັນແທ້ໆ ແມ່ນໃຫ້ທ່ານລູກຄ້າເຂົ້າມາຫ້ອງການ ເພື່ອປຶກສາກັບພະນັກງານການຕະຫຼາດຜູ້ຮັບຜິດຊອບ. ຖ້າຫາກມີຄວາມຍຸ້ງຍາກໃນການເຂົ້າມາຫ້ອງການ ແມ່ນໃຫ້ທ່ານໂທວີດີໂອ ຜ່ານຊ່ອງທາງ WhatsApp ຫາພະນັກງານການຕະຫຼາດຮັບຜິດຊອບຂອງບໍລິສັດເຮົາໂດຍກົງໄດ້

ສອບຖາມລາຍລະອຽດທີ່:
 - ພງ ຕັດບິນ: *',em.name,'* ',em.main_contact,'
 - ພງ ການຕະຫຼາດ: ', ems.name, '- ', ems.main_contact ) 'BODY',
 case scwm.ccc_name    -- check and update every time, so, if you create in spread sheet you can copy pasted to here
When 'DAO2329' Then 21
When 'HONEY361' Then 22
When 'NOY3804' Then 23
When 'NUN1603' Then 24
When 'PHET2349' Then 25
When 'PUPIEW2451' Then 26
When 'PAENG2233' Then 27
When 'NING3627' Then 28
When 'JEN3694' Then 29
else ''
end 'file_id'
FROM sme_collection_wa_msg scwm 
LEFT JOIN tabsme_Employees em on (scwm.ccc_no = em.staff_no)
LEFT JOIN tabsme_Employees ems on (scwm.sales_no = ems.staff_no)
WHERE paid_or_not not in ('already paid') and target  = 1 and scwm.seized_car not in ('Got car');

-- 1.2) This month 5th


-- BEFORE 10TH
-- 2.1) Last month 10th

-- 2.2) This month 10th

-- BEFORE 15TH
-- 3.1) Last month 15th

-- 3.2) This month 15th
SELECT
 '' as 'id', 
concat('856',customer_tel_1) 'WHATSAPP',
CONCAT('ເຖິງລູກຄ້າທຸກທ່ານທີຮັກແພງ ແລະ ນັບຖື
ຂໍຂອບໃຈ ທີ່ນຳໃຊ້ບໍລິການ Lao ASEAN Leasing (LALCO) ຂອງພວກເຮົາຕະຫຼອດມາ.

- ອີງຕາມ: ສັນຍາເລກທີ *',contract_no,'* ອອກຊື່ ທ່ານ *', customer_name,'* 
- ຈາກການບັນທຶກຂໍ້ມູນຂອງພວກເຮົາ, ການຊຳລະຄ່າງວດຂອງວັນທີ 5 ເດືອນນີ້ແມ່ນທ່ານລູກຄ້າໄດ້ມີການລ່າຊ້າການຊຳລະຕົ້ນທຶນ ແລະ ດອກເບັ້ຍ.

* ບໍຊາບວ່າທ່ານລູກຄ້າໄດ້ຊຳລະຄ່າງວດຂອງເດືອນນີ້ມາແລ້ວບໍ? ຖ້າຫາກຊຳລະມາແລ້ວ ລົບກວນແຈ້ງບິນໃຫ້ພະນັກງານທີ່ຮັບຜິດຊອບເພື່ອຕັດຄ່າງວດດ້ວຍ.
* ຫາກບໍທັນຊຳລະເທື່ອລົບກວນທ່ານຮີບຮ້ອນເຂົ້າມາຊຳລະພາຍໃນມື້ນີ້, ເນື່ອງຈາກໄດ້ມີການກາຍກໍານົດທີ່ບໍ່ມີຄ່າປັບໃໝຈ່າຍຊ້າຂອງວັນທີ10ແລ້ວ、*ເຊີ່ງໄດ້ມີຄ່າປັບໃໝຈ່າຍຊ້າເກີດຂື້ນ。* 
 > ຫາກມີເຫດສຸດວິດໃສທີ່ລູກຄ້າບໍສາມາດຊຳລະທັນພາຍໃນມື້ນີ້ ກະລຸນາຕິດຕໍ່ພະນັກງານຜູ້ຮັບຜິດຊອບ ຫຼື ເຂົ້າມາຫ້ອງການທີ່ໃກ້ບ້ານທ່ານ ຫຼື ກະລຸນາຮັບສາຍໂທຂອງພະນັກງານເຮົາດ້ວຍ. ເພື່ອຊ່ວຍກັນຫາທາງອອກເຊັ່ນ: ເຮັດສັນຍາເອົາເງິນເພີ່ມ. ແນະນຳໝູ່ຄູ່ເພື່ອຮັບຄ່າແນະນຳມາຊຳລະຄ່າງວດ ໆລໆ
* ຂໍແຈ້ງໃຫ້ລູກຄ້າຊາບວ່າ ໂດຍອີງຕາມເງື່ອນໄຂຂອງສັນຍາ、ການຊໍາລະຄ່າງວດຂອງວັນທີ5ເດືອນນີ້ຫາກລູກຄ້າທ່ານໃດ ມີການຊໍາລະລ່າຊ້າ。ທ່ານລູກຄ້າຕ້ອງໝົດສິດເງຶ່ອນໄຂພິເສດການປິດງວດກ່ອນກໍານົດ。
* ສຳລັບລູກຄ້າທີ່ໄດ້ຮັບເງຶ່ອນໄຂຈ່າຍແຕ່ດອກເບັ້ຍ ແລະ ຊໍາລະຕົ້ນທືນບາດດຽວແມ່ນຈະປ່ຽນມາເປັນສັນຍາທີ່ມີເງຶ່ອນໄຂແບ່ງຈ່າຍໄລຍະຍາວແບບອັດຕະໂນມັດ。
 > ນອກນັ້ນ, ລູກຄ້າທ່ານໃດທີ່ໄດ້ຮັບເງື່ອນໄຂຈ່າຍແຕ່ດອກແລະຊໍາລະຕົ້ນທືນບາດດຽວ ແມ່ນທາງບໍລິສັດຈະມີແຜນການໂອນຊື່ລົດທີ່ເປັນຫຼັກກຊັບຄໍ້າປະກັນມາເປັນຊື່ຂອງບໍລິສັດເຮົາຕາມຂໍ້ຕົກລົງເບື້ອງຕົ້ນ

*ໝາຍເຫດ:*
- ການຊຳລະຄ່າງວດແຕ່ລະຄັ້ງ ເພື່ອງ່າຍໃນການກວດສອບ ແລະ ຕັດຄ່າງວດອັດຕະໂນມັດ ກະລຸນາ ຊຳລະຄ່າງວດຜ່ານ BPAY ຂອງແອັບ ທະນາຄານການຄ້າ (BECEL ONE) ເພາະທາງບໍລິສັດ ໄດ້ຮັບຜິດຊອບຄ່າທຳນຽມໂອນເງິນທັງໝົດ ແລະ ເງິນຂອງທ່ານລູກຄ້າຈະເຂົ້າຫາເລກສັນຍາໂດຍກົງ

ທ່ານສາມາດປຶກສາກັບພວກເຮົາໄດ້ຕະຫຼອດເວລາ. ໂດຍການຕິດຕໍ່ຫາພະນັກງານຮັບຜິດຊອບຂອງທາງບໍລິສັດ. 
ຂໍຂອບໃຈ.

ສອບຖາມລາຍລະອຽດທີ່:
 - ພງ ຕັດບິນ: *',em.name,'* ',em.main_contact,'
 - ພງ ການຕະຫຼາດ: ', ems.name, '- ', ems.main_contact ) 'BODY',
 case scwm.ccc_name 
When 'DAO2329' Then 45
When 'NOY3804' Then 46
When 'PHET2349' Then 47
When 'PUPIEW2451' Then 48
When 'PAENG2233' Then 49
When 'NING3627' Then 50
else ''
end 'file_id'
FROM sme_collection_wa_msg scwm 
LEFT JOIN tabsme_Employees em on (scwm.ccc_no = em.staff_no)
LEFT JOIN tabsme_Employees ems on (scwm.sales_no = ems.staff_no)

-- BEFORE 20TH
-- 4.1) Last month 20th

-- 4.2) This month 20th



-- BEFORE 25TH
-- 5.1) Last month 25th

-- 5.2 This month 25th

-- BEFORE 30TH
-- 6.1) Last month 31st

-- 6.2) This month 31st

/*
Remark:
*/

-- Then run this sql for export csv file for upload to WhatsApp VIP system
-- for export file to send WA
SELECT whatsapp 'WHATSAPP', body 'BODY', id 'custom_id'
FROM wa_send_bulk_list
WHERE file_id  = 29 -- file_id refer from table [wa_send_bulk_files]




-- HISTORIES OF SQL

SELECT * FROM sme_collection_wa_msg scwm 

SELECT COUNT(name) FROM sme_collection_wa_msg scwm 

-- TRUNCATE TABLE sme_collection_wa_msg; -- for clear table first then will inport new data then will run script

-- Collection this month before 10

SELECT -- COUNT(name)
 '' as 'id', 
concat('856',customer_tel_1) 'WHATSAPP',
CONCAT('ເຖິງລູກຄ້າທຸກທ່ານທີຮັກແພງ ແລະ ນັບຖື
ຂໍຂອບໃຈ ທີ່ນຳໃຊ້ບໍລິການ Lao ASEAN Leasing (LALCO) ຂອງພວກເຮົາຕະຫຼອດມາ.

ອີງຕາມ: ສັນຍາເລກທີ *',contract_no,'* ອອກຊື່ ທ່ານ *', customer_name,'* 
ຈາກການບັນທຶກຂໍ້ມູນຂອງພວກເຮົາ, ການຊຳລະຄ່າງວດຂອງວັນທີ 5 ເດືອນນີ້ແມ່ນທ່ານລູກຄ້າໄດ້ມີການລ່າຊ້າການຊຳລະຕົ້ນທຶນ ແລະ ດອກເບັ້ຍ.
ດັ່ງນັ້ນ, ອິງຕາມມາດຕາຂອງສັນຍາ, ທ່ານລູກຄ້າໄດ້ໝົດສິດເງຶ່ອນໄຂພິເສດການປິດງວດກ່ອນກຳນົດ. ນອກນັ້ນ ລູກຄ້າທີ່ມີເງຶ່ອນໄຂ ຂອງສັນຍາໂດຍການຊຳລະຕົ້ນທຶນບາດດຽວແມ່ນຈະປ່ຽນມາເປັນສັນຍາທີ່ມີເງື່ອນໄຂແບ່ງຈ່າຍໄລຍະຍາວ ແບບອັດຕະໂນມັດ.
 ນອກນັ້ນ, ຖ້າຫາກຊຳລະກາຍວັນທີ 10 ແລ້ວຈະມີຄ່າປັບໃໝຈ່າຍຊ້ານຳ. ດັ່ງນັ້ນ, ກະລຸນາຊຳລະພາຍໃນມື້ນີ້ດ້ວຍ.
 ຫາກສຸດວິໃສການຊຳລະບໍທັນພາຍໃນວັນທີ 10 ແລ້ວ ກະລຸນາຕິດຕໍ່ຫາບໍລິສັດເຮົາກ່ອນ. ທາງເຮົາຈະໃຫ້ຄຳແນະນຳການກູ້ຢືມໂດຍການເພີ່ມຫຼັກຊັບຄ້ຳປະກັນ. ນອກນັ້ນ, ຖ້າຫາກແນະນຳລູກຄ້າໃໝ່ມາໃຫ້ເຮົາ ແມ່ນຈະໄດ້ຮັບຄ່າຕອບແທນໃນການແນະນຳ. ເຊິ່ງຈະເປັນວິທີທີ່ສາມາດເອົາຄ່າແນະນຳດັ່ງກ່່າວມາຊຳລະຄ່າງວດໄດ້.
ທ່ານສາມາດປຶກສາກັບພວກເຮົາໄດ້ຕະຫຼອດເວລາ. ໂດຍການຕິດຕໍ່ຫາພະນັກງານຮັບຜິດຊອບຂອງທາງບໍລິສັດກ່ອນ. 
ຂໍຂອບໃຈ.

ສອບຖາມລາຍລະອຽດທີ່:
 - ພງ ຕັດບິນ: *',em.name,'* ',em.main_contact,'
 - ພງ ການຕະຫຼາດ: ', ems.name, '- ', ems.main_contact ) 'BODY',
 case scwm.ccc_name -- if we need to send for sales follow should be change scwm.ccc_name to scwm.branch
when 'PUPIEW2451' then 13
when 'PAENG2233' then 14
when 'DAO2329' then 15
when 'NING3627' then 16
when 'NOY3804' then 17
when 'PHET2349' then 18
when 'KHAN4027' then 19
when 'TUK984' then 20
else ''
end 'file_id'
FROM sme_collection_wa_msg scwm 
LEFT JOIN tabsme_Employees em on (scwm.ccc_no = em.staff_no)
LEFT JOIN tabsme_Employees ems on (scwm.sales_no = ems.staff_no)
WHERE paid_or_not not in ('already paid') and target  = 1;

-- Last month before 5th
SELECT -- COUNT(name)
 '' as 'id', 
concat('856',customer_tel_1) 'WHATSAPP',
CONCAT('ເຖິງລູກຄ້າທຸກທ່ານທີຮັກແພງ ແລະ ນັບຖື
ຂໍຂອບໃຈ ທີ່ນຳໃຊ້ບໍລິການ Lao ASEAN Leasing (LALCO) ຂອງພວກເຮົາຕະຫຼອດມາ.

ອີງຕາມ: ສັນຍາເລກທີ *',contract_no,'* ອອກຊື່ ທ່ານ *', customer_name,'* 
ແລະ ຂໍ້ມູນການຊຳລະຄ່າງວດແລ້ວ, ທ່ານຍັງບໍ່ທັນໄດ້ຊຳລະຄ່າງວດ ຕົ້ນທຶນ・ດອກເບ້ຍ ຂອງວັນທີ່ *5 ເດືອນແລ້ວ* ມາເທື່ອ. ແລະ *ໃນວັນທີ່ 5 ເດືອນນີ້* ກະເປັນມື້ກຳນົດຊຳລະຄ່າງວດຂອງເດືອນນີ້
ສະນັ້ນ ຈຶ່ງຂໍໃຫ້ທ່ານລູກຄ້າຈ່າຍຊຳລະຄ່າງວດມາພາຍໃນມື້ນີ້. *ເນື່ອງຈາກທ່ານລູກຄ້າໄດ້ຈ່າຍຊ້າໃນເດືອນແລ້ວ,* ໂດຍອີງຕາມເງື່ອນໄຂຂອງສັນຍາແລ້ວ ①ແມ່ນທ່ານລູກຄ້າໄດ້ *ເສຍສິດຂອງເງື່ອນໄຂປິດງວດກ່ອນກຳນົດ* ໃນຕອນເຮັດສັນຍາແລ້ວ. ② ສຳລັບລູກຄ້າທີ່ເຮັດສັນຍາ ດດຕ ແມ່ນ *ສັນຍາຈະຖືກປ່ຽນເປັນສັນຍາໄລຍະຍາວແບບອັດຕະໂນມັດ* ແລະ ③ ສຳລັບລູກຄ້າທີ່ເຮັດ *ສັນຍາເປັນເງິນກີບ-ບາດ ແມ່ນຈະຖືກປ່ຽນເປັນສັນຍາເງິນໂດລາ.*
 ກ່ຽວກັບການຈ່າຍຊຳລະຄັ້ງຕໍ່ໆໄປ ແລະ ການຕໍ່ສັນຍາເອົາວົງເງິນເພີ່ມ ແມ່ນທ່ານສາມາດໂທປຶກສາກັບພະນັກງານການຕະຫຼາດຂອງບໍລິສັດເຮົາໄດ້, ໃນກໍລະນີທີ່ທ່ານລູກຄ້າຫາກຊຳລະຄ່າງວດໃນມື້ນີ້ບໍ່ທັນແທ້ໆ ແມ່ນໃຫ້ທ່ານລູກຄ້າເຂົ້າມາຫ້ອງການ ເພື່ອປຶກສາກັບພະນັກງານການຕະຫຼາດຜູ້ຮັບຜິດຊອບ. ຖ້າຫາກມີຄວາມຍຸ້ງຍາກໃນການເຂົ້າມາຫ້ອງການ ແມ່ນໃຫ້ທ່ານໂທວີດີໂອ ຜ່ານຊ່ອງທາງ WhatsApp ຫາພະນັກງານການຕະຫຼາດຮັບຜິດຊອບຂອງບໍລິສັດເຮົາໂດຍກົງໄດ້

ສອບຖາມລາຍລະອຽດທີ່:
 - ພງ ຕັດບິນ: *',em.name,'* ',em.main_contact,'
 - ພງ ການຕະຫຼາດ: ', ems.name, '- ', ems.main_contact ) 'BODY',
 case scwm.ccc_name 
When 'DAO2329' Then 21
When 'HONEY361' Then 22
When 'NOY3804' Then 23
When 'NUN1603' Then 24
When 'PHET2349' Then 25
When 'PUPIEW2451' Then 26
When 'PAENG2233' Then 27
When 'NING3627' Then 28
When 'JEN3694' Then 29
else ''
end 'file_id'
FROM sme_collection_wa_msg scwm 
LEFT JOIN tabsme_Employees em on (scwm.ccc_no = em.staff_no)
LEFT JOIN tabsme_Employees ems on (scwm.sales_no = ems.staff_no)
WHERE paid_or_not not in ('already paid') and target  = 1;


-- Collection this month before 15






