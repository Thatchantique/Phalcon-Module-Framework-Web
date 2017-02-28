<h2 class="ui aligned icon page-header">
    <i class="circular users icon"></i>
    User management
</h2>

<div class="ui action input" id="barAddUser">
    <button class="ui button" id="addUser"><i class="add user icon"></i> Nouvel utilisateur...</button>
    <input type="text" id="inputAddUser">
</div>

<table class="ui sortable striped table">
    <thead>
    <tr>
        <th class="no-sort"  style="text-align:center">
            <div class="ui checkbox">
                <input type="checkbox" name="example">
                <label></label>
            </div>
        </th>
        <th class="sorted descending">Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Role</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    {% for user in users %}
    <tr>
        <td style="text-align:center">
            <div class="ui checkbox">
                <input type="checkbox" name="example">
                <label></label>
            </div></td>
        <td>{{ user.getFirstname() }}</td>
        <td>{{ user.getLastname() }}</td>
        <td>{{ user.getEmail() }}</td>
        <td>{{ user.getRole().getName() }}</td>
        <td style="text-align:center">

            {{link_to("user/form/"~user.getId(),
            "<button class='ui icon button'>
					<i class='edit icon'></i>
				</button>") }}

            <button class="ui icon button red inverted">
                <i class="delete icon"></i>
            </button>
        </td>
        {% endfor %}
    </tbody>
</table>

//http://localhost:8080/s4-userManagement-0/TD1_2/Users