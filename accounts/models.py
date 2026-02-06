from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

class UtilisateurManager(BaseUserManager):
    def get_by_natural_key(self, username):
        return self.get(login_utilisateur=username)

class Utilisateur(AbstractBaseUser):
    idutilisateur = models.CharField(db_column='IDUTILISATEUR', primary_key=True, max_length=50)
    nom_utilisateur = models.CharField(db_column='Nom_utilisateur', max_length=255, blank=True, null=True)
    adresse_email = models.EmailField(db_column='Adresse_email', max_length=100, blank=True, null=True)
    password = models.CharField(db_column='Mot_de_passe', max_length=255)
    tel_utilisateur = models.CharField(db_column='Tel_utilisateur', max_length=50, blank=True, null=True)
    role_utilisateur = models.CharField(db_column='Role_utilisateur', max_length=50, blank=True, null=True)
    login_utilisateur = models.CharField(db_column='login_utilisateur', unique=True, max_length=100)
    last_login = models.DateTimeField(db_column='date_synchro', blank=True, null=True)
    effacer = models.BooleanField(default=False)
    sync = models.BooleanField(default=False)
    date_modif = models.DateTimeField(blank=True, null=True)
    date_enreg = models.DateTimeField(blank=True, null=True)
    idutilisateur_save = models.CharField(db_column='IDUTILISATEUR_save', max_length=50, blank=True, null=True)
    codeagence = models.CharField(db_column='CodeAgence', max_length=50, blank=True, null=True)
    est_desactiver = models.BooleanField(default=False)
    daterecupserveur = models.DateTimeField(blank=True, null=True)

    objects = UtilisateurManager()

    USERNAME_FIELD = 'login_utilisateur'
    REQUIRED_FIELDS = ['adresse_email']

    class Meta:
        managed = False
        db_table = 'utilisateur'

    def __str__(self):
        return self.nom_utilisateur or self.login_utilisateur

    @property
    def is_active(self):
        return not self.est_desactiver and not self.effacer
