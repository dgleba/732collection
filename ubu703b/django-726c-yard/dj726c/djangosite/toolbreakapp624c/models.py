from django.db import models
from django.urls import reverse


class ToolsShopFloor(models.Model):

    # Fields
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    tool_num = models.CharField(max_length=500)
    serial_num = models.CharField(max_length=500)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_ToolsShopFloor_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_ToolsShopFloor_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_ToolsShopFloor_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_ToolsShopFloor_htmx_delete", args=(self.pk,))


class CompactIssue(models.Model):

    # Fields
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    rank = models.IntegerField(max_length=500)
    issues = models.CharField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_CompactIssue_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_CompactIssue_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_CompactIssue_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_CompactIssue_htmx_delete", args=(self.pk,))


class PartNumber(models.Model):

    # Fields
    part_name = models.CharField(max_length=500)
    part_number = models.CharField(max_length=500)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_PartNumber_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_PartNumber_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_PartNumber_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_PartNumber_htmx_delete", args=(self.pk,))


class Tool(models.Model):

    # Fields
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    serial_num = models.CharField(max_length=500)
    cost = models.DecimalField(decimal_places=2, max_digits=10)
    fix = models.CharField(max_length=500)
    tool_num = models.CharField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_Tool_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_Tool_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_Tool_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_Tool_htmx_delete", args=(self.pk,))


class Supervisor(models.Model):

    # Fields
    supervisor_email = models.CharField(max_length=500)
    supervisors = models.CharField(max_length=500)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_Supervisor_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_Supervisor_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_Supervisor_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_Supervisor_htmx_delete", args=(self.pk,))


class PressSelect(models.Model):

    # Fields
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    press_num = models.BigIntegerField()
    process = models.CharField(max_length=500)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_PressSelect_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_PressSelect_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_PressSelect_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_PressSelect_htmx_delete", args=(self.pk,))


class PressInfo(models.Model):

    # Fields
    occurance = models.CharField(max_length=500)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    press_position = models.CharField(max_length=500)
    rig_num = models.CharField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    tonnage = models.CharField(max_length=500)
    fault_msg = models.CharField(max_length=500)
    head_num = models.CharField(max_length=500)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_PressInfo_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_PressInfo_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_PressInfo_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_PressInfo_htmx_delete", args=(self.pk,))


class Deviation(models.Model):

    # Fields
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    attach_photo_of_rid = models.ImageField(upload_to="upload/images/")
    attempts_to_fix = models.TextField(max_length=500)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    reason_for_deviation = models.TextField(max_length=500)
    sign_off = models.CharField(max_length=500)
    attach_photo_of_cmm = models.ImageField(upload_to="upload/images/")

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_Deviation_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_Deviation_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_Deviation_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_Deviation_htmx_delete", args=(self.pk,))


class Engineering(models.Model):

    # Fields
    engineer_analysis = models.TextField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    prevent_recurrence = models.TextField(max_length=500)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_Engineering_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_Engineering_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_Engineering_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_Engineering_htmx_delete", args=(self.pk,))


class ToolRoom(models.Model):

    # Relationships
    tool = models.ForeignKey("toolbreakapp624c.Tool", on_delete=models.CASCADE)

    # Fields
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    observations_breakdown = models.TextField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    broken_part_pic_tr = models.ImageField(upload_to="upload/images/")

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_ToolRoom_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_ToolRoom_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_ToolRoom_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_ToolRoom_htmx_delete", args=(self.pk,))


class ToolBreakageReport(models.Model):

    # Relationships
    part_number = models.ManyToManyField("toolbreakapp624c.PartNumber")
    engineering = models.ForeignKey("toolbreakapp624c.Engineering", on_delete=models.CASCADE)
    press_information = models.ForeignKey("toolbreakapp624c.PressInfo", on_delete=models.CASCADE)
    compact_issue = models.ManyToManyField("toolbreakapp624c.CompactIssue")
    broken_tools_shop_floor = models.ForeignKey("toolbreakapp624c.ToolsShopFloor", on_delete=models.CASCADE)
    press_number = models.ForeignKey("toolbreakapp624c.PressSelect", on_delete=models.CASCADE)
    toolroom = models.ForeignKey("toolbreakapp624c.ToolRoom", on_delete=models.CASCADE)
    coining_issue = models.ManyToManyField("toolbreakapp624c.CoinIssue")

    # Fields
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    if_other_describe = models.TextField(max_length=500)
    countermeasure = models.TextField(max_length=500)
    sup_approval = models.CharField(max_length=500)
    break_dev_select = models.CharField(max_length=500)
    broken_part_pic = models.ImageField(upload_to="upload/images/")
    status = models.CharField(max_length=500)
    num_parts_before_breakage = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    employee_name = models.CharField(max_length=500)
    root_cause = models.TextField(max_length=500)
    report_date_time = models.DateTimeField()

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_ToolBreakageReport_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_ToolBreakageReport_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_ToolBreakageReport_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_ToolBreakageReport_htmx_delete", args=(self.pk,))


class Help(models.Model):

    # Fields
    help = models.CharField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_Help_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_Help_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_Help_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_Help_htmx_delete", args=(self.pk,))


class CoinIssue(models.Model):

    # Fields
    updated_at = models.DateTimeField(auto_now_add=True, editable=False)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    issue = models.CharField(max_length=100)
    rank = models.IntegerField(max_length=100)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("toolbreakapp624c_CoinIssue_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("toolbreakapp624c_CoinIssue_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("toolbreakapp624c_CoinIssue_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("toolbreakapp624c_CoinIssue_htmx_delete", args=(self.pk,))
