<<template>
			<div class="my-card mdl-card mdl-cell mdl-shadow--16dp">
				
                <div class = "mdl-grid mdl-card__supporting-text">
                    <div class = "mdl-cell mdl-cell--4-col">
                        <img src="../assets/sensor.png" />
                    </div>
                    <div class = "mdl-cell mdl-cell--8-col">
                        <font size=4> <strong> {{sns.sName}} </strong></font>
                        <p> Sensor description</p>
                    </div>
                   <div class = "mdl-cell mdl-cell--6-col">
                             
                    </div>
                     
                </div>
                <div v-if="this.sns.gtype==1">
                    <SensorLine  :ldata="outputData"></SensorLine>
                </div>
                <div v-else>
                    <SensorBar  :ldata="outputData"></SensorBar>
                </div>
            </div>
</template>

<<script>


import {mapActions} from 'vuex'
import SensorLine from './SensorLine'
import SensorBar from './SensorBar'

export default {
    computed: {
        activeLoc() {
            return this.$store.state.activeLoc
        },
    },
    props: ["sns"],
    data () {
        return {
            startColor: '#4286f4',
            stopColor: '#4286f4',
            innerStroke: '#e8ecf2',
            outputData: {}
        }
    },
    components: {
        SensorLine,
        SensorBar
    },
    methods: {
		...mapActions (
          [
              'updateActiveStd'
        ]
      ),
		editClicked() {
			this.updateActiveStd(this.std)
			this.$router.push({name: 'home' })
		},
		
    },
    created() {
        var inputData = this.sns.measurements;
        var m = []
        var l = []
        
        for(var i = 0; i < inputData.length; i++) {
            var input = inputData[i];
            l.push(input.mName);
            m.push(input.mValue);
        }
        this.outputData = {
            m: m,
            l: l}
        
    }
}

</script>


<<style scoped>

.my-card.mdl-card {
            width: 310px;
            min-width: 360px;
            max-width: 3600px;
            min-height: 480px;
            max-height: 480px;
}

.mdl-grid {
	margin-top: 2px;    
}
.mdl-cell {
    width:95px;
    min-width: 95px;
}
.mdl-card__media > img {
	max-width: 100%;
}
.mdl-card__actions {
	display: flex;
	box-sizing:border-box;
	align-items: center;
}
.mdl-card__actions > .mdl-button--icon {
	margin-right: 3px;
	margin-left: 3px;
}

.mdl-chip {
  height: 32px;
  width: 140px;
  font-family: "Roboto", "Helvetica", "Arial", sans-serif;
  line-height: 32px;
  padding: 0 12px;
  border: 0;
  border-radius: 16px;
  background-color: #dedede;
  display: inline-block;
  color: rgba(0,0,0, 0.87);
  margin: 2px 0;
  font-size: 0;
  white-space: nowrap; 
  }

  .mdl-chip__contact {
    height: 32px;
    width: 32px;
    border-radius: 16px;
    display: inline-block;
    vertical-align: middle;
    margin-right: 10px;
    overflow: hidden;
    text-align: center;
    font-size: 18px;
    line-height: 32px; 
    }

</style>


