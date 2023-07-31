export default {
    addToast ({ commit, state }, payload) {
        let parent = document.getElementById('toast_wrapper'),
            list = document.createElement('li'),
            target = null

        payload.id = state.ctr

        commit('addCtr', {})

        list.innerHTML = `
            <div class="wrapper">
                <p>${payload.message}</p>
            </div>
            <div class="close pointer">×</div>
        `
        list.setAttribute('id', 'toast')
        list.setAttribute('class', `toast_${payload.id} ${payload.type}`)

        parent.prepend(list)

        commit('addToasts', {})

        target = document.querySelector(`.toast_${payload.id} .close`)

        target.addEventListener('click', function(e) {
            this.parentNode.remove()
        })

        if (document.querySelector(`.toast_${payload.id}`)) {
            setTimeout( () => {
                commit('removeToast', payload)
            }, 2000)
        }
    }
}
