import Vue from 'vue'
import Router from 'vue-router'
import HomeView from '../components/Home'
import LoginView from '../components/Login'
import LogoutView from '../components/Logout'
import LocationView from '../components/Location'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/loc',
      name: 'loc',
      component: LocationView,
      props: true
    },
    {
      path: '/logout',
      name: 'logout',
      component: LogoutView
    }
  ]
})

