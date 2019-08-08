<ul class="tabs">
    <li class="tab col s1"><a href="#all">All</a></li>
    <% @positions.each do |position|%>
    <li class="tab col s1"><a href="#<%=position%>"><%= position %></a></li>
    <% end %>
</ul>


<table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>NFL Team</th>
                <th>2018 Points<th>
            </tr>
        </thead>
        <tbody>
        <% Player.all.each do |player| %>
            <tr>
                <td><%= player.first_name %> <%= player.last_name %></td>
                <td><%= player.position %></td>
                <td><%= player.nfl_team %></td>
                <td><%= player.points %></td>
                <td><a class="waves-effect waves-light btn green accent-2" href="/players/<%= player.id %>/edit">Add Player</a><td>
            </tr>
            <% end %>
        </tbody>
    </table>