import Vue from 'vue';
import Vuex from 'vuex';
import apolloClient from '../apollo.js';

import gql from 'graphql-tag';

Vue.use(Vuex);


const store = new Vuex.Store({
	state: {
        locations: [],
        activeLoc: {},
        activeSns: {}
	},
	mutations: {
		SET_LOCATIONS(state, locs){
			state.locations = locs;
		},
        SET_ACTIVE_LOC (state, loc) {
            state.activeLoc = loc
        },
        SET_ACTIVE_SNS (state, sns) {
            state.activeSns = sns
        }
	},
	actions: {
		getSensors(context){
            
			apolloClient.query({
				query: gql`query sensors($idl: Int!) {
                    sensors(locId: $idl) {
                      id
                      sName
                      gtype
                      measurements {
                        mName
                        mValue
                      }
                    }
                  }`,
                  variables : {
                    idl: parseInt(context.state.activeLoc.id)
                  }
			}).then((result) => {
                context.commit('SET_ACTIVE_SNS', JSON.parse(JSON.stringify(result.data)));
            }).catch((error) => {
                // Error
				console.error(error);
		    });
        },
        getLocations({ commit }){
            
			apolloClient.query({
				query: gql`query locations {
                    locs {
                        id
                        locName 
                        sensors {
                          id
                          sName
                        }
                      }
                  }`
			}).then((result) => {
				commit('SET_LOCATIONS', JSON.parse(JSON.stringify(result.data.locs)));
            }).catch((error) => {
				// Error
				console.error(error);
		    });
        },
        updateActiveLoc ({ commit }, loc)  {
            commit('SET_ACTIVE_LOC', loc)
        },
        updateActiveSensor ({ commit }, sns)  {
            commit('SET_ACTIVE_SNS', sns)
        }
        
	}
});

export default store;
