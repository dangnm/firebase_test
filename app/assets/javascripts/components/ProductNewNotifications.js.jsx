var ProductNewNotifications = React.createClass({
  mixins: [ReactFireMixin],
  getInitialState: function() {
    return {id: "", name: "", description: "", created_at: "", hasNewItem: false};
  },
  render: function() {
    var message_text = "";
    var hidden = "hidden";
    if(typeof this.state.name != 'undefined' && this.state.name.length > 0) {
      message_text = this.state.name + " has been registered"
      hidden = "";
    }
  
    return (
      <div className={" alert alert-info "+hidden} >
        <a href="#" className="close" onClick={this.close} title="close">×</a>
        <strong>Info!</strong> {message_text}
      </div>
    );
  },
  componentWillMount: function() {
    this.firebaseRef = new Firebase("https://incandescent-inferno-5706.firebaseio.com/last_created_product/");
    this.firebaseRef.orderByChild("created_at").on("child_added", function(dataSnapshot) {
      if (!this.state.hasNewItem) return;
      this.setState({
        id: dataSnapshot.val().id,
        name: dataSnapshot.val().name,
        description: dataSnapshot.val().description,
        created_at: dataSnapshot.val().created_at,
      });
      this.props.onNewProductAddedRealtime(dataSnapshot.val().id, dataSnapshot.val().name, dataSnapshot.val().description, dataSnapshot.val().created_at);
    }.bind(this));

    this.firebaseRef.once('value', function(messages) {
      newItems = true;
      this.setState({
        hasNewItem: true
      });
    }.bind(this));

  }, 
  close: function() {
    this.setState({
      name: ""
    });
  }

});