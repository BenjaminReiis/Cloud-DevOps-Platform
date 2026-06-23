import React, { useEffect, useState } from 'react';
import { fetchMessage, fetchDbTime } from './api';

function App() {
  const [message, setMessage] = useState('');
  const [dbTime, setDbTime] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    async function loadData() {
      try {
        const msg = await fetchMessage();
        setMessage(msg.message);

        const time = await fetchDbTime();
        setDbTime(time.db_time);
      } catch (err) {
        setError(err.message);
      }
    }

    loadData();
  }, []);

  return (
    <div style={{ fontFamily: 'Arial', padding: '40px' }}>
      <h1>GCP Full Stack CI/CD</h1>
      <p><strong>Mensagem da API:</strong> {message}</p>
      <p><strong>Hora no banco:</strong> {dbTime}</p>
      {error && <p style={{ color: 'red' }}><strong>Erro:</strong> {error}</p>}
    </div>
  );
}

export default App;
