# Vercel Deployment


Ok, so i could deploy intergram bot fine on Vercel, the only part which remained a problem, was that my browser client obviously not connect to the websocket server endpoint.

```JSon
{
    "version": 2,
    "builds": [
        {
            "src": "server.js",
            "use": "@vercel/node"
        },
        {
            "src": "dist/**",
            "use": "@vercel/static"
        }
    ],
    "routes":[
        {
            "src": "/hook",
            "dest": "server.js"
        },
        {
            "src": "/socket.io",
            "dest": "server.js"
        },
        {
            "src": "/socket.io/(.+)",
            "dest": "server.js"
        },
        {
            "src": "/",
            "dest": "dist/demo.html"
        },
        {
            "src": "/(.+)",
            "dest": "dist/$1"
        }
    ]
}
```

So I wondered how to configure the vercel deployment for a WebSocket in the `vercel.json`, and the fact is taht vercel does not support WebSockets, because vercel deployments are serverless, and serverless is ephemeral, so not designed to maintain a websocket connection, see https://vercel.com/guides/do-vercel-serverless-functions-support-websocket-connections


https://pusher.com/docs/channels/using_channels/functions/#deploy-a-function


Any, they propose to change our App architecture, to use a side service for websocket, ah bah oui j'ai créé pmon compote [Pusher](https://dashboard.pusher.com) en me logguant avec github, cf. [Pusher](https://dashboard.pusher.com/apps/1676363/getting_started)



J'ai trouvé une version open source de Pusher : 
* LA question est intéressante: comment on fait de la connexion websocket en mode scale up eg Kubernetes: il existe une notion de WWebSOcket Server, manifestement le "protocole" `Open Pusher` est un pattern pour avoir de la scalabilité avec un serveur de WebSocket.
* Pour dépolyer Soketi : https://docs.soketi.app/getting-started/installation/docker
* https://docs.soketi.app/getting-started/installation/helm-charts