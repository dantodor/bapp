<template>
  <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
      <div class="mdl-layout__header-row">
        <span class="mdl-layout-title">DeviceXS</span>
      </div>
    </header>
    <div class="mdl-layout__drawer">
      <span class="mdl-layout-title">DeviceXS</span>
      <nav class="mdl-navigation">
        <router-link class="mdl-navigation__link" to="/" @click.native="hideMenu">
          <span class="material-icons">home</span>
          Home
        </router-link>
        <router-link class="mdl-navigation__link" to="/logout" @click.native="hideMenu">
          <span class="material-icons">exit_to_app</span>
          Log out
        </router-link>
      </nav>
    </div>
    <main class="mdl-layout__content">
      <transition mode="out-in">
        <router-view></router-view>
      </transition>
    </main>
    <footer class="mdl-mini-footer">
        <div class="mdl-mini-footer--left-section">
          DeviceXS 2018
        </div>
        <div class="mdl-mini-footer--right-section">
          Questions ? support@devicexs.com
        </div>
    </footer>`
  </div>
</template>

<script>

require('material-design-lite')

import {mapActions} from 'vuex'

export default {
  name: 'app',
  methods: {
    hideMenu: function () {
      document.getElementsByClassName('mdl-layout__drawer')[0].classList.remove('is-visible')
      document.getElementsByClassName('mdl-layout__obfuscator')[0].classList.remove('is-visible')
    },
    ...mapActions (
          [
              'getLocations'
        ]
      )
  },
  created() {
    this.token = localStorage.getItem("token")
    if (!this.token) {
        this.loggedIn = false
        this.$router.push({name: 'login'})
    } else {
        this.getLocations()
        console.log('logged in')
    }
  }
}

</script>

<style scoped>

@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

@import url('https://code.getmdl.io/1.2.1/material.blue-red.min.css');

body {
  margin: 0;
}

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

main {
  text-align: center;
  margin-top: 4px;
}

header {
  margin: 0;
  height: 56px;
  padding: 0 16px 0 24px;
  color: #ffffff;
}

footer {
  margin: 0;
  height: 36px;
  padding: 12px 16px 0 24px;
  color: #ffffff;
}

header span {
  display: block;
  position: relative;
  font-size: 20px;
  line-height: 1;
  letter-spacing: .02em;
  font-weight: 400;
  box-sizing: border-box;
  padding-top: 16px;
}

.v-enter-active, .v-leave-active {
  transition: opacity 0.7s;
}

.v-enter-active, .v-leave-active {
  opacity: 0;
}

</style>
