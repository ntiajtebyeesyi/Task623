-- WA to Dormant

select concat('856', apl.customer_tel) `WHATSAPP`,
concat('ສະບາຍດີ ',apl.customer_name ,' (', apl.customer_tel ,') ທີ່ຮັກແພງ',
'

ຂ້ອຍແມ່ນ ',org.staff_name ,' ເປັນຫົວໜ້າຂະແໜງການຕະຫຼາດ ຢູ່ລາວອາຊຽນເຊົ່າສິນເຊື່ອ ທີ່ລູກຄ້າເຄີຍມາໃຊ້ບໍລິການຄັ້ງກ່ອນ.
ພວກເຮົາຕ້ອງຂໍອະໄພມານະທີ່ນີ້ດ້ວຍ ຫາກຄັ້ງກ່ອນທາງເຮົາໃຫ້ບໍລິການບໍທົ່ວເຖິງ ແລະ ພະນັກງານບໍລິການບໍສຸພາບ.

ຂໍ້ຄວາມສະບັບນີ້ເພື່ອຢາກຈະທາບທາມ ຖາມຂ່າວວ່າຊ່ວງນີ້ ທຸລະກິດລູກຄ້າເປັນຈັ່ງໃດ, ສະພາບຄ່ອງທາງການເງິນຍັງສະຖຽນຢູ່ບໍ? ມີຫຍັງທີ່ທາງເຮົາສາມາດຊ່ວຍລູກຄ້າໄດ້ອີກບໍ?
ແລະ ຢາກແຈ້ງໃຫ້ລູກຄ້າຊາບວ່າ ປະຈຸບັນພວກເຮົາກຳລັງຂະຫຍາຍສາຂາໃໝ່ຢູ່ຫຼາຍສາຂາ ເພື່ອໃກ້ ແລະ ສາມາດໃຫ້ບໍລິການລູກຄ້າໄດ້ທັນທີເມື່ອລູກຄ້າຕ້ອງການ ເຊິ່ງທາງເຮົາຍັງຮັກສາຂໍ້ມູນເກົ່າຂອງລູກຄ້າໄວ້ຢ່າງດີ ສາມາດປະກອບເອກະສານໃຫ້ໄດ້ພາຍໃນມື້ .
ນອກນັ້ນ, *ທາງເຮົາມີເງື່ອນໄຂພິເສດ* ມາສະເໜີສຳລັບລູກຄ້າເກົ່າຂອງພວກເຮົາທີ່ຈ່າຍດີໃນຄັ້ງກ່ອນຈະໄດ້ຮັບດອກເບ້ຍພິເສດ *1.99%* 
ແລະ ສຳລັບລົດໃໝ່ປີ 2024 ຮັບດອກເບ້ຍ 1.29%

ພິເສດ: ໃນກໍລະນີທີ່ທ່ານແນະນໍາລູກຄ້າມາໃຫ້, ເມື່ອເຮັດສັນຍາຮຽບຮ້ອຍແລ້ວ *ທ່ານຈະໄດ້ຄ່າຕອບແທນ3,5%* ຂອງດອກເບ້ຍທັງໝົດ

ທ່ານສາມາດປຶກສາ ແລະ ສອບຖາມລາຍລະອຽດທີ່: ', emp.main_contact,'-',org.staff_name)
as `BODY`,
emp.name `custom_id`
FROM tabSME_Approach_list apl
left join tabsme_Employees emp on (apl.staff_no = emp.name)
left join sme_org org on (emp.staff_no = org.staff_no)
WHERE approach_type = 'Dormant'
and org.sec_branch_no  = 1

-- WA to Resigned employees for each Section https://docs.google.com/spreadsheets/d/1hPj0t15mY4OuGQjOPjDYVxQsbExgdq9AtJH3hjGdwNI/edit?gid=1078656354#gid=1078656354
select concat('856', right(emp.main_contact , length(emp.main_contact) - 2)) `WHATSAPP`,
concat('ສະບາຍດີ ທ່ານ ', right(emp.main_contact , length(emp.main_contact) - 2) ,' ທີ່ຮັກແພງ',
'
ຂ້ອຍແມ່ນ ',org.staff_name ,' ເດີ, ຍັງເຮັດວຽກຢູ່ລາວອາຊຽນຄືເກົ່າເດີ້ ຖ້ານ້ອງມີລູກຄ້າທີ່ເຄີຍຕິດຕາມ ຫຼື ວ່າມີລູກຄ້າສົນໃຈສາມາດເເນະນຳລູກຄ້າມາໄດ້ເດີ້ ລູກຄ້າເກົ່າກໍໄດ້ຄ່ານາຍໜ້າຄືກັນ 1,75 %  ຂອງດອກເບ້ຍທັງໝົດ ເເລ້ວ ເເນະນຳມາເດີ້
ແລະ ມີເງຶ່ອນໄຂ ພິເສດຄື ຖ້າເປັນລູກຄ້າເກົ່າທີ່ເຄີຍຈ່າຍດີ ແມ່ນດອກເບັ້ຍຫຼຸດລົງເປັນ 1.99% ແລະ ຖ້າເປັນລູກຄ້າໃໝ່ ປິດງວດຢູ່ບໍລິສັດອື່ນແມ່ນ ດອກເບັ້ຍ 1.29% ເດີເຈົ້າ.
ຫຼື ຖ້າຢາກກັບມາເຮັດວຽກຄືນ ຫຼື ມີໝູ່ຄູ່ພີ່ນ້ອງທີ່ຢາກໃຫ້ມາເຮັດວຽກຢູ່ ລາໂກ້ແມ່ນສາມາດຕິດຕໍ່ມາໄດ້ເດີເຈົ້າ.
ຢາລືມໂທຫາ: ', emp.main_contact)
as `BODY`,
emp.name `custom_id`
from tabsme_Employees emp 
left join sme_org org on (org.staff_no = emp.assignee)
where emp.staff_status = 'Resigned'
        and org.sec_branch_no  = 1
;
