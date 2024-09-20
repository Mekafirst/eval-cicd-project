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

# Start with the FastAPI base image
FROM tiangolo/uvicorn-gunicorn:python3.11
# Set the working directory
WORKDIR /app
# Copy the application code and requirements
COPY . /app
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Expose the port the app runs on
EXPOSE 8001
# Command to run the FastAPI app with Uvicorn
CMD ["uvicorn", "app.mini-groq:app", "--host", "0.0.0.0", "--port", "8001"]

- On teste de build et de run le docker, this is fine

docker build -t groq-api .     
docker run -p 8001:8001 groq-api

Et ça se lance !
