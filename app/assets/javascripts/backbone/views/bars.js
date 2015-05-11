App.Views.Bars = Backbone.View.extend({

  el: '#bars-container',

  initialize: function() {
    this.listenTo(this.collection, 'reset', this.renderAll);
    this.listenTo(this.collection, 'add', this.render);

  },

  renderAll: function() {
    this.$('#display').empty();
    this.collection.each(this.render, this)
  },

  render: function(bar) {
    this.$('#display').append(new App.Views.Bar({ model: bar }).$el)
  },

  events: {
    'click #search': 'searchForBar'
  },

  searchForBar: function() {

    var near = this.$('#near').val();
    var distanceConverted = this.$('#distance').val();
    var bar_price = (this.$('#bar_price').val());
      
    var distance = distanceConverted * 1609.34;

    var query = [near, distance, bar_price];

    this.collection.fetch({
      data: {
        query: query
      },
      reset: true
    })

    // console.log(this.collection)
  }
})