const API_BASE_URL = process.env.REACT_APP_API_URL || '[localhost](http://localhost:8080)';

export async function fetchMessage() {
  const response = await fetch(`${API_BASE_URL}/api/message`);
  if (!response.ok) {
    throw new Error('Erro ao buscar mensagem da API');
  }
  return response.json();
}

export async function fetchDbTime() {
  const response = await fetch(`${API_BASE_URL}/api/db-time`);
  if (!response.ok) {
    throw new Error('Erro ao buscar hora do banco');
  }
  return response.json();
}
