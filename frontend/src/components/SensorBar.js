import { Bar } from 'vue-chartjs'

export default Bar.extend({
    props: ['ldata'],
    mounted () {
        // Overwriting base render method with actual data.
        this.renderChart({
        labels: this.ldata.l,
        datasets: [
            {
            label: 'Sensor data',
            backgroundColor: '#f87979',
            data: this.ldata.m
            }
        ]
        })
    }
})