var NewUserNotifications = React.createClass({
  mixins: [ReactFireMixin],
  getInitialState: function() {
    return {id: "", phone_number: "", created_at: "", hasNewItem: false};
  },
  render: function() {
    var message_text = "";
    var hidden = "hidden";
    if(typeof this.state.phone_number != 'undefined' && this.state.phone_number.length > 0) {
      message_text = this.state.phone_number + " has been registered"
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
    this.firebaseRef = new Firebase("https://incandescent-inferno-5706.firebaseio.com/last_created_user/");
    this.firebaseRef.orderByChild("created_at").on("child_added", function(dataSnapshot) {
      if (!this.state.hasNewItem) return;
      this.setState({
        id: dataSnapshot.val().id,
        phone_number: dataSnapshot.val().phone_number,
        created_at: dataSnapshot.val().created_at,
      });
      this.props.onNewUserAddedRealtime(dataSnapshot.val().id, dataSnapshot.val().phone_number, dataSnapshot.val().created_at);
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
      phone_number: ""
    });
  }

});