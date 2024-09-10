-- WA send
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
 case scwm.ccc_name when 'PUPIEW2451' then 13
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
