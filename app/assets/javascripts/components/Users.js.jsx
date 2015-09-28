var Users = React.createClass({
  mixins: [ReactFireMixin],
  getInitialState: function() {
    return {
      users: this.props.users
    };
  },
  handleDeleteUser: function(id) {
    _this = this;
    $.ajax({
      method: 'DELETE',
      url: "/users/"+id,
      dataType: 'JSON',
      success: function () {
        var users = _this.state.users.filter(function (user) {
                        return user.id !== id;
                       });
        _this.setState({
          users: users
        });
      }
    });
        
  },
  render: function() {
    rows = [];
    _this = this;
    this.state.users.forEach(function(user) {
      rows.push(
        <UsersRow key={user.id} onDeleteUser={_this.handleDeleteUser} user={user}  />
      );
    });

  
    return (
      <div>
        <UserNewNotifications onNewUserAddedRealtime={this.handleNewUserAddedRealtime} />
        <table className={"table"} >
          <thead>
            <tr>
              <th>Phone number</th>
              <th>Joined time</th>
            </tr>
          </thead>
          <tbody>
            {rows}
          </tbody>
        </table>
      </div>
    );
  },
  componentWillMount: function() {
    
  },
  handleNewUserAddedRealtime: function(id, phone_number, created_at) {
    var users = this.state.users;
    users.unshift({
      id: id,
      phone_number: phone_number,
      created_at: created_at
    });
    this.setState({
      users: users
    });
  }

});