from django.contrib import admin
from django import forms

from . import models

from django.utils.html import format_html
# old.. from django.core.urlresolvers import reverse
from django.urls import reverse


from django.http import HttpResponseRedirect
from django.template.response import TemplateResponse

# from .forms import DepositForm, WithdrawForm



# =================================================

# second admin site

class PostAdminSite(admin.AdminSite):
    site_header = "Blog Post admin"
    site_title = "Blog Post Admin Portal"
    index_title = "Welcome to dgammyblog"

post_admin_site = PostAdminSite(name='post_admin')

post_admin_site.register(models.Post)




# =================================================



# =================================================
# =================================================
# =================================================
# =================================================

# first admin site

class PostAdminForm(forms.ModelForm):

    class Meta:
        model = models.Post
        fields = "__all__"


class PostAdmin(admin.ModelAdmin):
    form = PostAdminForm
    list_display = [
        "created",
        "last_updated",
        "title",
        "body",
    ]
    readonly_fields = [
        "created",
        "last_updated",
        "title",
        "body",
    ]

error....
 File "/code/blogapp/admin.py", line 71, in get_urls
djdev_1     |     url(
djdev_1     | NameError: name 'url' is not defined


    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            url(
                r'^(?P<post_id>.+)/postb/$',
                self.admin_site.admin_view(self.process_deposit),
                name='account-deposit',
            ),
            url(
                r'^(?P<account_id>.+)/withdraw/$',
                self.admin_site.admin_view(self.process_withdraw),
                name='account-withdraw',
            ),
        ]
        return custom_urls + urls

    def account_actions(self, obj):
        return format_html(
            '<a class="button" href="{}">Deposit</a>&nbsp;'
            '<a class="button" href="{}">Withdraw</a>',
            reverse('admin:account-deposit', args=[obj.pk]),
            reverse('admin:account-withdraw', args=[obj.pk]),
        )
    account_actions.short_description = 'Account Actions'
    account_actions.allow_tags = True

    def process_deposit(self, request, post_id, *args, **kwargs):
        return self.process_action(
            request=request,
            post_id=post_id,
            action_form=DepositForm,
            action_title='Deposit',
        )

    def process_withdraw(self, request, post_id, *args, **kwargs):
        return self.process_action(
            request=request,
            account_id=post_id,
            action_form=WithdrawForm,
            action_title='Withdraw',
        )

    def process_action(
        self,
        request,
        post_id,
        action_form,
        action_title
    ):
        account = self.get_object(request, post_id)

        if request.method != 'POST':
            form = action_form()

        else:
            form = action_form(request.POST)
            if form.is_valid():
                try:
                    form.save(account, request.user)
                except errors.Error as e:
                    # If save() raised, the form will a have a non
                    # field error containing an informative message.
                    pass
                else:
                    self.message_user(request, 'Success')
                    url = reverse(
                        'admin:account_account_change',
                       args=[account.pk],
                        current_app=self.admin_site.name,
                    )
                    return HttpResponseRedirect(url)

        context = self.admin_site.each_context(request)
        context['opts'] = self.model._meta
        context['form'] = form
        context['account'] = account
        context['title'] = action_title

        return TemplateResponse(
            request,
            'admin/account/account_action.html',
            context,
        )


# =================================================


admin.site.register(models.Post, PostAdmin)


# =================================================
