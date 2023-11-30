import pytest
import test_helpers

from django.urls import reverse


pytestmark = [pytest.mark.django_db]


def tests_ToolsShopFloor_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_ToolsShopFloor()
    instance2 = test_helpers.create_toolbreakapp624c_ToolsShopFloor()
    url = reverse("toolbreakapp624c_ToolsShopFloor_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_ToolsShopFloor_create_view(client):
    url = reverse("toolbreakapp624c_ToolsShopFloor_create")
    data = {
        "tool_num": "text",
        "serial_num": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_ToolsShopFloor_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_ToolsShopFloor()
    url = reverse("toolbreakapp624c_ToolsShopFloor_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_ToolsShopFloor_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_ToolsShopFloor()
    url = reverse("toolbreakapp624c_ToolsShopFloor_update", args=[instance.pk, ])
    data = {
        "tool_num": "text",
        "serial_num": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_CompactIssue_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_CompactIssue()
    instance2 = test_helpers.create_toolbreakapp624c_CompactIssue()
    url = reverse("toolbreakapp624c_CompactIssue_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_CompactIssue_create_view(client):
    url = reverse("toolbreakapp624c_CompactIssue_create")
    data = {
        "rank": 1,
        "issues": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_CompactIssue_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_CompactIssue()
    url = reverse("toolbreakapp624c_CompactIssue_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_CompactIssue_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_CompactIssue()
    url = reverse("toolbreakapp624c_CompactIssue_update", args=[instance.pk, ])
    data = {
        "rank": 1,
        "issues": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PartNumber_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_PartNumber()
    instance2 = test_helpers.create_toolbreakapp624c_PartNumber()
    url = reverse("toolbreakapp624c_PartNumber_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_PartNumber_create_view(client):
    url = reverse("toolbreakapp624c_PartNumber_create")
    data = {
        "part_name": "text",
        "part_number": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PartNumber_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_PartNumber()
    url = reverse("toolbreakapp624c_PartNumber_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_PartNumber_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_PartNumber()
    url = reverse("toolbreakapp624c_PartNumber_update", args=[instance.pk, ])
    data = {
        "part_name": "text",
        "part_number": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Tool_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_Tool()
    instance2 = test_helpers.create_toolbreakapp624c_Tool()
    url = reverse("toolbreakapp624c_Tool_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_Tool_create_view(client):
    url = reverse("toolbreakapp624c_Tool_create")
    data = {
        "serial_num": "text",
        "cost": 1.0,
        "fix": "text",
        "tool_num": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Tool_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_Tool()
    url = reverse("toolbreakapp624c_Tool_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_Tool_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_Tool()
    url = reverse("toolbreakapp624c_Tool_update", args=[instance.pk, ])
    data = {
        "serial_num": "text",
        "cost": 1.0,
        "fix": "text",
        "tool_num": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Supervisor_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_Supervisor()
    instance2 = test_helpers.create_toolbreakapp624c_Supervisor()
    url = reverse("toolbreakapp624c_Supervisor_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_Supervisor_create_view(client):
    url = reverse("toolbreakapp624c_Supervisor_create")
    data = {
        "supervisor_email": "text",
        "supervisors": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Supervisor_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_Supervisor()
    url = reverse("toolbreakapp624c_Supervisor_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_Supervisor_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_Supervisor()
    url = reverse("toolbreakapp624c_Supervisor_update", args=[instance.pk, ])
    data = {
        "supervisor_email": "text",
        "supervisors": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PressSelect_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_PressSelect()
    instance2 = test_helpers.create_toolbreakapp624c_PressSelect()
    url = reverse("toolbreakapp624c_PressSelect_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_PressSelect_create_view(client):
    url = reverse("toolbreakapp624c_PressSelect_create")
    data = {
        "press_num": 1,
        "process": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PressSelect_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_PressSelect()
    url = reverse("toolbreakapp624c_PressSelect_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_PressSelect_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_PressSelect()
    url = reverse("toolbreakapp624c_PressSelect_update", args=[instance.pk, ])
    data = {
        "press_num": 1,
        "process": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PressInfo_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_PressInfo()
    instance2 = test_helpers.create_toolbreakapp624c_PressInfo()
    url = reverse("toolbreakapp624c_PressInfo_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_PressInfo_create_view(client):
    url = reverse("toolbreakapp624c_PressInfo_create")
    data = {
        "occurance": "text",
        "press_position": "text",
        "rig_num": "text",
        "tonnage": "text",
        "fault_msg": "text",
        "head_num": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PressInfo_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_PressInfo()
    url = reverse("toolbreakapp624c_PressInfo_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_PressInfo_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_PressInfo()
    url = reverse("toolbreakapp624c_PressInfo_update", args=[instance.pk, ])
    data = {
        "occurance": "text",
        "press_position": "text",
        "rig_num": "text",
        "tonnage": "text",
        "fault_msg": "text",
        "head_num": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Deviation_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_Deviation()
    instance2 = test_helpers.create_toolbreakapp624c_Deviation()
    url = reverse("toolbreakapp624c_Deviation_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_Deviation_create_view(client):
    url = reverse("toolbreakapp624c_Deviation_create")
    data = {
        "attach_photo_of_rid": "anImage",
        "attempts_to_fix": "text",
        "reason_for_deviation": "text",
        "sign_off": "text",
        "attach_photo_of_cmm": "anImage",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Deviation_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_Deviation()
    url = reverse("toolbreakapp624c_Deviation_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_Deviation_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_Deviation()
    url = reverse("toolbreakapp624c_Deviation_update", args=[instance.pk, ])
    data = {
        "attach_photo_of_rid": "anImage",
        "attempts_to_fix": "text",
        "reason_for_deviation": "text",
        "sign_off": "text",
        "attach_photo_of_cmm": "anImage",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Engineering_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_Engineering()
    instance2 = test_helpers.create_toolbreakapp624c_Engineering()
    url = reverse("toolbreakapp624c_Engineering_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_Engineering_create_view(client):
    url = reverse("toolbreakapp624c_Engineering_create")
    data = {
        "engineer_analysis": "text",
        "prevent_recurrence": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Engineering_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_Engineering()
    url = reverse("toolbreakapp624c_Engineering_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_Engineering_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_Engineering()
    url = reverse("toolbreakapp624c_Engineering_update", args=[instance.pk, ])
    data = {
        "engineer_analysis": "text",
        "prevent_recurrence": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_ToolRoom_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_ToolRoom()
    instance2 = test_helpers.create_toolbreakapp624c_ToolRoom()
    url = reverse("toolbreakapp624c_ToolRoom_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_ToolRoom_create_view(client):
    tool = test_helpers.create_toolbreakapp624c_Tool()
    url = reverse("toolbreakapp624c_ToolRoom_create")
    data = {
        "observations_breakdown": "text",
        "broken_part_pic_tr": "anImage",
        "tool": tool.pk,
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_ToolRoom_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_ToolRoom()
    url = reverse("toolbreakapp624c_ToolRoom_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_ToolRoom_update_view(client):
    tool = test_helpers.create_toolbreakapp624c_Tool()
    instance = test_helpers.create_toolbreakapp624c_ToolRoom()
    url = reverse("toolbreakapp624c_ToolRoom_update", args=[instance.pk, ])
    data = {
        "observations_breakdown": "text",
        "broken_part_pic_tr": "anImage",
        "tool": tool.pk,
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_ToolBreakageReport_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_ToolBreakageReport()
    instance2 = test_helpers.create_toolbreakapp624c_ToolBreakageReport()
    url = reverse("toolbreakapp624c_ToolBreakageReport_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_ToolBreakageReport_create_view(client):
    part_number = test_helpers.create_toolbreakapp624c_PartNumber()
    engineering = test_helpers.create_toolbreakapp624c_Engineering()
    press_information = test_helpers.create_toolbreakapp624c_PressInfo()
    compact_issue = test_helpers.create_toolbreakapp624c_CompactIssue()
    broken_tools_shop_floor = test_helpers.create_toolbreakapp624c_ToolsShopFloor()
    press_number = test_helpers.create_toolbreakapp624c_PressSelect()
    toolroom = test_helpers.create_toolbreakapp624c_ToolRoom()
    coining_issue = test_helpers.create_toolbreakapp624c_CoinIssue()
    url = reverse("toolbreakapp624c_ToolBreakageReport_create")
    data = {
        "if_other_describe": "text",
        "countermeasure": "text",
        "sup_approval": "text",
        "break_dev_select": "text",
        "broken_part_pic": "anImage",
        "status": "text",
        "num_parts_before_breakage": 1,
        "employee_name": "text",
        "root_cause": "text",
        "report_date_time": datetime.now(),
        "part_number": part_number.pk,
        "engineering": engineering.pk,
        "press_information": press_information.pk,
        "compact_issue": compact_issue.pk,
        "broken_tools_shop_floor": broken_tools_shop_floor.pk,
        "press_number": press_number.pk,
        "toolroom": toolroom.pk,
        "coining_issue": coining_issue.pk,
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_ToolBreakageReport_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_ToolBreakageReport()
    url = reverse("toolbreakapp624c_ToolBreakageReport_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_ToolBreakageReport_update_view(client):
    part_number = test_helpers.create_toolbreakapp624c_PartNumber()
    engineering = test_helpers.create_toolbreakapp624c_Engineering()
    press_information = test_helpers.create_toolbreakapp624c_PressInfo()
    compact_issue = test_helpers.create_toolbreakapp624c_CompactIssue()
    broken_tools_shop_floor = test_helpers.create_toolbreakapp624c_ToolsShopFloor()
    press_number = test_helpers.create_toolbreakapp624c_PressSelect()
    toolroom = test_helpers.create_toolbreakapp624c_ToolRoom()
    coining_issue = test_helpers.create_toolbreakapp624c_CoinIssue()
    instance = test_helpers.create_toolbreakapp624c_ToolBreakageReport()
    url = reverse("toolbreakapp624c_ToolBreakageReport_update", args=[instance.pk, ])
    data = {
        "if_other_describe": "text",
        "countermeasure": "text",
        "sup_approval": "text",
        "break_dev_select": "text",
        "broken_part_pic": "anImage",
        "status": "text",
        "num_parts_before_breakage": 1,
        "employee_name": "text",
        "root_cause": "text",
        "report_date_time": datetime.now(),
        "part_number": part_number.pk,
        "engineering": engineering.pk,
        "press_information": press_information.pk,
        "compact_issue": compact_issue.pk,
        "broken_tools_shop_floor": broken_tools_shop_floor.pk,
        "press_number": press_number.pk,
        "toolroom": toolroom.pk,
        "coining_issue": coining_issue.pk,
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Help_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_Help()
    instance2 = test_helpers.create_toolbreakapp624c_Help()
    url = reverse("toolbreakapp624c_Help_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_Help_create_view(client):
    url = reverse("toolbreakapp624c_Help_create")
    data = {
        "help": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Help_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_Help()
    url = reverse("toolbreakapp624c_Help_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_Help_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_Help()
    url = reverse("toolbreakapp624c_Help_update", args=[instance.pk, ])
    data = {
        "help": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_CoinIssue_list_view(client):
    instance1 = test_helpers.create_toolbreakapp624c_CoinIssue()
    instance2 = test_helpers.create_toolbreakapp624c_CoinIssue()
    url = reverse("toolbreakapp624c_CoinIssue_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_CoinIssue_create_view(client):
    url = reverse("toolbreakapp624c_CoinIssue_create")
    data = {
        "issue": "text",
        "rank": 1,
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_CoinIssue_detail_view(client):
    instance = test_helpers.create_toolbreakapp624c_CoinIssue()
    url = reverse("toolbreakapp624c_CoinIssue_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_CoinIssue_update_view(client):
    instance = test_helpers.create_toolbreakapp624c_CoinIssue()
    url = reverse("toolbreakapp624c_CoinIssue_update", args=[instance.pk, ])
    data = {
        "issue": "text",
        "rank": 1,
    }
    response = client.post(url, data)
    assert response.status_code == 302
