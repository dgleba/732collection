import random
import string

from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.models import Group
from django.contrib.contenttypes.models import ContentType
from datetime import datetime

from toolbreakapp624c import models as toolbreakapp624c_models
from blogappm2m import models as blogappm2m_models


def random_string(length=10):
    # Create a random string of length length
    letters = string.ascii_lowercase
    return "".join(random.choice(letters) for i in range(length))


def create_User(**kwargs):
    defaults = {
        "username": "%s_username" % random_string(5),
        "email": "%s_username@tempurl.com" % random_string(5),
    }
    defaults.update(**kwargs)
    return User.objects.create(**defaults)


def create_AbstractUser(**kwargs):
    defaults = {
        "username": "%s_username" % random_string(5),
        "email": "%s_username@tempurl.com" % random_string(5),
    }
    defaults.update(**kwargs)
    return AbstractUser.objects.create(**defaults)


def create_AbstractBaseUser(**kwargs):
    defaults = {
        "username": "%s_username" % random_string(5),
        "email": "%s_username@tempurl.com" % random_string(5),
    }
    defaults.update(**kwargs)
    return AbstractBaseUser.objects.create(**defaults)


def create_Group(**kwargs):
    defaults = {
        "name": "%s_group" % random_string(5),
    }
    defaults.update(**kwargs)
    return Group.objects.create(**defaults)


def create_ContentType(**kwargs):
    defaults = {
    }
    defaults.update(**kwargs)
    return ContentType.objects.create(**defaults)


def create_toolbreakapp624c_ToolsShopFloor(**kwargs):
    defaults = {}
    defaults["tool_num"] = ""
    defaults["serial_num"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.ToolsShopFloor.objects.create(**defaults)
def create_toolbreakapp624c_CompactIssue(**kwargs):
    defaults = {}
    defaults["rank"] = ""
    defaults["issues"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.CompactIssue.objects.create(**defaults)
def create_toolbreakapp624c_PartNumber(**kwargs):
    defaults = {}
    defaults["part_name"] = ""
    defaults["part_number"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.PartNumber.objects.create(**defaults)
def create_toolbreakapp624c_Tool(**kwargs):
    defaults = {}
    defaults["serial_num"] = ""
    defaults["cost"] = ""
    defaults["fix"] = ""
    defaults["tool_num"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.Tool.objects.create(**defaults)
def create_toolbreakapp624c_Supervisor(**kwargs):
    defaults = {}
    defaults["supervisor_email"] = ""
    defaults["supervisors"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.Supervisor.objects.create(**defaults)
def create_toolbreakapp624c_PressSelect(**kwargs):
    defaults = {}
    defaults["press_num"] = ""
    defaults["process"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.PressSelect.objects.create(**defaults)
def create_toolbreakapp624c_PressInfo(**kwargs):
    defaults = {}
    defaults["occurance"] = ""
    defaults["press_position"] = ""
    defaults["rig_num"] = ""
    defaults["tonnage"] = ""
    defaults["fault_msg"] = ""
    defaults["head_num"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.PressInfo.objects.create(**defaults)
def create_toolbreakapp624c_Deviation(**kwargs):
    defaults = {}
    defaults["attach_photo_of_rid"] = ""
    defaults["attempts_to_fix"] = ""
    defaults["reason_for_deviation"] = ""
    defaults["sign_off"] = ""
    defaults["attach_photo_of_cmm"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.Deviation.objects.create(**defaults)
def create_toolbreakapp624c_Engineering(**kwargs):
    defaults = {}
    defaults["engineer_analysis"] = ""
    defaults["prevent_recurrence"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.Engineering.objects.create(**defaults)
def create_toolbreakapp624c_ToolRoom(**kwargs):
    defaults = {}
    defaults["observations_breakdown"] = ""
    defaults["broken_part_pic_tr"] = ""
    if "tool" not in kwargs:
        defaults["tool"] = create_toolbreakapp624c_Tool()
    defaults.update(**kwargs)
    return toolbreakapp624c_models.ToolRoom.objects.create(**defaults)
def create_toolbreakapp624c_ToolBreakageReport(**kwargs):
    defaults = {}
    defaults["if_other_describe"] = ""
    defaults["countermeasure"] = ""
    defaults["sup_approval"] = ""
    defaults["break_dev_select"] = ""
    defaults["broken_part_pic"] = ""
    defaults["status"] = ""
    defaults["num_parts_before_breakage"] = ""
    defaults["employee_name"] = ""
    defaults["root_cause"] = ""
    defaults["report_date_time"] = datetime.now()
    if "part_number" not in kwargs:
        defaults["part_number"] = create_toolbreakapp624c_PartNumber()
    if "engineering" not in kwargs:
        defaults["engineering"] = create_toolbreakapp624c_Engineering()
    if "press_information" not in kwargs:
        defaults["press_information"] = create_toolbreakapp624c_PressInfo()
    if "compact_issue" not in kwargs:
        defaults["compact_issue"] = create_toolbreakapp624c_CompactIssue()
    if "broken_tools_shop_floor" not in kwargs:
        defaults["broken_tools_shop_floor"] = create_toolbreakapp624c_ToolsShopFloor()
    if "press_number" not in kwargs:
        defaults["press_number"] = create_toolbreakapp624c_PressSelect()
    if "toolroom" not in kwargs:
        defaults["toolroom"] = create_toolbreakapp624c_ToolRoom()
    if "coining_issue" not in kwargs:
        defaults["coining_issue"] = create_toolbreakapp624c_CoinIssue()
    defaults.update(**kwargs)
    return toolbreakapp624c_models.ToolBreakageReport.objects.create(**defaults)
def create_toolbreakapp624c_Help(**kwargs):
    defaults = {}
    defaults["help"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.Help.objects.create(**defaults)
def create_toolbreakapp624c_CoinIssue(**kwargs):
    defaults = {}
    defaults["issue"] = ""
    defaults["rank"] = ""
    defaults.update(**kwargs)
    return toolbreakapp624c_models.CoinIssue.objects.create(**defaults)
def create_blogappm2m_PostedFromTbl(**kwargs):
    defaults = {}
    defaults["name"] = ""
    defaults.update(**kwargs)
    return blogappm2m_models.PostedFromTbl.objects.create(**defaults)
def create_blogappm2m_TagTbl(**kwargs):
    defaults = {}
    defaults["name"] = ""
    defaults.update(**kwargs)
    return blogappm2m_models.TagTbl.objects.create(**defaults)
def create_blogappm2m_PostTbl(**kwargs):
    defaults = {}
    defaults["body"] = ""
    defaults["title"] = ""
    if "tags" not in kwargs:
        defaults["tags"] = create_blogappm2m_TagTbl()
    if "postedfrom" not in kwargs:
        defaults["postedfrom"] = create_blogappm2m_PostedFromTbl()
    defaults.update(**kwargs)
    return blogappm2m_models.PostTbl.objects.create(**defaults)
