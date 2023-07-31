<template>
  <div id="pagination" v-if="last > 1">
    <div :class="`next pointer ${(current == 1) ? 'disabled' : ''}`" @click="getPage(null, current, 'prev')">
      <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#FFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
    </div>

    <div class="text">Page</div>

    <div class="page_number">
      <input type="number" class="input" v-model="page_number" :max="last" @blur="getPage($event, current)">
    </div>

    <div class="text">of {{ last }}</div>

    <div :class="`prev pointer ${(current == last) ? 'disabled' : ''}`" @click="getPage(null, current, 'next')">
      <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#FFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      current: {
        type: Number,
        default: 1
      },
      last: {
        type: Number,
        default: 1
      },
      query_params: {
        type: String,
        default: null
      }
    },
    data: ({ current }) => ({
      page_number: Math.abs(current)
    }),
    watch: {
      current: {
        handler (new_value) {
          this.page_number = new_value
        },
        deep: true
      }
    },
    methods: {
      getPage (event = null, current = null, type = null) {
        let call_api = true

        if (!event) {
          this.page_number = (type == 'prev') ? this.page_number - 1 : this.page_number + 1
          if (this.page_number > this.last) {
            call_api = false
          }
        } else {
          let target = parseInt(event.target.value)
          if (target != 0) {
            if (target <= this.last) {
              if (current != target) {
                this.page_number = parseInt(event.target.value)
              } else {
                call_api = false
              }
            } else {
              call_api = false
            }
          } else {
            call_api = false
          }
        }

        this.page_number = parseInt(this.page_number)

        let url = (this.query_params)
          ? `${this.$route.path}?page=${this.page_number}${this.query_params}`
          : `${this.$route.path}?page=${this.page_number}`

        if (call_api) {
          window.scrollTo({ top: 200, behavior: 'smooth' })
          this.toggleModalStatus({ type: 'loader', status: true })
          this.$router.push(url)
          setTimeout( () => {
            this.toggleModalStatus({ type: 'loader', status: false })
            this.$nuxt.refresh()
          }, 500)
        }
      }
    }
  }
</script>
