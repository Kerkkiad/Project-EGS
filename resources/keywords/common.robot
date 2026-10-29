*** Keywords ***
[Common][Login] Log in เข้า website
    [Arguments]    ${URL}
    Set Browser Timeout    45 seconds
    New Browser    chromium    headless=${False}
    ${video_path}=    Join Path    ${OUTPUT_DIR}    browser    video
    &{video_config}=    Create Dictionary    dir=${video_path}
    &{viewport_config}=    Create Dictionary    width=1920    height=1080
    New Context    recordVideo=${video_config}    viewport=${viewport_config}    acceptDownloads=${True}
    New Page    ${URL}

[Common][Menu] กดเข้าเมนู จองห้องประชุมส่วนกลาง
    Browser.Wait For Elements State    ${botegs_cm.Menu}    visible    timeout=10s
    Browser.Click    ${botegs_cm.Menu}

[Common][Menu] กดเข้าเมนูย่อย จองห้องประชุมส่วนกลาง
    Browser.Wait For Elements State    ${botegs_cm.ItemComman}    visible    timeout=10s
    Browser.Click    ${botegs_cm.ItemComman}

[Common][Menu] กดเข้าเมนูย่อย ประวัติจองห้องประชุมส่วนกลาง
    Browser.Wait For Elements State    ${botegs_cm.ItemViewHistory}    visible    timeout=10s
    Browser.Click    ${botegs_cm.ItemViewHistory}

[Common][Process] กระบวนการค้นหาพนักงาน
    [Arguments]    ${EmpName}
    Browser.Switch Page    NEW
    Browser.Fill Text    ${common.NameCoordinator_Input}    ${EmpName}
    Browser.Click    ${common.SearchCoordinator_Button}
    Browser.Wait For Elements State    ${common.NameCoordinator_Select}    visible    timeout=10s
    Browser.Click    ${common.NameCoordinator_Select}

[Common][MainPage] เจาะจง หน้าหลัก
    ${pages}=    Browser.Get Page Ids
    Browser.Switch Page    ${pages}[0]

[Common][Sunday] ดึงค่าวันอาทิตย์
    ${next_sunday}=    Evaluate    datetime.date.today() + datetime.timedelta(days=(6 - datetime.date.today().weekday()) or 7)    modules=datetime
    RETURN    ${next_sunday}

[Common][Sunday] ดึงค่าวันที่และแปลงเป็น Format ไทย
    ${next_sun}=    [Common][Sunday] ดึงค่าวันอาทิตย์
    ${expected_date}=    Set Variable    ${{ str($next_sun.day).zfill(2) }} ${THAI_MONTHS_SHORT}[${{ $next_sun.month - 1 }}] ${{ str($next_sun.year + 543)[-2:] }}
    RETURN    ${expected_date}

[Common][Sunday] เลือกข้อมูล วันอาทิตย์
    Browser.Switch Page    NEW
    ${next_sunday}=    [Common][Sunday] ดึงค่าวันอาทิตย์
    ${xpath_locator}=    Format String    ${botegs_cm.SearchSunday_Calendar}    day=${next_sunday.day}
    Wait For Elements State    ${xpath_locator}    visible    timeout=5s
    Browser.Click    ${xpath_locator}
