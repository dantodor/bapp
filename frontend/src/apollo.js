import ApolloClient, { createNetworkInterface } from 'apollo-client';
//import { SubscriptionClient, addGraphQLSubscriptions } from 'subscriptions-transport-ws'

// dev_api = 'http://localhost:4000/api'
//
// const wsClient = new SubscriptionClient('wss://subscriptions.graph.cool/v1/cj3xgn6d2idze0104n3mpq4le', {
// 	reconnect: true,
// });

const networkInterface = createNetworkInterface({
	uri: '/api'
});

networkInterface.use([{
    applyMiddleware(req, next) {
      if (!req.options.headers) {
        req.options.headers = {};  // Create the header object if needed.
      }
      // get the authentication token from local storage if it exists
      const token = localStorage.getItem('token');
      req.options.headers.authorization = token ? `Bearer ${token}` : null;
      next();
    }
  }]);

// const networkInterfaceWithSubscriptions = addGraphQLSubscriptions(
// 	networkInterface,
// 	wsClient
// )

const client = new ApolloClient({
	networkInterface: networkInterface,
	connectToDevTools: true,
});

export default client;