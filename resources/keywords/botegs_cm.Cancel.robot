*** Keywords ***
[botegs_CM][Cancel] กดปุ่ม ไอคอนยางลบ ยกเลิกข้อมูล
    ${expected_date}=    [Common][Sunday] ดึงค่าวันที่และแปลงเป็น Format ไทย
    ${selector}=    Format String    ${botegs_cm.CancelIcon}    expected_date=${expected_date}    room_number=${TC01_001.Create_RoomNumber}
    Handle Future Dialogs    action=accept
    Wait For Elements State    ${selector}    visible    timeout=15s
    Browser.Click    ${selector}

[botegs_CM][Verify] ตรวจสอบข้อมูลและยกเลิกสถานะการจอง
    ${expected_date}=    [Common][Sunday] ดึงค่าวันที่และแปลงเป็น Format ไทย
    ${selector}=    Format String    ${botegs_cm.VerifyCancel_Row}    expected_date=${expected_date}    room_number=${TC01_001.Create_RoomNumber}
    Wait For Elements State    ${selector}    visible    timeout=15s
