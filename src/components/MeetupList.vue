<template>
  <div>
    <div class="filter">
      <FilterMeetups :meetups="meetupsTitleDate" @filtered="filteredMeetups"  @filteredDate="filteredMeetups"></FilterMeetups>
    </div>

<div v-if="meetups.length > 0">

    <md-card v-for="meetup in meetupsList" :key="meetup.id" class="meetup md-primary">
      <md-card-media-cover md-solid>
        <md-card-media>
        <!--  <img v-if="meetup.img" :src="meetup.img">-->
        <img src="../assets/card-default.jpg">
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title">{{ meetup.title }}</span>
            <span class="md-subhead">{{ meetup.date | parseDate }}</span>
            <span class="md-subhead">Location: {{ meetup.location }}</span>
            <span v-if="meetup.members > 0"class="md-subhead">Members: {{ meetup.members }}</span>
            <span v-else class="md-subhead">No members coming to this meetup at moment</span>
          </md-card-header>

          <md-card-actions>
            <md-button :to="'/meetup/' + meetup.url">Meet us</md-button>
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover>
    </md-card>

  </div>
  <div class="spinner" v-else>
      <md-progress-spinner md-mode="indeterminate"></md-progress-spinner>
    </div>
  </div>
</template>

<script>
import API from '../api/meetups';
import Utils from './Utils/Utils';
import FilterMeetups from './FilterMeetups';
export default {
  data()
  {
    return {
      isLoaded: false,
      meetupsTitleDate: [],
      meetupsList: [],
      meetups: []
    }
  },
  methods: {
      getTitles(meetups)
      {
        meetups.forEach( meetup => {
          this.meetupsTitleDate.push({title: meetup.title, date: meetup.date});
        });
      },
      filteredMeetups(filtered)
      {
        let f = [];
          filtered.forEach( fMeetup => {

            f.push(this.meetups.filter( meetup => meetup.title == fMeetup.title)[0]);

          });

          this.meetupsList = f;
      },
      filteredDate(filtered)
      {
        /*let f = [];
          filtered.forEach( fMeetup => {

            f.push(this.meetups.filter( meetup => meetup.title == fMeetup.title)[0]);

          });

          console.log(f);*/
      }
    },
    created()
    {
      this.$store.dispatch('getMeetups').then(resp => {
        this.getTitles(resp.data);
        this.meetups = this.$store.getters.meetups;
        this.meetupsList = this.$store.getters.meetups;

      });

    },
    mixins: [Utils],
    components: {FilterMeetups}
}
</script>

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

  .meetup{
    margin-bottom: 15px;
  }

  .spinner {
    text-align: center;
  }

  .filter{
    margin-bottom: 15px;
  }

</style>
