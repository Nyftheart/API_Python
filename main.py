from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector

# Connexion à la base de données
db = mysql.connector.connect(
    host="localhost",
    user="user",
    password="mypassword",
    database="API"
)

# Initialiser l'application FastAPI
app = FastAPI()


# Modèle de tâche Pydantic
class Task(BaseModel):
    task: str
    importance: str
    completed: bool


# Route pour récupérer toutes les tâches
@app.get("/tasks")
def read_tasks():
    # Créer un curseur pour interagir avec la base de données
    cursor = db.cursor()

    # Exécuter une requête SQL
    cursor.execute("SELECT * FROM DataTable")

    # Récupérer les résultats de la requête
    results = cursor.fetchall()

    # Créer une liste de dictionnaires de tâches
    tasks = []
    for row in results:
        id = row[0]
        task = row[1]
        importance = row[2]
        completed = bool(row[3])
        tasks.append({"id": id, "task": task, "importance": importance, "completed": completed})

    # Fermer le curseur
    cursor.close()

    # Renvoyer la liste de tâches
    return tasks


# Route pour créer une nouvelle tâche
@app.post("/tasks")
def create_task(task: Task):
    # Créer un curseur pour interagir avec la base de données
    cursor = db.cursor()

    # Insérer une nouvelle tâche dans la base de données
    sql = "INSERT INTO DataTable (Task, Importance, Completed) VALUES (%s, %s, %s)"
    values = (task.task, task.importance, task.completed)
    cursor.execute(sql, values)
    db.commit()

    # Récupérer l'ID de la nouvelle tâche
    task_id = cursor.lastrowid

    # Fermer le curseur
    cursor.close()

    # Renvoyer la nouvelle tâche avec son ID
    return {"id": task_id, **task.dict()}


# Route pour mettre à jour une tâche existante
@app.put("/tasks/{task_id}")
def update_task(task_id: int, task: Task):
    # Créer un curseur pour interagir avec la base de données
    cursor = db.cursor()

    # Mettre à jour la tâche dans la base de données
    sql = "UPDATE DataTable SET Task=%s, Importance=%s, Completed=%s WHERE Id=%s"
    values = (task.task, task.importance, task.completed, task_id)
    cursor.execute(sql, values)
    db.commit()

    # Fermer le curseur
    cursor.close()

    # Renvoyer la tâche mise à jour
    return {"id": task_id, **task.dict()}


# Route pour supprimer une tâche existante
@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    # Créer un curseur pour interagir avec la base de données
    cursor = db.cursor()

    # Supprimer la tâche de la base de données
    sql = "DELETE FROM DataTable WHERE Id=%s"
    values = (task_id,)
    cursor.execute(sql, values)
    db.commit()

    # Fermer
