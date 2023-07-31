export default {
    populateTitle (state, payload) {
        state.title = payload.title
    },
    userAuthentication (state, payload) {
        state.authenticated = payload.status
    }
}
