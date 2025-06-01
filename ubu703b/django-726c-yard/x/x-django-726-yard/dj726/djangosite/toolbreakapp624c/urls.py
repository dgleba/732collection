from django.urls import path, include
from rest_framework import routers

from . import api
from . import views
from . import htmx


router = routers.DefaultRouter()
router.register("ToolsShopFloor", api.ToolsShopFloorViewSet)
router.register("CompactIssue", api.CompactIssueViewSet)
router.register("PartNumber", api.PartNumberViewSet)
router.register("Tool", api.ToolViewSet)
router.register("Supervisor", api.SupervisorViewSet)
router.register("PressSelect", api.PressSelectViewSet)
router.register("PressInfo", api.PressInfoViewSet)
router.register("Deviation", api.DeviationViewSet)
router.register("Engineering", api.EngineeringViewSet)
router.register("ToolRoom", api.ToolRoomViewSet)
router.register("ToolBreakageReport", api.ToolBreakageReportViewSet)
router.register("Help", api.HelpViewSet)
router.register("CoinIssue", api.CoinIssueViewSet)

urlpatterns = (
    path("api/v1/", include(router.urls)),
    path("toolbreakapp624c/ToolsShopFloor/", views.ToolsShopFloorListView.as_view(), name="toolbreakapp624c_ToolsShopFloor_list"),
    path("toolbreakapp624c/ToolsShopFloor/create/", views.ToolsShopFloorCreateView.as_view(), name="toolbreakapp624c_ToolsShopFloor_create"),
    path("toolbreakapp624c/ToolsShopFloor/detail/<int:pk>/", views.ToolsShopFloorDetailView.as_view(), name="toolbreakapp624c_ToolsShopFloor_detail"),
    path("toolbreakapp624c/ToolsShopFloor/update/<int:pk>/", views.ToolsShopFloorUpdateView.as_view(), name="toolbreakapp624c_ToolsShopFloor_update"),
    path("toolbreakapp624c/ToolsShopFloor/delete/<int:pk>/", views.ToolsShopFloorDeleteView.as_view(), name="toolbreakapp624c_ToolsShopFloor_delete"),
    path("toolbreakapp624c/CompactIssue/", views.CompactIssueListView.as_view(), name="toolbreakapp624c_CompactIssue_list"),
    path("toolbreakapp624c/CompactIssue/create/", views.CompactIssueCreateView.as_view(), name="toolbreakapp624c_CompactIssue_create"),
    path("toolbreakapp624c/CompactIssue/detail/<int:pk>/", views.CompactIssueDetailView.as_view(), name="toolbreakapp624c_CompactIssue_detail"),
    path("toolbreakapp624c/CompactIssue/update/<int:pk>/", views.CompactIssueUpdateView.as_view(), name="toolbreakapp624c_CompactIssue_update"),
    path("toolbreakapp624c/CompactIssue/delete/<int:pk>/", views.CompactIssueDeleteView.as_view(), name="toolbreakapp624c_CompactIssue_delete"),
    path("toolbreakapp624c/PartNumber/", views.PartNumberListView.as_view(), name="toolbreakapp624c_PartNumber_list"),
    path("toolbreakapp624c/PartNumber/create/", views.PartNumberCreateView.as_view(), name="toolbreakapp624c_PartNumber_create"),
    path("toolbreakapp624c/PartNumber/detail/<int:pk>/", views.PartNumberDetailView.as_view(), name="toolbreakapp624c_PartNumber_detail"),
    path("toolbreakapp624c/PartNumber/update/<int:pk>/", views.PartNumberUpdateView.as_view(), name="toolbreakapp624c_PartNumber_update"),
    path("toolbreakapp624c/PartNumber/delete/<int:pk>/", views.PartNumberDeleteView.as_view(), name="toolbreakapp624c_PartNumber_delete"),
    path("toolbreakapp624c/Tool/", views.ToolListView.as_view(), name="toolbreakapp624c_Tool_list"),
    path("toolbreakapp624c/Tool/create/", views.ToolCreateView.as_view(), name="toolbreakapp624c_Tool_create"),
    path("toolbreakapp624c/Tool/detail/<int:pk>/", views.ToolDetailView.as_view(), name="toolbreakapp624c_Tool_detail"),
    path("toolbreakapp624c/Tool/update/<int:pk>/", views.ToolUpdateView.as_view(), name="toolbreakapp624c_Tool_update"),
    path("toolbreakapp624c/Tool/delete/<int:pk>/", views.ToolDeleteView.as_view(), name="toolbreakapp624c_Tool_delete"),
    path("toolbreakapp624c/Supervisor/", views.SupervisorListView.as_view(), name="toolbreakapp624c_Supervisor_list"),
    path("toolbreakapp624c/Supervisor/create/", views.SupervisorCreateView.as_view(), name="toolbreakapp624c_Supervisor_create"),
    path("toolbreakapp624c/Supervisor/detail/<int:pk>/", views.SupervisorDetailView.as_view(), name="toolbreakapp624c_Supervisor_detail"),
    path("toolbreakapp624c/Supervisor/update/<int:pk>/", views.SupervisorUpdateView.as_view(), name="toolbreakapp624c_Supervisor_update"),
    path("toolbreakapp624c/Supervisor/delete/<int:pk>/", views.SupervisorDeleteView.as_view(), name="toolbreakapp624c_Supervisor_delete"),
    path("toolbreakapp624c/PressSelect/", views.PressSelectListView.as_view(), name="toolbreakapp624c_PressSelect_list"),
    path("toolbreakapp624c/PressSelect/create/", views.PressSelectCreateView.as_view(), name="toolbreakapp624c_PressSelect_create"),
    path("toolbreakapp624c/PressSelect/detail/<int:pk>/", views.PressSelectDetailView.as_view(), name="toolbreakapp624c_PressSelect_detail"),
    path("toolbreakapp624c/PressSelect/update/<int:pk>/", views.PressSelectUpdateView.as_view(), name="toolbreakapp624c_PressSelect_update"),
    path("toolbreakapp624c/PressSelect/delete/<int:pk>/", views.PressSelectDeleteView.as_view(), name="toolbreakapp624c_PressSelect_delete"),
    path("toolbreakapp624c/PressInfo/", views.PressInfoListView.as_view(), name="toolbreakapp624c_PressInfo_list"),
    path("toolbreakapp624c/PressInfo/create/", views.PressInfoCreateView.as_view(), name="toolbreakapp624c_PressInfo_create"),
    path("toolbreakapp624c/PressInfo/detail/<int:pk>/", views.PressInfoDetailView.as_view(), name="toolbreakapp624c_PressInfo_detail"),
    path("toolbreakapp624c/PressInfo/update/<int:pk>/", views.PressInfoUpdateView.as_view(), name="toolbreakapp624c_PressInfo_update"),
    path("toolbreakapp624c/PressInfo/delete/<int:pk>/", views.PressInfoDeleteView.as_view(), name="toolbreakapp624c_PressInfo_delete"),
    path("toolbreakapp624c/Deviation/", views.DeviationListView.as_view(), name="toolbreakapp624c_Deviation_list"),
    path("toolbreakapp624c/Deviation/create/", views.DeviationCreateView.as_view(), name="toolbreakapp624c_Deviation_create"),
    path("toolbreakapp624c/Deviation/detail/<int:pk>/", views.DeviationDetailView.as_view(), name="toolbreakapp624c_Deviation_detail"),
    path("toolbreakapp624c/Deviation/update/<int:pk>/", views.DeviationUpdateView.as_view(), name="toolbreakapp624c_Deviation_update"),
    path("toolbreakapp624c/Deviation/delete/<int:pk>/", views.DeviationDeleteView.as_view(), name="toolbreakapp624c_Deviation_delete"),
    path("toolbreakapp624c/Engineering/", views.EngineeringListView.as_view(), name="toolbreakapp624c_Engineering_list"),
    path("toolbreakapp624c/Engineering/create/", views.EngineeringCreateView.as_view(), name="toolbreakapp624c_Engineering_create"),
    path("toolbreakapp624c/Engineering/detail/<int:pk>/", views.EngineeringDetailView.as_view(), name="toolbreakapp624c_Engineering_detail"),
    path("toolbreakapp624c/Engineering/update/<int:pk>/", views.EngineeringUpdateView.as_view(), name="toolbreakapp624c_Engineering_update"),
    path("toolbreakapp624c/Engineering/delete/<int:pk>/", views.EngineeringDeleteView.as_view(), name="toolbreakapp624c_Engineering_delete"),
    path("toolbreakapp624c/ToolRoom/", views.ToolRoomListView.as_view(), name="toolbreakapp624c_ToolRoom_list"),
    path("toolbreakapp624c/ToolRoom/create/", views.ToolRoomCreateView.as_view(), name="toolbreakapp624c_ToolRoom_create"),
    path("toolbreakapp624c/ToolRoom/detail/<int:pk>/", views.ToolRoomDetailView.as_view(), name="toolbreakapp624c_ToolRoom_detail"),
    path("toolbreakapp624c/ToolRoom/update/<int:pk>/", views.ToolRoomUpdateView.as_view(), name="toolbreakapp624c_ToolRoom_update"),
    path("toolbreakapp624c/ToolRoom/delete/<int:pk>/", views.ToolRoomDeleteView.as_view(), name="toolbreakapp624c_ToolRoom_delete"),
    path("toolbreakapp624c/ToolBreakageReport/", views.ToolBreakageReportListView.as_view(), name="toolbreakapp624c_ToolBreakageReport_list"),
    path("toolbreakapp624c/ToolBreakageReport/create/", views.ToolBreakageReportCreateView.as_view(), name="toolbreakapp624c_ToolBreakageReport_create"),
    path("toolbreakapp624c/ToolBreakageReport/detail/<int:pk>/", views.ToolBreakageReportDetailView.as_view(), name="toolbreakapp624c_ToolBreakageReport_detail"),
    path("toolbreakapp624c/ToolBreakageReport/update/<int:pk>/", views.ToolBreakageReportUpdateView.as_view(), name="toolbreakapp624c_ToolBreakageReport_update"),
    path("toolbreakapp624c/ToolBreakageReport/delete/<int:pk>/", views.ToolBreakageReportDeleteView.as_view(), name="toolbreakapp624c_ToolBreakageReport_delete"),
    path("toolbreakapp624c/Help/", views.HelpListView.as_view(), name="toolbreakapp624c_Help_list"),
    path("toolbreakapp624c/Help/create/", views.HelpCreateView.as_view(), name="toolbreakapp624c_Help_create"),
    path("toolbreakapp624c/Help/detail/<int:pk>/", views.HelpDetailView.as_view(), name="toolbreakapp624c_Help_detail"),
    path("toolbreakapp624c/Help/update/<int:pk>/", views.HelpUpdateView.as_view(), name="toolbreakapp624c_Help_update"),
    path("toolbreakapp624c/Help/delete/<int:pk>/", views.HelpDeleteView.as_view(), name="toolbreakapp624c_Help_delete"),
    path("toolbreakapp624c/CoinIssue/", views.CoinIssueListView.as_view(), name="toolbreakapp624c_CoinIssue_list"),
    path("toolbreakapp624c/CoinIssue/create/", views.CoinIssueCreateView.as_view(), name="toolbreakapp624c_CoinIssue_create"),
    path("toolbreakapp624c/CoinIssue/detail/<int:pk>/", views.CoinIssueDetailView.as_view(), name="toolbreakapp624c_CoinIssue_detail"),
    path("toolbreakapp624c/CoinIssue/update/<int:pk>/", views.CoinIssueUpdateView.as_view(), name="toolbreakapp624c_CoinIssue_update"),
    path("toolbreakapp624c/CoinIssue/delete/<int:pk>/", views.CoinIssueDeleteView.as_view(), name="toolbreakapp624c_CoinIssue_delete"),

    path("toolbreakapp624c/htmx/ToolsShopFloor/", htmx.HTMXToolsShopFloorListView.as_view(), name="toolbreakapp624c_ToolsShopFloor_htmx_list"),
    path("toolbreakapp624c/htmx/ToolsShopFloor/create/", htmx.HTMXToolsShopFloorCreateView.as_view(), name="toolbreakapp624c_ToolsShopFloor_htmx_create"),
    path("toolbreakapp624c/htmx/ToolsShopFloor/delete/<int:pk>/", htmx.HTMXToolsShopFloorDeleteView.as_view(), name="toolbreakapp624c_ToolsShopFloor_htmx_delete"),
    path("toolbreakapp624c/htmx/CompactIssue/", htmx.HTMXCompactIssueListView.as_view(), name="toolbreakapp624c_CompactIssue_htmx_list"),
    path("toolbreakapp624c/htmx/CompactIssue/create/", htmx.HTMXCompactIssueCreateView.as_view(), name="toolbreakapp624c_CompactIssue_htmx_create"),
    path("toolbreakapp624c/htmx/CompactIssue/delete/<int:pk>/", htmx.HTMXCompactIssueDeleteView.as_view(), name="toolbreakapp624c_CompactIssue_htmx_delete"),
    path("toolbreakapp624c/htmx/PartNumber/", htmx.HTMXPartNumberListView.as_view(), name="toolbreakapp624c_PartNumber_htmx_list"),
    path("toolbreakapp624c/htmx/PartNumber/create/", htmx.HTMXPartNumberCreateView.as_view(), name="toolbreakapp624c_PartNumber_htmx_create"),
    path("toolbreakapp624c/htmx/PartNumber/delete/<int:pk>/", htmx.HTMXPartNumberDeleteView.as_view(), name="toolbreakapp624c_PartNumber_htmx_delete"),
    path("toolbreakapp624c/htmx/Tool/", htmx.HTMXToolListView.as_view(), name="toolbreakapp624c_Tool_htmx_list"),
    path("toolbreakapp624c/htmx/Tool/create/", htmx.HTMXToolCreateView.as_view(), name="toolbreakapp624c_Tool_htmx_create"),
    path("toolbreakapp624c/htmx/Tool/delete/<int:pk>/", htmx.HTMXToolDeleteView.as_view(), name="toolbreakapp624c_Tool_htmx_delete"),
    path("toolbreakapp624c/htmx/Supervisor/", htmx.HTMXSupervisorListView.as_view(), name="toolbreakapp624c_Supervisor_htmx_list"),
    path("toolbreakapp624c/htmx/Supervisor/create/", htmx.HTMXSupervisorCreateView.as_view(), name="toolbreakapp624c_Supervisor_htmx_create"),
    path("toolbreakapp624c/htmx/Supervisor/delete/<int:pk>/", htmx.HTMXSupervisorDeleteView.as_view(), name="toolbreakapp624c_Supervisor_htmx_delete"),
    path("toolbreakapp624c/htmx/PressSelect/", htmx.HTMXPressSelectListView.as_view(), name="toolbreakapp624c_PressSelect_htmx_list"),
    path("toolbreakapp624c/htmx/PressSelect/create/", htmx.HTMXPressSelectCreateView.as_view(), name="toolbreakapp624c_PressSelect_htmx_create"),
    path("toolbreakapp624c/htmx/PressSelect/delete/<int:pk>/", htmx.HTMXPressSelectDeleteView.as_view(), name="toolbreakapp624c_PressSelect_htmx_delete"),
    path("toolbreakapp624c/htmx/PressInfo/", htmx.HTMXPressInfoListView.as_view(), name="toolbreakapp624c_PressInfo_htmx_list"),
    path("toolbreakapp624c/htmx/PressInfo/create/", htmx.HTMXPressInfoCreateView.as_view(), name="toolbreakapp624c_PressInfo_htmx_create"),
    path("toolbreakapp624c/htmx/PressInfo/delete/<int:pk>/", htmx.HTMXPressInfoDeleteView.as_view(), name="toolbreakapp624c_PressInfo_htmx_delete"),
    path("toolbreakapp624c/htmx/Deviation/", htmx.HTMXDeviationListView.as_view(), name="toolbreakapp624c_Deviation_htmx_list"),
    path("toolbreakapp624c/htmx/Deviation/create/", htmx.HTMXDeviationCreateView.as_view(), name="toolbreakapp624c_Deviation_htmx_create"),
    path("toolbreakapp624c/htmx/Deviation/delete/<int:pk>/", htmx.HTMXDeviationDeleteView.as_view(), name="toolbreakapp624c_Deviation_htmx_delete"),
    path("toolbreakapp624c/htmx/Engineering/", htmx.HTMXEngineeringListView.as_view(), name="toolbreakapp624c_Engineering_htmx_list"),
    path("toolbreakapp624c/htmx/Engineering/create/", htmx.HTMXEngineeringCreateView.as_view(), name="toolbreakapp624c_Engineering_htmx_create"),
    path("toolbreakapp624c/htmx/Engineering/delete/<int:pk>/", htmx.HTMXEngineeringDeleteView.as_view(), name="toolbreakapp624c_Engineering_htmx_delete"),
    path("toolbreakapp624c/htmx/ToolRoom/", htmx.HTMXToolRoomListView.as_view(), name="toolbreakapp624c_ToolRoom_htmx_list"),
    path("toolbreakapp624c/htmx/ToolRoom/create/", htmx.HTMXToolRoomCreateView.as_view(), name="toolbreakapp624c_ToolRoom_htmx_create"),
    path("toolbreakapp624c/htmx/ToolRoom/delete/<int:pk>/", htmx.HTMXToolRoomDeleteView.as_view(), name="toolbreakapp624c_ToolRoom_htmx_delete"),
    path("toolbreakapp624c/htmx/ToolBreakageReport/", htmx.HTMXToolBreakageReportListView.as_view(), name="toolbreakapp624c_ToolBreakageReport_htmx_list"),
    path("toolbreakapp624c/htmx/ToolBreakageReport/create/", htmx.HTMXToolBreakageReportCreateView.as_view(), name="toolbreakapp624c_ToolBreakageReport_htmx_create"),
    path("toolbreakapp624c/htmx/ToolBreakageReport/delete/<int:pk>/", htmx.HTMXToolBreakageReportDeleteView.as_view(), name="toolbreakapp624c_ToolBreakageReport_htmx_delete"),
    path("toolbreakapp624c/htmx/Help/", htmx.HTMXHelpListView.as_view(), name="toolbreakapp624c_Help_htmx_list"),
    path("toolbreakapp624c/htmx/Help/create/", htmx.HTMXHelpCreateView.as_view(), name="toolbreakapp624c_Help_htmx_create"),
    path("toolbreakapp624c/htmx/Help/delete/<int:pk>/", htmx.HTMXHelpDeleteView.as_view(), name="toolbreakapp624c_Help_htmx_delete"),
    path("toolbreakapp624c/htmx/CoinIssue/", htmx.HTMXCoinIssueListView.as_view(), name="toolbreakapp624c_CoinIssue_htmx_list"),
    path("toolbreakapp624c/htmx/CoinIssue/create/", htmx.HTMXCoinIssueCreateView.as_view(), name="toolbreakapp624c_CoinIssue_htmx_create"),
    path("toolbreakapp624c/htmx/CoinIssue/delete/<int:pk>/", htmx.HTMXCoinIssueDeleteView.as_view(), name="toolbreakapp624c_CoinIssue_htmx_delete"),
)
