<template>
  <div class="md-layout">

  <div class="md-layout-item  md-size-60">
  <md-card class="meetup-list">
       <md-card-header>
         <div class="md-title"><md-icon>event</md-icon> My upcoming meetups</div>

       </md-card-header>

       <md-card-content>

      <md-list class="md-triple-line">
    <div v-for="meetup in meetups" :key="meetup.id" >

           <md-list-item >

         <div class="md-list-item-text">
           <span>{{ meetup.title }}</span>
           <span> {{ meetup.date | parseDate }} </span>
           <p>{{ meetup.location }}</p>
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

  <div class="md-layout-item md-size-40">
      <md-card class="profile">
       <md-card-header>
         <md-card-header-text>
           <div class="md-title">{{ user.name }}</div>
         </md-card-header-text>

         <md-card-media>
           <img  v-if="user.avatar" :src="user.avatar" class="rounded-img">
           <img  v-else src="../assets/avatar-default.jpg" class="rounded-img">
         </md-card-media>
       </md-card-header>

       <md-card-actions>
         <md-button class="md-icon-button" :to="'/profile-settings'">
          <md-icon>settings</md-icon>
        </md-button>
       </md-card-actions>
     </md-card>

     <md-card class="friend-list">
      <md-card-header>
        <md-card-header-text>
          <div class="md-title">Friends</div>
        </md-card-header-text>
     </md-card-header>
     <md-card-content>

       <md-list class="md-triple-line">
     <div v-for="friend in friends" :key="friend.id" >

            <md-list-item >

          <div class="md-list-item-text">
            <span>{{ friend.name }}</span>
          </div>
          <md-button class="md-icon-button md-list-action" :to="'/user/' + friend.href">
            <md-icon class="md-primary">info</md-icon>
          </md-button>
       </md-list-item>
        <md-divider></md-divider>

      </div>
      </md-list>

    </md-card-content>
    </md-card>


 </div>

  </div>
</template>

<script>
import Members from './meetup-components/Members';
import Utils from './Utils/Utils';
export default {
  computed: {
    isSignedIn()
    {
       return this.$store.getters.isAuthenticated
    },
    user()
    {
        return this.$store.getters.loggedUser;
    },
    meetups()
    {
      return this.$store.getters.joinedMeetups;
    },
    userLoaded()
    {
      return this.$store.getters.userLoaded;
    },
    friends()
    {
      return this.$store.getters.friends;
    }
  },
  created()
  {
    if (!this.userLoaded) {
      this.$store.watch(
        (state) => this.userLoaded,
        (value) => {
          if (value === true) {
            this.proceed()
          }
        }
      )
    } else {
      this.proceed()
    }
  },
  methods: {
    proceed () {
      if (this.$store.getters.userLoaded) {
        this.$store.dispatch('SET_JOINED_MEETUPS', this.user);
        this.$store.dispatch('SET_FRIENDS', this.user);
      }
    }
  },
  mixins: [Utils]
}
</script>

<style scoped>

.friend-list{
  margin-top: 15px;
}


</style>
