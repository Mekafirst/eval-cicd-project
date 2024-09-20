[![Publish Docker image](https://github.com/Mekafirst/eval-cicd-project/actions/workflows/docker-deploy.yml/badge.svg)](https://github.com/Mekafirst/eval-cicd-project/actions/workflows/docker-deploy.yml)

- Création du compte groq et fénération de la clé API
![image](https://github.com/user-attachments/assets/f08d5046-afbc-48f9-b511-495899ed16ba)

- Mise en place d'un fichier .env pour stocker la GROQ_API_KEY (et je la rajoute dans le .gitignore pour éviter de la push sur github)

- Edit du code py pour lui indiquer de prendre en compte la variable d'env (+ le import os qui manquait)

load_dotenv()  # Charge les variables d'environnement du fichier .env

api_key = os.getenv("GROQ_API_KEY")
client = Groq(api_key=api_key)

L'application démarre youhou !
![image](https://github.com/user-attachments/assets/a02a8f0d-f91e-4348-ac0e-98d349e20309)

- Refacto de l'arborescence (on aime quand c'est propre)

├── README.md

├── __pycache__

├── app

│   ├── mini-groq.cpython-311.pyc

│   └── mini-groq.py

├── dockerfile

└── requirements.txt


- Création du dockerfile 

FROM tiangolo/uvicorn-gunicorn:python3.11

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8001

CMD ["uvicorn", "app.mini-groq:app", "--host", "0.0.0.0", "--port", "8001"]

- On teste de build et de run le docker, this is fine

docker build -t groq-api .     
docker run -p 8001:8001 groq-api

Et ça se lance :

![image](https://github.com/user-attachments/assets/f873e5bf-00e4-4668-bace-6d586fbc341b)

- Petit ping du serveur au cas où :
![image](https://github.com/user-attachments/assets/1fadbab1-59b3-475d-b70a-a06c810b96cd)

- Création d'un test.sh pour trigger le /chat et poser la question fatidique "what is a llm" (on oublie pas de le chmod +x évidemment)
  
![image](https://github.com/user-attachments/assets/d97a6c6b-72b3-4b59-b2c6-dcffd88308e6)

Et la réponse fut :

![image](https://github.com/user-attachments/assets/2ef80c2f-c6a8-481c-91d3-d7bcba09d63e)


- Git management
Passage sur la branche dev

git checkout -b dev

![image](https://github.com/user-attachments/assets/f430ad43-3046-475e-a954-bfcdaa2469fe)



# Dockerhub
Création du repo sur dockerhub

![image](https://github.com/user-attachments/assets/2fb16fdd-c249-4c9f-891f-e7234b1a26ea)

Ajout des secrets sur github

![image](https://github.com/user-attachments/assets/7766e4e7-766b-4a6e-9173-e5755fe2ddff)

Création des tests dans le .github/workflows/docker-deploy.yml

![image](https://github.com/user-attachments/assets/f60c1107-1458-46b6-bdec-22b60f0cbe72)


Déroulé des codes en vert \o/

![image](https://github.com/user-attachments/assets/5afbe964-b128-45b9-9a31-46b27737110c)



