from rest_framework import viewsets, permissions

from . import serializers
from . import models


class ToolsShopFloorViewSet(viewsets.ModelViewSet):
    """ViewSet for the ToolsShopFloor class"""

    queryset = models.ToolsShopFloor.objects.all()
    serializer_class = serializers.ToolsShopFloorSerializer
    permission_classes = [permissions.IsAuthenticated]


class CompactIssueViewSet(viewsets.ModelViewSet):
    """ViewSet for the CompactIssue class"""

    queryset = models.CompactIssue.objects.all()
    serializer_class = serializers.CompactIssueSerializer
    permission_classes = [permissions.IsAuthenticated]


class PartNumberViewSet(viewsets.ModelViewSet):
    """ViewSet for the PartNumber class"""

    queryset = models.PartNumber.objects.all()
    serializer_class = serializers.PartNumberSerializer
    permission_classes = [permissions.IsAuthenticated]


class ToolViewSet(viewsets.ModelViewSet):
    """ViewSet for the Tool class"""

    queryset = models.Tool.objects.all()
    serializer_class = serializers.ToolSerializer
    permission_classes = [permissions.IsAuthenticated]


class SupervisorViewSet(viewsets.ModelViewSet):
    """ViewSet for the Supervisor class"""

    queryset = models.Supervisor.objects.all()
    serializer_class = serializers.SupervisorSerializer
    permission_classes = [permissions.IsAuthenticated]


class PressSelectViewSet(viewsets.ModelViewSet):
    """ViewSet for the PressSelect class"""

    queryset = models.PressSelect.objects.all()
    serializer_class = serializers.PressSelectSerializer
    permission_classes = [permissions.IsAuthenticated]


class PressInfoViewSet(viewsets.ModelViewSet):
    """ViewSet for the PressInfo class"""

    queryset = models.PressInfo.objects.all()
    serializer_class = serializers.PressInfoSerializer
    permission_classes = [permissions.IsAuthenticated]


class DeviationViewSet(viewsets.ModelViewSet):
    """ViewSet for the Deviation class"""

    queryset = models.Deviation.objects.all()
    serializer_class = serializers.DeviationSerializer
    permission_classes = [permissions.IsAuthenticated]


class EngineeringViewSet(viewsets.ModelViewSet):
    """ViewSet for the Engineering class"""

    queryset = models.Engineering.objects.all()
    serializer_class = serializers.EngineeringSerializer
    permission_classes = [permissions.IsAuthenticated]


class ToolRoomViewSet(viewsets.ModelViewSet):
    """ViewSet for the ToolRoom class"""

    queryset = models.ToolRoom.objects.all()
    serializer_class = serializers.ToolRoomSerializer
    permission_classes = [permissions.IsAuthenticated]


class ToolBreakageReportViewSet(viewsets.ModelViewSet):
    """ViewSet for the ToolBreakageReport class"""

    queryset = models.ToolBreakageReport.objects.all()
    serializer_class = serializers.ToolBreakageReportSerializer
    permission_classes = [permissions.IsAuthenticated]


class HelpViewSet(viewsets.ModelViewSet):
    """ViewSet for the Help class"""

    queryset = models.Help.objects.all()
    serializer_class = serializers.HelpSerializer
    permission_classes = [permissions.IsAuthenticated]


class CoinIssueViewSet(viewsets.ModelViewSet):
    """ViewSet for the CoinIssue class"""

    queryset = models.CoinIssue.objects.all()
    serializer_class = serializers.CoinIssueSerializer
    permission_classes = [permissions.IsAuthenticated]
