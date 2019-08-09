<ul class="tabs">
    <li class="tab col s1"><a href="#all">All</a></li>
    <% @positions.each do |position|%>
    <li class="tab col s1"><a href="#<%=position%>"><%= position %></a></li>
    <% end %>
</ul>


<td><a class="waves-effect waves-light btn green accent-2" href="/players/<%= player.id %>/edit">Add Player</a><td>
