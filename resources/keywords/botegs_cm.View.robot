*** Keywords ***
[botegs_CM][View] ค้นหาข้อมูล ห้อง
    Browser.Select Options By    ${botegs_cm.SearchRoom_Dropdown}    label    ${TC01_001.Create_RoomName}

[botegs_CM][View] กดปฏิทิน วันที่ใช้ห้อง จาก
    Browser.Click    ${botegs_cm.FromDate_Calendar}

[botegs_CM][View] ค้นหาข้อมูล สถานะ
    [Common][MainPage] เจาะจง หน้าหลัก
    Browser.Select Options By    ${botegs_cm.SearchStatus_Dropdown}    label    ${TC01_002.View_Status}

[botegs_CM][View] กดปุ่ม ค้นหาข้อมูล
    Browser.Click    ${botegs_cm.Search_Button}

[botegs_CM][View] ตรวจสอบการแสดงข้อมูล ตาราง
    ${expected_date}=    [Common][Sunday] ดึงค่าวันที่และแปลงเป็น Format ไทย
    ${selector}=    Format String    ${botegs_cm.VerifyCreate_Row}    expected_date=${expected_date}    room_number=${TC01_001.Create_RoomNumber}
    Wait For Elements State    ${botegs_cm.Verify_Table}    visible    timeout=15s
    Wait For Elements State    ${selector}    visible    timeout=15s
