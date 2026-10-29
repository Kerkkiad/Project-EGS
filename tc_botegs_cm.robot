*** Settings ***
Resource    ./setting/import.robot
Test Setup    [Common][Login] Log in เข้า website    ${common.url}
Test Teardown    Close Browser    ALL

*** Test Cases ***
TC01_001_CreateCM จองห้องประชุมส่วนกลาง กรอกข้อมูลจำเป็น ครบถ้วน
    [Common][Menu] กดเข้าเมนู จองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนูย่อย จองห้องประชุมส่วนกลาง
    [botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาผู้ประสานงาน
    [Common][Process] กระบวนการค้นหาพนักงาน    ${TC01_001.Create_CoordinatorName}
    [botegs_CM][Create] กดเลือก วัตถุประสงค์
    Sleep    5s
    [botegs_CM][Create] กรอกหัวข้อ การประชุม
    [botegs_CM][Create] กดปุ่ม ปฏิทินห้อง
    [botegs_CM][Create] กดเลือก สลับ เดือน ชั่วคราว
    [botegs_CM][Create] กดเลือก ห้องประชุม และ วันที่    ${TC01_001.Create_RoomName}
    [botegs_CM][Create] กดเลือก เวลาเริ่มต้น ถึง สิ้นสุด
    [botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาประธาน
    [Common][Process] กระบวนการค้นหาพนักงาน    ${TC01_001.Create_ChairmanName}
    Sleep    5s
    [botegs_CM][Create] กรอกจำนวนผู้เข้าร่วมประชุม ภายใน ธปท
    [botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาผู้ประเมิน
    [Common][Process] กระบวนการค้นหาพนักงาน    ${TC01_001.Create_AssessorName}
    [botegs_CM][Create] กดปุ่ม เพิ่ม ผู้ประเมิน
    Sleep    5s
    [botegs_CM][Create] กดปุ่ม 3 จุด ค้นหาผู้ประเมิน
    [Common][Process] กระบวนการค้นหาพนักงาน    ${TC01_001.Create_AssessorName}
    Sleep    5s
    [botegs_CM][Create] กดปุ่ม บันทึกข้อมูล
    [botegs_CM][Verify] ระบบบันทึกสำเร็จและพากลับมาหน้าแสดงข้อมูล
    [botegs_CM][Verify] ตรวจสอบข้อมูลและสถานะการจอง
    Sleep    5s

TC01_002_EditCM แก้ไขการจองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนู จองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนูย่อย ประวัติจองห้องประชุมส่วนกลาง
    [botegs_CM][Edit] กดปุ่ม ไอคอนดินสอ แก้ไขข้อมูล
    [botegs_CM][Edit] แก้ไขข้อมูล หัวข้อการประชุม
    [botegs_CM][Edit] กดปุ่ม บันทึก
    Sleep    3s
    [botegs_CM][Edit] กดปุ่ม ไอคอนดินสอ แก้ไขข้อมูล
    [botegs_CM][Verify] ตรวจสอบข้อมูล แก้ไข
    Sleep    7s

TC01_003_ViewHitoryCM ดูประวัติการจองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนู จองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนูย่อย ประวัติจองห้องประชุมส่วนกลาง
    [botegs_CM][View] ค้นหาข้อมูล ห้อง
    [botegs_CM][View] กดปฏิทิน วันที่ใช้ห้อง จาก
    [Common][Sunday] เลือกข้อมูล วันอาทิตย์
    [botegs_CM][View] ค้นหาข้อมูล สถานะ
    [botegs_CM][View] กดปุ่ม ค้นหาข้อมูล
    [botegs_CM][View] ตรวจสอบการแสดงข้อมูล ตาราง
    Sleep    7s

TC01_004_CancelCM ยกเลิกการจองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนู จองห้องประชุมส่วนกลาง
    [Common][Menu] กดเข้าเมนูย่อย ประวัติจองห้องประชุมส่วนกลาง
    [botegs_CM][Cancel] กดปุ่ม ไอคอนยางลบ ยกเลิกข้อมูล
    Sleep    5s
    [botegs_CM][Verify] ตรวจสอบข้อมูลและยกเลิกสถานะการจอง
    Sleep    7s
