import Ember from 'ember';

export default Ember.Component.extend({
  tagNmae: 'div',
  classNames: ['rating-panel'],

  rating: 0,
  maxRating: 5,
  item: null,
  setAction: '',
  "on-click": '',

  stars: Ember.computed('rating', 'maxRating', function() {
    var fullStars = this.starRange(1, this.get('rating'), 'full');
    var emptyStars = this.starRange(this.get('rating') + 1, this.get('maxRating'), 'empty');
    return fullStars.concat(emptyStars);
  }),

  starRange: function(start, end, type) {
    var starsData = [];
    for (var i = start; i <= end; i++) {
      starsData.push({ rating: i, full: type === 'full' });
    }
    return starsData;
  },

  actions: {
    set: function(newRating) {
      this.get('on-click')({
        item: this.get('item'),
        rating: newRating
      })
    }
  }
});
