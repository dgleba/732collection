from django.db import models
from django.urls import reverse


class PostedFromTbl(models.Model):

    # Fields
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    name = models.CharField(max_length=33)

    class Meta:
        pass

    def __str__(self):
        return str(self.name)

    def get_absolute_url(self):
        return reverse("blogappm2m_PostedFromTbl_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("blogappm2m_PostedFromTbl_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("blogappm2m_PostedFromTbl_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("blogappm2m_PostedFromTbl_htmx_delete", args=(self.pk,))


class TagTbl(models.Model):

    # Fields
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    name = models.CharField(max_length=302)

    class Meta:
        pass

    def __str__(self):
        return str(self.name)

    def get_absolute_url(self):
        return reverse("blogappm2m_TagTbl_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("blogappm2m_TagTbl_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("blogappm2m_TagTbl_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("blogappm2m_TagTbl_htmx_delete", args=(self.pk,))


class PostTbl(models.Model):

    # Relationships
    post_tag_mm = models.ManyToManyField("blogappm2m.TagTbl", related_name='posttags')
    postedfrom_id = models.ForeignKey("blogappm2m.PostedFromTbl", on_delete=models.CASCADE, related_name='postedfrom')

    # Fields
    title = models.CharField(max_length=330)
    updated_at = models.DateTimeField(auto_now=True, editable=False)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    body = models.TextField()

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("blogappm2m_PostTbl_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("blogappm2m_PostTbl_update", args=(self.pk,))

    @staticmethod
    def get_htmx_create_url():
        return reverse("blogappm2m_PostTbl_htmx_create")

    def get_htmx_delete_url(self):
        return reverse("blogappm2m_PostTbl_htmx_delete", args=(self.pk,))
