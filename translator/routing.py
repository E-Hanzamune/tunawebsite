# translator/routing.py
from django.urls import re_path
from . import consumers

websocket_urlpatterns = [
    re_path('ws/translate/$', consumers.ASLConsumer.as_asgi()),
]
