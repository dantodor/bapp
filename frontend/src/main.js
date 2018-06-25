// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store/store'

Vue.config.productionTip = false

Object.defineProperty(Vue.prototype, '$bus', {
  get() {
      return this.$root.bus;
  }
});

var bus = new Vue({}) // This empty Vue model will serve as our event bus.

import { ApolloClient, createNetworkInterface } from 'apollo-client'

const networkInterface = createNetworkInterface({
  uri: '/api',
})

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


const apolloClient = new ApolloClient({
  networkInterface: networkInterface,
  connectToDevTools: true,
})

import VueApollo from 'vue-apollo'

Vue.use(VueApollo)

let loading = 0

const apolloProvider = new VueApollo({
  clients: {
    a: apolloClient,
  },
  defaultClient: apolloClient,
  defaultOptions: {
    // $loadingKey: 'loading',
  },
  watchLoading (state, mod) {
    loading += mod
    //console.log('Global loading', loading, mod)
  },
  errorHandler (error) {
    console.log('Global error handler')
    console.error(error)
  },
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  apolloProvider,
  router,
  store,
  template: '<App/>',
  components: { App },
  data: {
    bus: bus // Here we bind our event bus to our $root Vue model.
  }
})
