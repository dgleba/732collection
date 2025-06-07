from django.views import generic
from django.urls import reverse_lazy
from . import models
from . import forms


class PostedFromTblListView(generic.ListView):
    model = models.PostedFromTbl
    form_class = forms.PostedFromTblForm


class PostedFromTblCreateView(generic.CreateView):
    model = models.PostedFromTbl
    form_class = forms.PostedFromTblForm


class PostedFromTblDetailView(generic.DetailView):
    model = models.PostedFromTbl
    form_class = forms.PostedFromTblForm


class PostedFromTblUpdateView(generic.UpdateView):
    model = models.PostedFromTbl
    form_class = forms.PostedFromTblForm
    pk_url_kwarg = "pk"


class PostedFromTblDeleteView(generic.DeleteView):
    model = models.PostedFromTbl
    success_url = reverse_lazy("blogappm2m_PostedFromTbl_list")


class TagTblListView(generic.ListView):
    model = models.TagTbl
    form_class = forms.TagTblForm


class TagTblCreateView(generic.CreateView):
    model = models.TagTbl
    form_class = forms.TagTblForm


class TagTblDetailView(generic.DetailView):
    model = models.TagTbl
    form_class = forms.TagTblForm


class TagTblUpdateView(generic.UpdateView):
    model = models.TagTbl
    form_class = forms.TagTblForm
    pk_url_kwarg = "pk"


class TagTblDeleteView(generic.DeleteView):
    model = models.TagTbl
    success_url = reverse_lazy("blogappm2m_TagTbl_list")


class PostTblListView(generic.ListView):
    model = models.PostTbl
    form_class = forms.PostTblForm


class PostTblCreateView(generic.CreateView):
    model = models.PostTbl
    form_class = forms.PostTblForm


class PostTblDetailView(generic.DetailView):
    model = models.PostTbl
    form_class = forms.PostTblForm


class PostTblUpdateView(generic.UpdateView):
    model = models.PostTbl
    form_class = forms.PostTblForm
    pk_url_kwarg = "pk"


class PostTblDeleteView(generic.DeleteView):
    model = models.PostTbl
    success_url = reverse_lazy("blogappm2m_PostTbl_list")
