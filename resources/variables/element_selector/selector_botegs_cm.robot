*** Variables ***
# Menu
${botegs_cm.Menu}    xpath=//a[contains(@class, 'has-submenu') and contains(., 'จองห้องประชุมส่วนกลาง')]
${botegs_cm.ItemComman}    xpath=//a[@href='/BOTEGS/room/EGS_addRmReq.aspx']
${botegs_cm.ItemViewHistory}    xpath=//a[@href='/BOTEGS/Room/EGS_listRmUser.aspx']

# Create: coordinator, purpose, subject, calendar, time, participants
${botegs_cm.Coordinator_Button}    xpath=//input[@id='btnLookupClient_RequestHeader_ad1Co']
${botegs_cm.Obj_Checkbox}    xpath=//input[@id='chkPurpose_0']
${botegs_cm.Subject_Input}    xpath=//input[@id='txtSubject']
${botegs_cm.ClnMouth_Dropdown}    xpath=//select[@id='ddlMonth']
${botegs_cm.ClnYear_Dropdown}    xpath=//select[@id='ddlYear']
${botegs_cm.ClnRoom_Calender}    xpath=//input[@id='gbtOpen']
${botegs_cm.ClnSunday_Input}    xpath=//tr[td[contains(@class, 'ListHeaderStyle') and contains(., '{room}')]]//td[@title='Sunday' and contains(@onclick, '_{y}_{m}_{d}')]
${botegs_cm.StartTime_Dropdown}    xpath=//select[@id='ddlStartTime']
${botegs_cm.EndTime_Dropdown}    xpath=//select[@id='ddlEndTime']
${botegs_cm.Chairman_Button}    xpath=//input[@id='adSearchChairman_btnLookUp']
${botegs_cm.Insider_Input}    xpath=//input[@id='txtTTLBOT']
${botegs_cm.Assessor_Button}    xpath=//input[@id='btnLookupClient_ad1Ques']
${botegs_cm.AddAssessor_Button}    xpath=//a[@id='lnkAdd']/img
${botegs_cm.SubmitCreate_Button}    xpath=//input[@id='ButtonPanel1_btnSubmit']

# Table and booking actions
${botegs_cm.VerifySubmit_Table}    xpath=//table[@id='dtgList'][.//td[contains(., 'เลขที่แจ้ง')]]
${botegs_cm.Verify_Table}    xpath=//table[@id='dtgList']
${botegs_cm.VerifyCreate_Row}    xpath=//table[@id='dtgList']//tr[td[contains(., '{expected_date}')] and td[contains(., '{room_number}')] and td[contains(., 'เริ่มแจ้ง')]]
${botegs_cm.VerifyCancel_Row}    xpath=(//table[@id='dtgList']//tr[td[contains(., '{expected_date}')] and td[contains(., '{room_number}')] and td[contains(., 'ยกเลิก')]])[1]
${botegs_cm.Table_Rows}    xpath=//table[@id='dtgList']//tbody/tr
${botegs_cm.EditIcon}    xpath=//table[@id='dtgList']//tr[td[contains(., '{expected_date}')] and td[contains(., '{room_number}')]]//a[contains(@href, 'EGS_editRmReq.aspx')]
${botegs_cm.SearchRoom_Dropdown}    xpath=//select[@id='ddlRoom_id']
${botegs_cm.FromDate_Calendar}    xpath=//input[@id='calStart_date_from']/following-sibling::a[1]
${botegs_cm.ToDate_Calendar}    xpath=//input[@id='calStart_date_to']/following-sibling::a[1]
${botegs_cm.SearchSunday_Calendar}    xpath=//table//tr/td[last()[normalize-space(.)='{day}']]
${botegs_cm.SearchStatus_Dropdown}    xpath=//select[@id='ddlStatus']
${botegs_cm.Search_Button}    xpath=//input[@id='btnSearch']
${botegs_cm.CancelIcon}    xpath=//table[@id='dtgList']//tr[td[contains(., '{expected_date}')] and td[contains(., '{room_number}')] and td[contains(., 'เริ่มแจ้ง')]]//a[contains(@id, '_lnkCancel')]
