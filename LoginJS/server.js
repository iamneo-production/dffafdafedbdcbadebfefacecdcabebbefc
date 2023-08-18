// const express = require('express');
// const app = express();
// const port = 8081;

// //app.use('/static', express.static('public'))
// app.use(express.static('public/registeration.html'))
// app.listen(port, () => console.log(`listening on port ${port}!`));

const express = require('express');
const app = express();
const port = 8081;

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/registeration.html'); // Serve the HTML file
});

app.use(express.static('public')); // Serve other static files from the 'public' directory

app.listen(port, () => console.log(`listening on port ${port}!`));
