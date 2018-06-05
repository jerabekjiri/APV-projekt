<template>
<div>
  <md-card>
       <md-card-content>
         <div class="md-layout md-gutter">
           <div class="md-layout-item md-size-60">
             <md-field>
               <md-icon>search</md-icon>
               <label>Search a meetup</label>
               <md-input v-model="search" v-on:input="filterList()"></md-input>
             </md-field>
         </div>

         <div class="md-layout-item md-size-20">
           <md-checkbox v-model="radio" value="upcoming" :change="changeTime()">Upcoming meetups</md-checkbox>
          </div>
         <div class="md-layout-item md-size-20">
           <md-checkbox v-model="radio" value="past"  :change="changeTime()">Past meetups </md-checkbox>

         </div>
       </div>

       </md-card-content>
     </md-card>
</div>
</template>

<script>
export default {
  data() {
    return {
      radio: null,
      search: null,
      filtered: null
    }
  },
  methods: {
    filterList() {

    let filtered = this.meetups.filter(meetup => {
      return meetup.title.toLowerCase().includes(this.search.toLowerCase());
  });

  this.$emit('filtered', filtered);

},

changeTime()
{
  let f = []
  if(this.radio == 'upcoming')
  {
    let now = Date.now();
    f = this.meetups.filter(meetup => meetup.date > Math.floor(now/1000));
  }

  if(this.radio == 'past')
  {
    let now = Date.now();
    f = this.meetups.filter(meetup => meetup.date < Math.floor(now/1000));
  }

  if(this.radio == null)
  {
    f = this.meetups;
  }

  this.$emit('filteredDate', f);

}
},
created()
{

},
props: ['meetups']

}
</script>

<style>


</style>
