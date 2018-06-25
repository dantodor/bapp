<<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__media">
    			<img src="../assets/login.png" alt="" />
  			</div>
	  	<div class="mdl-card__supporting-text">
				<form action="#">
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"><h4> Username :</h4></div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="text" id="username" v-model="username"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> <h4>Password :</h4></div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="password" id="userpass" v-model="password"/>
						
					</div>
					<div v-if="isError">{{errorMessage}}</div>
				</form>
			</div>
			<div class="mdl-card__actions mdl-card--border">
				<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" @click="logClicked">Log in</button>
			</div>
		</div>
	</main>
 </div>
</template>

<script>

import gql from 'graphql-tag'
import Toast from 'v-toast'
import apolloClient from '../apollo.js'
import {mapActions} from 'vuex'

export default {
    data () {
        return {
            username: '',
			password: '',
			isError: false,
			errorMessage: 'Incorrect username or password, try again'
        }
	},
    methods: {
		...mapActions (
          	[
              'getLocations'
        	]
      	),
        logClicked() {
			apolloClient.mutate({
				// Query
				mutation: gql`mutation ($email: String!, $password: String!) {
					loginUser(email: $email, password: $password) {
							token
						}
					}`,
				// Parameters
				variables: {
					email: this.username,
					password: this.password
				}
			}).then((data) => {
				// Result
				Toast.info('Login success')
				localStorage.setItem("token",data.data.loginUser.token)
				this.getLocations()
				this.$router.push({name: 'home' })
			}).catch((error) => {
				// Error
				this.username=''
				this.password=''
				this.isError = true
				Toast.info('Login failure')
				//alert('Incorrect username or password, try again')
				console.error(error);
		});
		// localStorage.setItem("token","blah")
		// this.$router.push({name: 'home' })
        }
    } 
}

</script>

<<style scoped >
.mdl-layout {
	    align-items: center;
        justify-content: center;
}
.mdl-layout__content {
	padding: 24px;
	flex: none;
	
}
.mdl-card__media > img {
  	max-width: 100%;

}

</style>

