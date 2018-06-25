<<template>
  
</template>

<script>

export default {
    data () {
        return {
        }
    },
    created() {
        localStorage.removeItem("token")
        this.$router.push({name: 'login' })
    }
}
</script>
