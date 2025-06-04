# -------------------------------
# Dockerfile pour votre projet Flask
# (le fichier __init__.py contient app.run(debug=True))
# -------------------------------

# 1. Image de base Python 3.9 (slim pour plus de légèreté)
FROM python:3.9-slim

# 2. Définir le répertoire de travail à l’intérieur du conteneur
WORKDIR /app

# 3. Copier le fichier requirements.txt, s’il existe.
#    Sinon, on installera Flask « à la volée »
COPY requirements.txt /app/requirements.txt

# 4. Installer les dépendances Python
#    Si requirements.txt n’existe pas, on fait pip install Flask
RUN if [ -f requirements.txt ]; then \
      pip install --no-cache-dir -r requirements.txt; \
    else \
      pip install --no-cache-dir Flask; \
    fi

# 5. Copier tout le reste du dépôt dans /app
COPY . /app

# 6. Exposer le port 5000 (celui utilisé par app.run)
EXPOSE 5000

# 7. Pour démarrer l’application, on lance directement le script __init__.py
#    (le « if __name__ == '__main__': app.run(...) » s’en chargera)
CMD ["python", "__init__.py"]
