export default {
    toggleModalStatus: (state, payload) => {
        state.show[payload.type] = payload.status
        if (payload.item) {
            state.item = payload.item
        }
        if (payload.type == 'catcher' && !payload.status) {
            state.item = {}
        }
        if (!payload.status) {
            document.body.classList.remove('no_scroll')
        }
    }
}
