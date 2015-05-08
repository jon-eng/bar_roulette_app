App.Views.Bars = Backbone.View.extend({

  el: '#bars-container',

  initialize: function(){
    this.listenTo(this.collection, 'reset', this.renderAll);
    this.listenTo(this.collection, 'add', this.render);

  },

  renderAll: function(){
    this.$('#display').empty();
    this.collection.each(this.render, this)
  },

  render: function(bar){
    this.$('#display').append(new App.Views.bar({ model: bar }).$el)
  },

  events: {
    'click #search' : 'searchForBar'
  },

  searchForBar: function(){


    console.log(this.collection)

  var near = this.$('#near').val();
  var distance = this.$('#distance').val();
  var bar_price = this.$('#bar_price').val();
  this.collection.search(near, distance, bar_price)
  }
})