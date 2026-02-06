from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from .models import Utilisateur

def login_view(request):
    if request.method == 'POST':
        login_u = request.POST.get('login')
        password = request.POST.get('password')
        
        user = authenticate(request, username=login_u, password=password)
        
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, "Identifiant ou mot de passe incorrect")
            
    return render(request, 'accounts/login.html')
