from django.contrib.auth.backends import ModelBackend
from .models import Utilisateur

class GestAssuBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = Utilisateur.objects.get(login_utilisateur=username)
            # Existing passwords appear to be plain text or a specific format
            # We compare directly for now to ensure connection to existing data
            if user.mot_de_passe == password:
                return user
        except Utilisateur.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return Utilisateur.objects.get(pk=user_id)
        except Utilisateur.DoesNotExist:
            return None
