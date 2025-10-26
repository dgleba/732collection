from django import forms
from toolbreakapp624c.models import Tool
from toolbreakapp624c.models import PartNumber
from toolbreakapp624c.models import Engineering
from toolbreakapp624c.models import PressInfo
from toolbreakapp624c.models import CompactIssue
from toolbreakapp624c.models import ToolsShopFloor
from toolbreakapp624c.models import PressSelect
from toolbreakapp624c.models import ToolRoom
from toolbreakapp624c.models import CoinIssue
from . import models


class ToolsShopFloorForm(forms.ModelForm):
    class Meta:
        model = models.ToolsShopFloor
        fields = [
            "tool_num",
            "serial_num",
        ]


class CompactIssueForm(forms.ModelForm):
    class Meta:
        model = models.CompactIssue
        fields = [
            "rank",
            "issues",
        ]


class PartNumberForm(forms.ModelForm):
    class Meta:
        model = models.PartNumber
        fields = [
            "part_name",
            "part_number",
        ]


class ToolForm(forms.ModelForm):
    class Meta:
        model = models.Tool
        fields = [
            "serial_num",
            "cost",
            "fix",
            "tool_num",
        ]


class SupervisorForm(forms.ModelForm):
    class Meta:
        model = models.Supervisor
        fields = [
            "supervisor_email",
            "supervisors",
        ]


class PressSelectForm(forms.ModelForm):
    class Meta:
        model = models.PressSelect
        fields = [
            "press_num",
            "process",
        ]


class PressInfoForm(forms.ModelForm):
    class Meta:
        model = models.PressInfo
        fields = [
            "occurance",
            "press_position",
            "rig_num",
            "tonnage",
            "fault_msg",
            "head_num",
        ]


class DeviationForm(forms.ModelForm):
    class Meta:
        model = models.Deviation
        fields = [
            "attach_photo_of_rid",
            "attempts_to_fix",
            "reason_for_deviation",
            "sign_off",
            "attach_photo_of_cmm",
        ]


class EngineeringForm(forms.ModelForm):
    class Meta:
        model = models.Engineering
        fields = [
            "engineer_analysis",
            "prevent_recurrence",
        ]


class ToolRoomForm(forms.ModelForm):
    class Meta:
        model = models.ToolRoom
        fields = [
            "observations_breakdown",
            "broken_part_pic_tr",
            "tool",
        ]

    def __init__(self, *args, **kwargs):
        super(ToolRoomForm, self).__init__(*args, **kwargs)
        self.fields["tool"].queryset = Tool.objects.all()



class ToolBreakageReportForm(forms.ModelForm):
    class Meta:
        model = models.ToolBreakageReport
        fields = [
            "if_other_describe",
            "countermeasure",
            "sup_approval",
            "break_dev_select",
            "broken_part_pic",
            "status",
            "num_parts_before_breakage",
            "employee_name",
            "root_cause",
            "report_date_time",
            "part_number",
            "engineering",
            "press_information",
            "compact_issue",
            "broken_tools_shop_floor",
            "press_number",
            "toolroom",
            "coining_issue",
        ]

    def __init__(self, *args, **kwargs):
        super(ToolBreakageReportForm, self).__init__(*args, **kwargs)
        self.fields["part_number"].queryset = PartNumber.objects.all()
        self.fields["engineering"].queryset = Engineering.objects.all()
        self.fields["press_information"].queryset = PressInfo.objects.all()
        self.fields["compact_issue"].queryset = CompactIssue.objects.all()
        self.fields["broken_tools_shop_floor"].queryset = ToolsShopFloor.objects.all()
        self.fields["press_number"].queryset = PressSelect.objects.all()
        self.fields["toolroom"].queryset = ToolRoom.objects.all()
        self.fields["coining_issue"].queryset = CoinIssue.objects.all()



class HelpForm(forms.ModelForm):
    class Meta:
        model = models.Help
        fields = [
            "help",
        ]


class CoinIssueForm(forms.ModelForm):
    class Meta:
        model = models.CoinIssue
        fields = [
            "issue",
            "rank",
        ]
