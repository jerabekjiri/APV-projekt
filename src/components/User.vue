<template>
  <div>

    <md-card>
      <md-card-header>
        <md-card-header-text>
          <div class="md-title">{{ user.name }}
            <md-button class="md-raised md-primary" v-if="isSignedIn && (isFriend != 1)" @click="addFriend()">ADD FRIEND</md-button>
          </div>
          <div class="md-subhead">{{ user.information }}</div>

        </md-card-header-text>

        <md-card-media>
        <!--  <img src="../assets/avatar-default.jpg" alt="Avatar" class="rounded-img">-->
          <img :src="user.avatar" alt="Avatar" class="rounded-img">
        </md-card-media>
      </md-card-header>

    </md-card>

    <md-card class="users-meetups" v-if="isSignedIn">
      <md-card-header>
        <md-card-header-text>
          <div class="md-title">{{ user.name }}'s meetups </div>
        </md-card-header-text>
      </md-card-header>
      <md-card-content>

        <md-progress-bar v-if="meetups.length <= 0" md-mode="indeterminate"></md-progress-bar>

        <md-list class="md-triple-line">
          <div v-for="meetup in meetups" :key="meetup.id">

          <md-list-item>

            <div class="md-list-item-text">
              <span>{{ meetup.title }}</span>
              <span>{{ meetup.location }}</span>
              <p>{{ meetup.date | parseDate }}</p>
            </div>

            <md-button class="md-icon-button md-list-action" :to="'/meetup/' + meetup.url">
              <md-icon class="md-primary">info</md-icon>
            </md-button>
          </md-list-item>
          <md-divider></md-divider>

          </div>

        </md-list>

      </md-card-content>
    </md-card>




  </div>

</template>

<script>
import Utils from './Utils/Utils';
import API from '../api/users.js'
export default {
  computed: {
    meetups()
    {
      return this.$store.getters.usersMeetups;
    },
    isSignedIn()
    {
      return this.$store.getters.isAuthenticated;
    },
    user()
    {
      return this.$store.getters.user;
    },
    loggedUser()
    {
      return this.$store.getters.loggedUser;
    }
  },
  created()
  {
    let name = this.$route.params.name;

      this.$store.dispatch('SET_USER', name).then( resp => {


        setTimeout(() => {
          this.proceed();
        },500);

          if(this.isSignedIn)
           this.$store.dispatch('SET_USERS_MEETUPS', resp.data);
         });

  },
  methods: {
    path(img)
    {
     return require('../assets/avatar.jpg');
   },
   addFriend()
   {
     API.addFriend(this.loggedUser.user_id, this.user.user_id);
     this.isFriend = 1;
   },
   proceed()
   {
     API.getRelation(this.loggedUser.user_id, this.user.user_id).then( relation => {
           this.isFriend = relation.data[0];
           console.log(this.loggedUser.user_id);
   });
  }
  },
  mixins: [Utils],
  data()
  {
    return{
      isFriend: null
    }
  }
}
</script>

<style scoped>
.users-meetups{
    margin-top: 15px;
}


</style>
