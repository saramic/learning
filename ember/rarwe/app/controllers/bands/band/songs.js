import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    updateRating: function(params) {
      var song = params.item,
        rating = params.rating;

      song.set('rating', rating);
    }
  },

  title: '',
  isAddButtonDisabled: Ember.computed('title', function() {
    return Ember.isEmpty(this.get('title'));
  })
});
