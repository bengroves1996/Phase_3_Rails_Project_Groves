# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* <h3>What task should created for <%= Project.all[0].title %>?</h3>

<%= form_with model: @task, local: true do |t| %>
    <%= t.label :Objective%><br>  
    <%= t.text_area :objective, size: "60x5" %> <br> 
    <%= t.label :Completed?%>  
    <%= t.check_box :complete %> <br> 
    <%= t.submit "Create Project"%>  <br>    
<% end %>

<% if flash[:notice] %>
<div class="notice"><%= flash[:notice] %></div>
<% end %>
