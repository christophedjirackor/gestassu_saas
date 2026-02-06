from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from .models import Utilisateur

def login_view(request):
    if request.method == 'POST':
        login_u = request.POST.get('login')
        password = request.POST.get('password')
        
        # Try to find the user
        try:
            user = Utilisateur.objects.get(login_utilisateur=login_u)
            # CHECK PASSWORD: For now, assuming standard Django hashing or plain text for dev
            # In a real scenario, we might need a custom hasher if the DB uses MD5/SHA1
            if user.check_password(password):
                login(request, user)
                return redirect('home') # Adjust as needed
            else:
                messages.error(request, "Mot de passe incorrect")
        except Utilisateur.DoesNotExist:
            messages.error(request, "Utilisateur non trouvé")
            
    return render(request, 'accounts/login.html')
