*** Variables ***

# !!! ============================ | Test data | ============================ !!!
# Common test data
${common.url}    https://example.test/BOTEGS/Menu/Default.aspx
&{THAI_MONTHS_FULL}    1=มกราคม    2=กุมภาพันธ์    3=มีนาคม    4=เมษายน    5=พฤษภาคม    6=มิถุนายน    7=กรกฎาคม    8=สิงหาคม    9=กันยายน    10=ตุลาคม    11=พฤศจิกายน    12=ธันวาคม
&{THAI_MONTHS_SHORT}    1=ม.ค.    2=ก.พ.    3=มี.ค.    4=เม.ย.    5=พ.ค.    6=มิ.ย.    7=ก.ค.    8=ส.ค.    9=ก.ย.    10=ต.ค.    11=พ.ย.    12=ธ.ค.

# TC01_001
${TC01_001.Create_CoordinatorName}    ผู้ประสานงานตัวอย่าง
${TC01_001.Create_SubjectName}    PORTFOLIO-DEMO-2026-001
${TC01_001.Create_RoomName}    ห้องตัวอย่าง 999
${TC01_001.Create_RoomNumber}    999
${TC01_001.Create_StartTime}    09:00
${TC01_001.Create_EndTime}    10:00
${TC01_001.Create_ChairmanName}    ประธานตัวอย่าง
${TC01_001.Create_InsiderCount}    5
${TC01_001.Create_OutsideCount}    1
${TC01_001.Create_OrgName}    องค์กรตัวอย่าง
${TC01_001.Create_AssessorName}    ผู้ประเมินตัวอย่าง

# TC01_002
${TC01_002.Edit_SubjectName}    PORTFOLIO-DEMO-2026-001-EDITED
${TC01_002.View_Status}    เริ่มแจ้ง
