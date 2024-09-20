- Création du compte groq et fénération de la clé API
![image](https://github.com/user-attachments/assets/f08d5046-afbc-48f9-b511-495899ed16ba)

- Mise en place d'un fichier .env pour stocker la GROQ_API_KEY (et je la rajoute dans le .gitignore pour éviter de la push sur github)

- Edit du code py pour lui indiquer de prendre en compte la variable d'env (+ le import os qui manquait)

load_dotenv()  # Charge les variables d'environnement du fichier .env

api_key = os.getenv("GROQ_API_KEY")
client = Groq(api_key=api_key)

L'application démarre youhou !
![image](https://github.com/user-attachments/assets/a02a8f0d-f91e-4348-ac0e-98d349e20309)


