<template>
  <div>
<md-card class="meetup">
  <md-card-media-cover md-solid>
    <md-card-media>
      <img src="../assets/card-default.jpg">

      <md-button v-if="isEditable()" class="md-fab md-primary edit-btn" @click="editMeetup(meetup.url)">
        <md-icon>edit</md-icon>
      </md-button>

    </md-card-media>

    <md-card-area>
      <md-card-header>
        <span class="md-title">{{ meetup.title }}</span>
        <span class="md-subhead">{{ meetup.date | parseDate }}</span>
        <span v-if="meetup.members > 0" class="md-subhead">Members: {{ meetup.members }}</span>
        <span v-else class="md-subhead">No members coming to this meetup at moment</span>

        <span class="md-subhead">Location: {{ meetup.location }}</span>
      </md-card-header>

      <md-card-actions>

        <md-button v-if="isSignedIn" @click="join()">
          <span  v-if="!isJoined" >Join us</span>
          <span v-else>Joined</span>
        </md-button>

      </md-card-actions>

    </md-card-area>
  </md-card-media-cover>
</md-card>

<md-card class="tabs-content">

      <md-card-content>
        <md-tabs>
              <md-tab md-label="Information" :to="'/meetup/' + meetup.url + '/info'"></md-tab>
              <md-tab md-label="Members" :to="'/meetup/' + meetup.url + '/members'"></md-tab>
              <md-tab md-label="Discussion" :to="'/meetup/' + meetup.url + '/discussion'"></md-tab>
        </md-tabs>

        <router-view />
      </md-card-content>
    </md-card>

<!--
    <md-card class="tags-content">
      <md-card-header>
        <div>Tags</div>
      </md-card-header>

      <md-card-content>
          <md-chip class="md-primary">Tech</md-chip>
          <md-chip class="md-primary" >JS</md-chip>
          <md-chip class="md-primary">Programming</md-chip>
      </md-card-content>
    </md-card>-->




  </div>
</template>

<script>
import API from '../api/meetups';
import Utils from './Utils/Utils';
export default {
  computed: {
    meetup()
    {
      return this.$store.getters.meetup;
    },
    isJoined()
    {
      if(this.$store.getters.meetup.joined == 0)
      {
        return false;
      }

    return true;
    },
    isSignedIn()
    {
       return this.$store.getters.isAuthenticated;
    },
    user()
    {
      return this.$store.getters.loggedUser;
    }

  },
  created()
  {
    let url = this.$route.params.url;
    this.$store.dispatch('GET_MEETUP', url);


    /*  API.getImage('test').then(response =>{
        let image = btoa(
               new Uint8Array(response.data)
                 .reduce((data, byte) => data + String.fromCharCode(byte), '')
             );
             let result = `data:${response.headers['content-type'].toLowerCase()};base64,${image}`;

             console.log(result);
      });*/
  },
  methods: {
    join()
    {
        if(!this.isJoined)
        {
          this.$store.dispatch('JOIN_MEETUP', this.meetup);
        }
        else {
          this.$store.dispatch('UNJOIN_MEETUP', this.meetup);
        }
    },
   editMeetup(url)
   {
     this.$store.dispatch('EDITED_MEETUP', this.meetup);
     this.$router.push('/meetup/' + url + '/edited');
   },
   isEditable()
   {
     if(this.user.user_id != this.meetup.author_id)
     {
       return false;
     }

     return true;
   }
 },
 data()
 {
   return {
     img: null
   }
 },
 mixins: [Utils]
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .md-card-header-text div{
      margin-bottom: 10px;
  }

  .md-content {
    width: 100%;
    height: 200px;
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }

  .tabs-content{
    margin-top: 25px;
  }

  .tags-content{
    margin-top: 25px;
  }


</style>
