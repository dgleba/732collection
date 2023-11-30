from django.views import generic
from django.urls import reverse_lazy
from . import models
from . import forms


class ToolsShopFloorListView(generic.ListView):
    model = models.ToolsShopFloor
    form_class = forms.ToolsShopFloorForm


class ToolsShopFloorCreateView(generic.CreateView):
    model = models.ToolsShopFloor
    form_class = forms.ToolsShopFloorForm


class ToolsShopFloorDetailView(generic.DetailView):
    model = models.ToolsShopFloor
    form_class = forms.ToolsShopFloorForm


class ToolsShopFloorUpdateView(generic.UpdateView):
    model = models.ToolsShopFloor
    form_class = forms.ToolsShopFloorForm
    pk_url_kwarg = "pk"


class ToolsShopFloorDeleteView(generic.DeleteView):
    model = models.ToolsShopFloor
    success_url = reverse_lazy("toolbreakapp624c_ToolsShopFloor_list")


class CompactIssueListView(generic.ListView):
    model = models.CompactIssue
    form_class = forms.CompactIssueForm


class CompactIssueCreateView(generic.CreateView):
    model = models.CompactIssue
    form_class = forms.CompactIssueForm


class CompactIssueDetailView(generic.DetailView):
    model = models.CompactIssue
    form_class = forms.CompactIssueForm


class CompactIssueUpdateView(generic.UpdateView):
    model = models.CompactIssue
    form_class = forms.CompactIssueForm
    pk_url_kwarg = "pk"


class CompactIssueDeleteView(generic.DeleteView):
    model = models.CompactIssue
    success_url = reverse_lazy("toolbreakapp624c_CompactIssue_list")


class PartNumberListView(generic.ListView):
    model = models.PartNumber
    form_class = forms.PartNumberForm


class PartNumberCreateView(generic.CreateView):
    model = models.PartNumber
    form_class = forms.PartNumberForm


class PartNumberDetailView(generic.DetailView):
    model = models.PartNumber
    form_class = forms.PartNumberForm


class PartNumberUpdateView(generic.UpdateView):
    model = models.PartNumber
    form_class = forms.PartNumberForm
    pk_url_kwarg = "pk"


class PartNumberDeleteView(generic.DeleteView):
    model = models.PartNumber
    success_url = reverse_lazy("toolbreakapp624c_PartNumber_list")


class ToolListView(generic.ListView):
    model = models.Tool
    form_class = forms.ToolForm


class ToolCreateView(generic.CreateView):
    model = models.Tool
    form_class = forms.ToolForm


class ToolDetailView(generic.DetailView):
    model = models.Tool
    form_class = forms.ToolForm


class ToolUpdateView(generic.UpdateView):
    model = models.Tool
    form_class = forms.ToolForm
    pk_url_kwarg = "pk"


class ToolDeleteView(generic.DeleteView):
    model = models.Tool
    success_url = reverse_lazy("toolbreakapp624c_Tool_list")


class SupervisorListView(generic.ListView):
    model = models.Supervisor
    form_class = forms.SupervisorForm


class SupervisorCreateView(generic.CreateView):
    model = models.Supervisor
    form_class = forms.SupervisorForm


class SupervisorDetailView(generic.DetailView):
    model = models.Supervisor
    form_class = forms.SupervisorForm


class SupervisorUpdateView(generic.UpdateView):
    model = models.Supervisor
    form_class = forms.SupervisorForm
    pk_url_kwarg = "pk"


class SupervisorDeleteView(generic.DeleteView):
    model = models.Supervisor
    success_url = reverse_lazy("toolbreakapp624c_Supervisor_list")


class PressSelectListView(generic.ListView):
    model = models.PressSelect
    form_class = forms.PressSelectForm


class PressSelectCreateView(generic.CreateView):
    model = models.PressSelect
    form_class = forms.PressSelectForm


class PressSelectDetailView(generic.DetailView):
    model = models.PressSelect
    form_class = forms.PressSelectForm


class PressSelectUpdateView(generic.UpdateView):
    model = models.PressSelect
    form_class = forms.PressSelectForm
    pk_url_kwarg = "pk"


class PressSelectDeleteView(generic.DeleteView):
    model = models.PressSelect
    success_url = reverse_lazy("toolbreakapp624c_PressSelect_list")


class PressInfoListView(generic.ListView):
    model = models.PressInfo
    form_class = forms.PressInfoForm


class PressInfoCreateView(generic.CreateView):
    model = models.PressInfo
    form_class = forms.PressInfoForm


class PressInfoDetailView(generic.DetailView):
    model = models.PressInfo
    form_class = forms.PressInfoForm


class PressInfoUpdateView(generic.UpdateView):
    model = models.PressInfo
    form_class = forms.PressInfoForm
    pk_url_kwarg = "pk"


class PressInfoDeleteView(generic.DeleteView):
    model = models.PressInfo
    success_url = reverse_lazy("toolbreakapp624c_PressInfo_list")


class DeviationListView(generic.ListView):
    model = models.Deviation
    form_class = forms.DeviationForm


class DeviationCreateView(generic.CreateView):
    model = models.Deviation
    form_class = forms.DeviationForm


class DeviationDetailView(generic.DetailView):
    model = models.Deviation
    form_class = forms.DeviationForm


class DeviationUpdateView(generic.UpdateView):
    model = models.Deviation
    form_class = forms.DeviationForm
    pk_url_kwarg = "pk"


class DeviationDeleteView(generic.DeleteView):
    model = models.Deviation
    success_url = reverse_lazy("toolbreakapp624c_Deviation_list")


class EngineeringListView(generic.ListView):
    model = models.Engineering
    form_class = forms.EngineeringForm


class EngineeringCreateView(generic.CreateView):
    model = models.Engineering
    form_class = forms.EngineeringForm


class EngineeringDetailView(generic.DetailView):
    model = models.Engineering
    form_class = forms.EngineeringForm


class EngineeringUpdateView(generic.UpdateView):
    model = models.Engineering
    form_class = forms.EngineeringForm
    pk_url_kwarg = "pk"


class EngineeringDeleteView(generic.DeleteView):
    model = models.Engineering
    success_url = reverse_lazy("toolbreakapp624c_Engineering_list")


class ToolRoomListView(generic.ListView):
    model = models.ToolRoom
    form_class = forms.ToolRoomForm


class ToolRoomCreateView(generic.CreateView):
    model = models.ToolRoom
    form_class = forms.ToolRoomForm


class ToolRoomDetailView(generic.DetailView):
    model = models.ToolRoom
    form_class = forms.ToolRoomForm


class ToolRoomUpdateView(generic.UpdateView):
    model = models.ToolRoom
    form_class = forms.ToolRoomForm
    pk_url_kwarg = "pk"


class ToolRoomDeleteView(generic.DeleteView):
    model = models.ToolRoom
    success_url = reverse_lazy("toolbreakapp624c_ToolRoom_list")


class ToolBreakageReportListView(generic.ListView):
    model = models.ToolBreakageReport
    form_class = forms.ToolBreakageReportForm


class ToolBreakageReportCreateView(generic.CreateView):
    model = models.ToolBreakageReport
    form_class = forms.ToolBreakageReportForm


class ToolBreakageReportDetailView(generic.DetailView):
    model = models.ToolBreakageReport
    form_class = forms.ToolBreakageReportForm


class ToolBreakageReportUpdateView(generic.UpdateView):
    model = models.ToolBreakageReport
    form_class = forms.ToolBreakageReportForm
    pk_url_kwarg = "pk"


class ToolBreakageReportDeleteView(generic.DeleteView):
    model = models.ToolBreakageReport
    success_url = reverse_lazy("toolbreakapp624c_ToolBreakageReport_list")


class HelpListView(generic.ListView):
    model = models.Help
    form_class = forms.HelpForm


class HelpCreateView(generic.CreateView):
    model = models.Help
    form_class = forms.HelpForm


class HelpDetailView(generic.DetailView):
    model = models.Help
    form_class = forms.HelpForm


class HelpUpdateView(generic.UpdateView):
    model = models.Help
    form_class = forms.HelpForm
    pk_url_kwarg = "pk"


class HelpDeleteView(generic.DeleteView):
    model = models.Help
    success_url = reverse_lazy("toolbreakapp624c_Help_list")


class CoinIssueListView(generic.ListView):
    model = models.CoinIssue
    form_class = forms.CoinIssueForm


class CoinIssueCreateView(generic.CreateView):
    model = models.CoinIssue
    form_class = forms.CoinIssueForm


class CoinIssueDetailView(generic.DetailView):
    model = models.CoinIssue
    form_class = forms.CoinIssueForm


class CoinIssueUpdateView(generic.UpdateView):
    model = models.CoinIssue
    form_class = forms.CoinIssueForm
    pk_url_kwarg = "pk"


class CoinIssueDeleteView(generic.DeleteView):
    model = models.CoinIssue
    success_url = reverse_lazy("toolbreakapp624c_CoinIssue_list")
