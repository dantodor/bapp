<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
    <main class="mdl-layout__content">
        <div class="mdl-grid">           
                <div v-for="sensor in this.activeSns.sensors">
                    <Sensor :sns="sensor"></Sensor>
                </div>
        </div>
    </main>
    <router-link class="add-picture-button mdl-button mdl-js-button mdl-button--fab mdl-button--colored" :to="{name: 'home'}">
        <i class="material-icons">add</i>
    </router-link>
  </div>

</template>
<script>

import Sensor from './Sensor'
import {mapActions} from 'vuex'

  export default {
    components: {
        Sensor
    },
    methods: {
    ...mapActions (
          [
              'getSensors'
          ]
        )
    },
    computed: {
        activeLoc() {
            return this.$store.state.activeLoc
        },
        activeSns() {
            return this.$store.state.activeSns
        }
    },
    mounted() {
        this.getSensors()
    }
  }
</script>

<style scoped>

  .add-picture-button {
    position: fixed;
    right: 24px;
    bottom: 74px;
    z-index: 998;
  }
  
</style>

