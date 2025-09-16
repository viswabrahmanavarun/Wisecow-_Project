const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Wisecow!');
});

app.listen(port, () => {
  console.log(`Wisecow app running on port ${port}`);
});
