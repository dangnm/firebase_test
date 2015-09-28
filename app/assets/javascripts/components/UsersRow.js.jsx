var UsersRow = React.createClass({
  render: function() {
    return (
      <tr className={"user"} >
        <td className={"phone_number"} >
          {this.props.user['phone_number']}
        </td>
        <td className={"created_at"} >
          {this.props.user['created_at']}
        </td>
        <td className={"remove"} >
          <a href="#" onClick={this.remove} >x</a>
        </td>
      </tr>
    );
  },
  componentWillMount: function() {
    
  },
  remove: function() {
    this.props.onDeleteUser(this.props.user['id']);
  }

});