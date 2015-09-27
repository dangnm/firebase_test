var Notifications = React.createClass({
  mixins: [ReactFireMixin],
  getInitialState: function() {
    return {message: "", hasNewItem: false};
  },
  render: function() {
    var message_text = "";
    var hidden = "hidden";
    if(typeof this.state.message != 'undefined' && this.state.message.length > 0) {
      message_text = this.state.message + " has been registered"
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
        message: dataSnapshot.val().phone_number
      });
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
      message: ""
    });
  }

});