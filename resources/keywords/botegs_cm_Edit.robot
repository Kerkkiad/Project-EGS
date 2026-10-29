*** Keywords ***
[botegs_CM][Edit] กดปุ่ม ไอคอนดินสอ แก้ไขข้อมูล
    ${expected_date}=    [Common][Sunday] ดึงค่าวันที่และแปลงเป็น Format ไทย
    ${selector}=    Format String    ${botegs_cm.EditIcon}    expected_date=${expected_date}    room_number=${TC01_001.Create_RoomNumber}
    Wait For Elements State    ${selector}    visible    timeout=15s
    Browser.Click    ${selector}

[botegs_CM][Edit] แก้ไขข้อมูล หัวข้อการประชุม
    Browser.Fill Text    ${botegs_cm.Subject_Input}    ${TC01_002.Edit_SubjectName}

[botegs_CM][Edit] กดปุ่ม บันทึก
    Browser.Click    ${botegs_cm.SubmitCreate_Button}

[botegs_CM][Verify] ตรวจสอบข้อมูล แก้ไข
    Browser.Get Property    ${botegs_cm.Subject_Input}    value    ==    ${TC01_002.Edit_SubjectName}
