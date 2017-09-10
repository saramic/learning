import Ember from 'ember';

var SongCollection = Ember.Object.extend({
  content: [],
  sortProperties: ['rating:desc'],
  sortedContent: Ember.computed.sort('content', 'sortProperties'),
});

var songs = SongCollection.create();
songs.get('content').pushObject(blackDog);
songs.get('content').pushObject(yellowLedbetter);
songs.get('content').pushObject(pretender);

var alwaysWaiting = Song.create({
  title: 'Always Waiting',
  band: 'Kaya Project',
  rating: 5
})

window.newSong = alwaysWaiting;
window.songs = songs;

export default Ember.Route.extend({
  model: function() {
    return songs;
  }
});
