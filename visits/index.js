const express = require('express');
const redis = require('redis')

const app = express();
const client = redis.createClient({
    host: 'redis-server'
});
client.set('visits', 0)


app.get('/', (req, res) => {
    client.send('visits', (err, visits) => {
        res.send('Number of visits is ' + visits)
        client.set('visits', parseInt(visits) + 1)
    })
}) 

app.listen(8081, () => {
    console.log('listenning')
})