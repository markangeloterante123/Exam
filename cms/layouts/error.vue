<template>
    <transition name="fade">
        <div id="dashboard" class="error" v-if="loaded">
            <div class="wrapper" v-if="error.statusCode == 404">
                <div class="icon">
                    <img src="/logo.png" />
                </div>
                <h1 class="title">Error 404</h1>
                <h2 class="subtitle">The page you are trying to visit does not exist.</h2>
                <nuxt-link to="/dashboard" class="primary button">Back to Dashboard</nuxt-link>
            </div>
            <div class="wrapper" v-else-if="error.statusCode == 403">
                <div class="icon">
                    <img src="/logo.png" />
                </div>
                <h1 class="title">Error 403</h1>
                <h2 class="subtitle">You don't have access to this page.</h2>
                <nuxt-link to="/dashboard" class="primary button">Back to Dashboard</nuxt-link>
            </div>
            <div class="wrapper" v-else-if="error.statusCode == 401">
                <div class="icon">
                    <img src="/logo.png" />
                </div>
                <h1 class="title">Error 401</h1>
                <h2 class="subtitle">Oops! Looks like your token has been expired!</h2>
                <nuxt-link to="/" class="primary button">Re-Login</nuxt-link>
            </div>
            <div class="wrapper" v-else>
                <div class="icon">
                    <img src="/logo.png" />
                </div>
                <h1 class="title">Oops</h1>
                <h2 class="subtitle">Something Went Wrong!</h2>
                <nuxt-link to="/dashboard" class="primary button">Back to Dashboard</nuxt-link>
            </div>
        </div>
    </transition>
</template>

<script>
	export default {
		props: ['error'],
        layout: 'default',
        data () {
            return {
                loaded: false
            }
        },
        methods: {
            initialization () {
                const me = this
                let page_title = ''

                switch (me.error.statusCode) {
                    case 404:
                        page_title = '404'
                        break
                    case 403:
                        page_title = '403'
                        break
                    case 401:
                        page_title = '401'
                        break
                }

                me.$store.commit('global/settings/populateTitle', { title: page_title })
                setTimeout( () => {
                    me.loaded = true
                }, 500)
            }
        },
        mounted () {
            const me = this
            me.initialization()
        }
	}
</script>
