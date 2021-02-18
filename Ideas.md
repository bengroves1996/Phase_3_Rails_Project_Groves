<%= form_with model: @project do |f| %>
    <%= f.label :Title%><br>  
    <%= f.text_field :title%><br> 
    <%= f.label :Description%><br>  
    <%= f.text_area :description, size: "60x5" %> <br> 
    <%= f.label :Priority%><br>  
    <%= f.text_field :priority%><br>
    <%= f.submit "Create Project"%> 
<% end %>


params.require([:priority, :title, :description])