import { Line } from 'vue-chartjs'

export default Line.extend({
  props: ['ldata'],
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: this.ldata.l,
      datasets: [
        {
          label: 'Sensor data',
          backgroundColor: '#40b0ed',
          data: this.ldata.m
        }
      ]
    })
  }
})
