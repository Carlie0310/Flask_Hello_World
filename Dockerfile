# -------------------------------
# Dockerfile pour votre projet Flask
# (le fichier __init__.py contient app.run(debug=True))
# -------------------------------

# 1. Image de base Python 3.9 (slim pour plus de légèreté)
FROM python:3.9-slim

# 2. Définir le répertoire de travail à l’intérieur du conteneur
WORKDIR /Flask_Hello_World

# 3. On installera requirements.txt
COPY requirements.txt .
RUN pip install -r requirements.txt

# 5. Copier tout le reste du dépôt dans /app
COPY . .

# 6. Exposer le port 5000 (celui utilisé par app.run)
EXPOSE 5000

# 7. Pour démarrer l’application, on lance directement le script __init__.py
#    (le « if __name__ == '__main__': app.run(...) » s’en chargera)
CMD ["python", "__init__.py"]
