#!/bin/bash
# Installer Django
pip install django

# Créer le projet Django dans le dossier actuel
django-admin startproject cafeteria .

# Créer une application Django
python manage.py startapp cafeteria_app

# Effectuer les migrations initiales
python manage.py migrate