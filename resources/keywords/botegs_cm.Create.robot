*** Keywords ***
[botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาผู้ประสานงาน
    Browser.Click    ${botegs_cm.Coordinator_Button}

[botegs_CM][Create] กดเลือก วัตถุประสงค์
    [Common][MainPage] เจาะจง หน้าหลัก
    Browser.Check Checkbox    ${botegs_cm.Obj_Checkbox}

[botegs_CM][Create] กรอกหัวข้อ การประชุม
    Browser.Wait For Elements State    ${botegs_cm.Subject_Input}    visible    timeout=45s
    Browser.Fill Text    ${botegs_cm.Subject_Input}    ${TC01_001.Create_SubjectName}

[botegs_CM][Create] กดปุ่ม ปฏิทินห้อง
    Browser.Click    ${botegs_cm.ClnRoom_Calender}

[botegs_CM][Create] กดเลือก สลับ เดือน ชั่วคราว
    Browser.Switch Page    NEW
    ${current_month}=    Browser.Get Property    ${botegs_cm.ClnMouth_Dropdown}    value
    ${temp_month}=    Evaluate    "1" if "${current_month}" != "1" else "2"
    Browser.Select Options By    ${botegs_cm.ClnMouth_Dropdown}    value    ${temp_month}
    Browser.Select Options By    ${botegs_cm.ClnMouth_Dropdown}    value    ${current_month}

[botegs_CM][Create] กดเลือก ห้องประชุม และ วันที่
    [Arguments]    ${room_name}
    ${next_sunday}=    [Common][Sunday] ดึงค่าวันอาทิตย์
    ${month_name}=    Set Variable    ${THAI_MONTHS_FULL}[${next_sunday.month}]
    ${year_str}=    Set Variable    ${{ str($next_sunday.year) }}
    Browser.Select Options By    ${botegs_cm.ClnMouth_Dropdown}    label    ${month_name}
    Sleep    3s
    Browser.Select Options By    ${botegs_cm.ClnYear_Dropdown}    label    ${year_str}
    ${selector}=    Format String    ${botegs_cm.ClnSunday_Input}    room=${room_name}    y=${next_sunday.year}    m=${next_sunday.month}    d=${next_sunday.day}
    Wait For Elements State    ${selector}    visible    timeout=10s
    Browser.Click    ${selector}

[botegs_CM][Create] กดเลือก เวลาเริ่มต้น ถึง สิ้นสุด
    Browser.Select Options By    ${botegs_cm.StartTime_Dropdown}    value    ${TC01_001.Create_StartTime}
    Browser.Select Options By    ${botegs_cm.EndTime_Dropdown}    value    ${TC01_001.Create_EndTime}

[botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาประธาน
    Browser.Click    ${botegs_cm.Chairman_Button}

[botegs_CM][Create] กรอกจำนวนผู้เข้าร่วมประชุม ภายใน ธปท
    [Common][MainPage] เจาะจง หน้าหลัก
    Browser.Wait For Elements State    ${botegs_cm.Insider_Input}    visible    timeout=45s
    Browser.Fill Text    ${botegs_cm.Insider_Input}    ${TC01_001.Create_InsiderCount}

[botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาผู้ประเมิน
    Browser.Wait For Elements State    ${botegs_cm.Assessor_Button}    visible    timeout=45s
    Browser.Click    ${botegs_cm.Assessor_Button}

[botegs_CM][Create] กดปุ่ม เพิ่ม ผู้ประเมิน
    Browser.Wait For Elements State    ${botegs_cm.AddAssessor_Button}    visible    timeout=45s
    Browser.Click    ${botegs_cm.AddAssessor_Button}

[botegs_CM][Create] กดปุ่ม บันทึกข้อมูล
    Browser.Wait For Elements State    ${botegs_cm.SubmitCreate_Button}    visible    timeout=45s
    Browser.Click    ${botegs_cm.SubmitCreate_Button}

[botegs_CM][Verify] ระบบบันทึกสำเร็จและพากลับมาหน้าแสดงข้อมูล
    Browser.Wait For Elements State    ${botegs_cm.VerifySubmit_Table}    visible    timeout=45s

[botegs_CM][Verify] ตรวจสอบข้อมูลและสถานะการจอง
    ${expected_date}=    [Common][Sunday] ดึงค่าวันที่และแปลงเป็น Format ไทย
    ${selector}=    Format String    ${botegs_cm.VerifyCreate_Row}    expected_date=${expected_date}    room_number=${TC01_001.Create_RoomNumber}
    Wait For Elements State    ${selector}    visible    timeout=45s
    Browser.Get Element Count    ${selector}    >    0
