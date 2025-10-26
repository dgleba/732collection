from django.contrib import admin
from django import forms

from . import models


class ToolsShopFloorAdminForm(forms.ModelForm):

    class Meta:
        model = models.ToolsShopFloor
        fields = "__all__"


class ToolsShopFloorAdmin(admin.ModelAdmin):
    form = ToolsShopFloorAdminForm
    list_display = [
        "created_at",
        "updated_at",
        "tool_num",
        "serial_num",
    ]
    readonly_fields = [
        "created_at",
        "updated_at",
        "tool_num",
        "serial_num",
    ]


class CompactIssueAdminForm(forms.ModelForm):

    class Meta:
        model = models.CompactIssue
        fields = "__all__"


class CompactIssueAdmin(admin.ModelAdmin):
    form = CompactIssueAdminForm
    list_display = [
        "updated_at",
        "rank",
        "issues",
        "created_at",
    ]
    readonly_fields = [
        "updated_at",
        "rank",
        "issues",
        "created_at",
    ]


class PartNumberAdminForm(forms.ModelForm):

    class Meta:
        model = models.PartNumber
        fields = "__all__"


class PartNumberAdmin(admin.ModelAdmin):
    form = PartNumberAdminForm
    list_display = [
        "part_name",
        "part_number",
        "updated_at",
        "created_at",
    ]
    readonly_fields = [
        "part_name",
        "part_number",
        "updated_at",
        "created_at",
    ]


class ToolAdminForm(forms.ModelForm):

    class Meta:
        model = models.Tool
        fields = "__all__"


class ToolAdmin(admin.ModelAdmin):
    form = ToolAdminForm
    list_display = [
        "updated_at",
        "serial_num",
        "cost",
        "fix",
        "tool_num",
        "created_at",
    ]
    readonly_fields = [
        "updated_at",
        "serial_num",
        "cost",
        "fix",
        "tool_num",
        "created_at",
    ]


class SupervisorAdminForm(forms.ModelForm):

    class Meta:
        model = models.Supervisor
        fields = "__all__"


class SupervisorAdmin(admin.ModelAdmin):
    form = SupervisorAdminForm
    list_display = [
        "supervisor_email",
        "supervisors",
        "updated_at",
        "created_at",
    ]
    readonly_fields = [
        "supervisor_email",
        "supervisors",
        "updated_at",
        "created_at",
    ]


class PressSelectAdminForm(forms.ModelForm):

    class Meta:
        model = models.PressSelect
        fields = "__all__"


class PressSelectAdmin(admin.ModelAdmin):
    form = PressSelectAdminForm
    list_display = [
        "created_at",
        "press_num",
        "process",
        "updated_at",
    ]
    readonly_fields = [
        "created_at",
        "press_num",
        "process",
        "updated_at",
    ]


class PressInfoAdminForm(forms.ModelForm):

    class Meta:
        model = models.PressInfo
        fields = "__all__"


class PressInfoAdmin(admin.ModelAdmin):
    form = PressInfoAdminForm
    list_display = [
        "occurance",
        "updated_at",
        "press_position",
        "rig_num",
        "created_at",
        "tonnage",
        "fault_msg",
        "head_num",
    ]
    readonly_fields = [
        "occurance",
        "updated_at",
        "press_position",
        "rig_num",
        "created_at",
        "tonnage",
        "fault_msg",
        "head_num",
    ]


class DeviationAdminForm(forms.ModelForm):

    class Meta:
        model = models.Deviation
        fields = "__all__"


class DeviationAdmin(admin.ModelAdmin):
    form = DeviationAdminForm
    list_display = [
        "created_at",
        "attach_photo_of_rid",
        "attempts_to_fix",
        "updated_at",
        "reason_for_deviation",
        "sign_off",
        "attach_photo_of_cmm",
    ]
    readonly_fields = [
        "created_at",
        "attach_photo_of_rid",
        "attempts_to_fix",
        "updated_at",
        "reason_for_deviation",
        "sign_off",
        "attach_photo_of_cmm",
    ]


class EngineeringAdminForm(forms.ModelForm):

    class Meta:
        model = models.Engineering
        fields = "__all__"


class EngineeringAdmin(admin.ModelAdmin):
    form = EngineeringAdminForm
    list_display = [
        "engineer_analysis",
        "created_at",
        "updated_at",
        "prevent_recurrence",
    ]
    readonly_fields = [
        "engineer_analysis",
        "created_at",
        "updated_at",
        "prevent_recurrence",
    ]


class ToolRoomAdminForm(forms.ModelForm):

    class Meta:
        model = models.ToolRoom
        fields = "__all__"


class ToolRoomAdmin(admin.ModelAdmin):
    form = ToolRoomAdminForm
    list_display = [
        "updated_at",
        "observations_breakdown",
        "created_at",
        "broken_part_pic_tr",
    ]
    readonly_fields = [
        "updated_at",
        "observations_breakdown",
        "created_at",
        "broken_part_pic_tr",
    ]


class ToolBreakageReportAdminForm(forms.ModelForm):

    class Meta:
        model = models.ToolBreakageReport
        fields = "__all__"


class ToolBreakageReportAdmin(admin.ModelAdmin):
    form = ToolBreakageReportAdminForm
    list_display = [
        "updated_at",
        "if_other_describe",
        "countermeasure",
        "sup_approval",
        "break_dev_select",
        "broken_part_pic",
        "status",
        "num_parts_before_breakage",
        "created_at",
        "employee_name",
        "root_cause",
        "report_date_time",
    ]
    readonly_fields = [
        "updated_at",
        "if_other_describe",
        "countermeasure",
        "sup_approval",
        "break_dev_select",
        "broken_part_pic",
        "status",
        "num_parts_before_breakage",
        "created_at",
        "employee_name",
        "root_cause",
        "report_date_time",
    ]


class HelpAdminForm(forms.ModelForm):

    class Meta:
        model = models.Help
        fields = "__all__"


class HelpAdmin(admin.ModelAdmin):
    form = HelpAdminForm
    list_display = [
        "help",
        "created_at",
        "updated_at",
    ]
    readonly_fields = [
        "help",
        "created_at",
        "updated_at",
    ]


class CoinIssueAdminForm(forms.ModelForm):

    class Meta:
        model = models.CoinIssue
        fields = "__all__"


class CoinIssueAdmin(admin.ModelAdmin):
    form = CoinIssueAdminForm
    list_display = [
        "updated_at",
        "created_at",
        "issue",
        "rank",
    ]
    readonly_fields = [
        "updated_at",
        "created_at",
        "issue",
        "rank",
    ]


admin.site.register(models.ToolsShopFloor, ToolsShopFloorAdmin)
admin.site.register(models.CompactIssue, CompactIssueAdmin)
admin.site.register(models.PartNumber, PartNumberAdmin)
admin.site.register(models.Tool, ToolAdmin)
admin.site.register(models.Supervisor, SupervisorAdmin)
admin.site.register(models.PressSelect, PressSelectAdmin)
admin.site.register(models.PressInfo, PressInfoAdmin)
admin.site.register(models.Deviation, DeviationAdmin)
admin.site.register(models.Engineering, EngineeringAdmin)
admin.site.register(models.ToolRoom, ToolRoomAdmin)
admin.site.register(models.ToolBreakageReport, ToolBreakageReportAdmin)
admin.site.register(models.Help, HelpAdmin)
admin.site.register(models.CoinIssue, CoinIssueAdmin)
