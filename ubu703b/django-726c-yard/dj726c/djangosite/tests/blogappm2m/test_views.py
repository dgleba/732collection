import pytest
import test_helpers

from django.urls import reverse


pytestmark = [pytest.mark.django_db]


def tests_PostedFromTbl_list_view(client):
    instance1 = test_helpers.create_blogappm2m_PostedFromTbl()
    instance2 = test_helpers.create_blogappm2m_PostedFromTbl()
    url = reverse("blogappm2m_PostedFromTbl_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_PostedFromTbl_create_view(client):
    url = reverse("blogappm2m_PostedFromTbl_create")
    data = {
        "name": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PostedFromTbl_detail_view(client):
    instance = test_helpers.create_blogappm2m_PostedFromTbl()
    url = reverse("blogappm2m_PostedFromTbl_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_PostedFromTbl_update_view(client):
    instance = test_helpers.create_blogappm2m_PostedFromTbl()
    url = reverse("blogappm2m_PostedFromTbl_update", args=[instance.pk, ])
    data = {
        "name": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_TagTbl_list_view(client):
    instance1 = test_helpers.create_blogappm2m_TagTbl()
    instance2 = test_helpers.create_blogappm2m_TagTbl()
    url = reverse("blogappm2m_TagTbl_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_TagTbl_create_view(client):
    url = reverse("blogappm2m_TagTbl_create")
    data = {
        "name": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_TagTbl_detail_view(client):
    instance = test_helpers.create_blogappm2m_TagTbl()
    url = reverse("blogappm2m_TagTbl_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_TagTbl_update_view(client):
    instance = test_helpers.create_blogappm2m_TagTbl()
    url = reverse("blogappm2m_TagTbl_update", args=[instance.pk, ])
    data = {
        "name": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PostTbl_list_view(client):
    instance1 = test_helpers.create_blogappm2m_PostTbl()
    instance2 = test_helpers.create_blogappm2m_PostTbl()
    url = reverse("blogappm2m_PostTbl_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_PostTbl_create_view(client):
    tags = test_helpers.create_blogappm2m_TagTbl()
    postedfrom = test_helpers.create_blogappm2m_PostedFromTbl()
    url = reverse("blogappm2m_PostTbl_create")
    data = {
        "body": "text",
        "title": "text",
        "tags": tags.pk,
        "postedfrom": postedfrom.pk,
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_PostTbl_detail_view(client):
    instance = test_helpers.create_blogappm2m_PostTbl()
    url = reverse("blogappm2m_PostTbl_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_PostTbl_update_view(client):
    tags = test_helpers.create_blogappm2m_TagTbl()
    postedfrom = test_helpers.create_blogappm2m_PostedFromTbl()
    instance = test_helpers.create_blogappm2m_PostTbl()
    url = reverse("blogappm2m_PostTbl_update", args=[instance.pk, ])
    data = {
        "body": "text",
        "title": "text",
        "tags": tags.pk,
        "postedfrom": postedfrom.pk,
    }
    response = client.post(url, data)
    assert response.status_code == 302
