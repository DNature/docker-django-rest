from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()
router.register('tags', views.TagViewset)
router.register('ingredients', views.IngredientViewSet)

app_name = 'recipe'
urlpatterns = [
    path('', include(router.urls))
]
