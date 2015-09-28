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
      </tr>
    );
  },
  componentWillMount: function() {
    
  }

});