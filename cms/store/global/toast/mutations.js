export default {
    removeToast (state, payload) {
        let parent = document.getElementById('toast_wrapper')

        if (document.querySelector(`.toast_${payload.id}`)) {
            parent.removeChild(document.querySelector(`.toast_${payload.id}`))
        }
        state.toasts = document.querySelectorAll('#toast_wrapper #toast').length
    },
    addToasts (state, payload) {
        state.toasts = document.querySelectorAll('#toast_wrapper #toast').length
    },
    addCtr (state, payload) {
        state.ctr += 1
    }
}
