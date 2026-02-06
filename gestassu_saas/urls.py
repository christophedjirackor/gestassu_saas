"""
URL configuration for gestassu_saas project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/6.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.conf.urls.static import static

@login_required
def home(request):
    return HttpResponse(f"<h1>Bienvenue {request.user.nom_utilisateur}</h1><p>Ceci est votre tableau de bord.</p><div style='padding: 20px; background: #f1f5f9; border-radius: 8px;'><a href='/logout/' style='color: #ef4444; text-decoration: none; font-weight: 600;'>Se déconnecter</a></div>")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('accounts.urls')),
    path('home/', home, name='home'),
    path('logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
