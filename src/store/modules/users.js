import API from '../../api/users'

const state = {
  users: [],
  user: {},
  members: [],
  usersMeetups: [],
  friends: []
}

const getters = {
  user: state => state.user,
  usersMeetups: state => state.usersMeetups,
  friends: state => state.friends
}

const mutations = {
  SET_USERS(state)
  {
    API.getUsers().then(response => {
      state.users = response.data;
    });
  },

  SET_USER(state, user)
  {
      state.user = user;
      state.user.avatar = 'http://localhost:4040/img/avatars/' + state.user.avatar;
  },

  SET_USERS_MEETUPS(state, meetups)
  {
    state.usersMeetups = meetups;
  },

  SET_FRIENDS(state, friends)
  {
    state.friends = friends;
  }



}

const actions = {
  getUsers({ commit }) {
    commit('SET_USERS');
  },

  SET_USER({ commit, dispatch }, name) {
    return new Promise((resolve, reject) => {
      API.getUser(name).then(response => {

      commit('SET_USER', response.data);

      resolve(response);
    });
  });

  },

  SET_USERS_MEETUPS({ commit }, user) {

    API.getUsersMeetups(user).then(response => {
        commit('SET_USERS_MEETUPS', response.data);
            });
  },

  SET_FRIENDS({ commit }, user)
  {
    API.getFriends(user.user_id).then(resp => {
      commit('SET_FRIENDS', resp.data);
    });
  }
}

export default { state, mutations, actions, getters }
