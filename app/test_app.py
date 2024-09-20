from fastapi.testclient import TestClient
from .minigroq import client

client = TestClient(client)

def test_read_main():
    response = client.get("/status")
    assert response.status_code == 200
    assert response.json() == {"message": "OK"}
