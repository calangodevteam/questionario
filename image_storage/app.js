const express = require('express');
const multer = require('multer');
const path = require('path');
const dir = './uploads/';
const app = express();
const PORT = 3000; // Porta do servidor

// Configuração do multer para upload de imagens
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, dir); // Pasta onde a imagem será salva (neste caso, a raiz do projeto)
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname); // Nome original do arquivo
  },
});

const upload = multer({ storage });

// Rota para fazer upload de imagem
app.post('/image', upload.single('imagem'), (req, res) => {
  const file = req.file;
  if (!file) {
    return res.status(400).json({ error: 'Nenhuma imagem foi enviada.' });
  }
  return res.json({ URL:"http://localhost:3000/image/"+file.filename });
});

// Rota para recuperar a imagem via URL
app.get('/image/:nomeImagem', (req, res) => {
  const nomeImagem = req.params.nomeImagem;
  const imagePath = path.join(__dirname, dir); // Caminho completo da imagem na raiz do projeto
  return res.sendFile(imagePath+nomeImagem);
});

// Inicia o servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});