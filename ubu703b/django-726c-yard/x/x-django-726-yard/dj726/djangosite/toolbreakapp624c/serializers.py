from rest_framework import serializers

from . import models


class ToolsShopFloorSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.ToolsShopFloor
        fields = [
            "created_at",
            "updated_at",
            "tool_num",
            "serial_num",
        ]

class CompactIssueSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.CompactIssue
        fields = [
            "updated_at",
            "rank",
            "issues",
            "created_at",
        ]

class PartNumberSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PartNumber
        fields = [
            "part_name",
            "part_number",
            "updated_at",
            "created_at",
        ]

class ToolSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Tool
        fields = [
            "updated_at",
            "serial_num",
            "cost",
            "fix",
            "tool_num",
            "created_at",
        ]

class SupervisorSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Supervisor
        fields = [
            "supervisor_email",
            "supervisors",
            "updated_at",
            "created_at",
        ]

class PressSelectSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PressSelect
        fields = [
            "created_at",
            "press_num",
            "process",
            "updated_at",
        ]

class PressInfoSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PressInfo
        fields = [
            "occurance",
            "updated_at",
            "press_position",
            "rig_num",
            "created_at",
            "tonnage",
            "fault_msg",
            "head_num",
        ]

class DeviationSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Deviation
        fields = [
            "created_at",
            "attach_photo_of_rid",
            "attempts_to_fix",
            "updated_at",
            "reason_for_deviation",
            "sign_off",
            "attach_photo_of_cmm",
        ]

class EngineeringSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Engineering
        fields = [
            "engineer_analysis",
            "created_at",
            "updated_at",
            "prevent_recurrence",
        ]

class ToolRoomSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.ToolRoom
        fields = [
            "updated_at",
            "observations_breakdown",
            "created_at",
            "broken_part_pic_tr",
            "tool",
        ]

class ToolBreakageReportSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.ToolBreakageReport
        fields = [
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
            "part_number",
            "engineering",
            "press_information",
            "compact_issue",
            "broken_tools_shop_floor",
            "press_number",
            "toolroom",
            "coining_issue",
        ]

class HelpSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Help
        fields = [
            "help",
            "created_at",
            "updated_at",
        ]

class CoinIssueSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.CoinIssue
        fields = [
            "updated_at",
            "created_at",
            "issue",
            "rank",
        ]
