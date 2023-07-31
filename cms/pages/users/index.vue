<template lang="html">
  <div id="dashboard" v-if="loaded">

    <div class="actions">
      <nuxt-link to="/users/create" class="success button pointer" v-if="checkPermission('add-user', true)">
        <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
        <span>Add Item</span>
      </nuxt-link>
    </div>

    <table class="table">
      <thead>
        <tr>
          <th class="stick">
            <div class="label">
              Full Name
            </div>
          </th>
          <th class="stick">
            <div class="label">
              Role
            </div>
          </th>
          <th class="stick">
            <div class="label">
              Email
            </div>
          </th>
          <th class="stick">
            <div class="label">
              Created At
            </div>
          </th>
          <th class="stick">
            <div class="label">
              Action
            </div>
          </th>
        </tr>
      </thead>
      <tbody v-if="records.data.length > 0">
        <tr v-for="(data, key) in records.data" :key="key">
          <td>
            <nuxt-link :to="`/users/${data.id}/update`" class="wrapper">
              <div class="name">{{ data.user_detail.full_name }}</div>
            </nuxt-link>
          </td>
          <td>{{ data.role.name }}</td>
          <td>{{ data.email }}</td>
          <td>{{ $moment(data.created_at).format('MMM DD, YYYY hh:mm A') }}</td>
          <td class="buttons" width="208px">
            <div class="wrapper">
              <nuxt-link :to="`/users/${data.id}/update`" class="item info pointer" v-if="checkPermission('update-user', true)">
                <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" class="icon">
                  <path d="M14.06,9L15,9.94L5.92,19H5V18.08L14.06,9M17.66,3C17.41,3 17.15,3.1 16.96,3.29L15.13,5.12L18.88,8.87L20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18.17,3.09 17.92,3 17.66,3M14.06,6.19L3,17.25V21H6.75L17.81,9.94L14.06,6.19Z" />
                </svg>
                <span>Edit</span>
              </nuxt-link>
              <div class="item ml cancel pointer" @click="toggleModalStatus({ type: 'delete_confirmation', status: true, item: { api: `cms/users/${data.id}`, item_type: 'user' } })" v-if="checkPermission('delete-user', true)">
                <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" class="icon">
                  <path d="M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19M8,9H16V19H8V9M15.5,4L14.5,3H9.5L8.5,4H5V6H19V4H15.5Z" />
                </svg>
                <span>Delete</span>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
      <tbody class="no_results" v-else>
        <tr>
          <td colspan="5">No Result(s) Found.</td>
        </tr>
      </tbody>
    </table>

    <!-- Pagination -->
    <pagination
      :current="records.current_page"
      :last="records.last_page"
    />
  </div>
</template>

<script>
  export default {
    data: () => ({
      records: [],
      loaded: false
    }),
    mounted () {
      this.pagePermission(this, 'users')
    },
    asyncData ({ $axios, store, query }) {
      let page = (query.page) ? query.page : '',
          api_route = ''

      if (page) {
        api_route = `cms/users?page=${page}`
      } else {
        api_route = 'cms/users'
      }

      store.commit('global/settings/populateTitle', { title: 'Users' })

      return $axios.$get(api_route).then(({ records }) => {
        return {
          records: records
        }
      }).catch(err => {
        store.commit('global/modal/toggleModalStatus', { type: 'catcher', status: true, item: { errors: err.response.data.errors } })
      })
    }
  }
</script>
