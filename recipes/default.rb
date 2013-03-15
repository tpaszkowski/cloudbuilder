#
# Cookbook Name:: cloudbuilder
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

hostname = node["hostname"] 
host_info = node["cloudbuilder"]["hosts"][hostname]

if !host_info.nil? && !host_info["roles"].nil?
  roles = host_info["roles"]
  Chef::Log.info("Found folllowing roles: #{roles}")
  host_info["roles"].each do |role|
    next if node["cloudbuilder"]["recipies"]["role"][role].nil?
    recipies = node["cloudbuilder"]["recipies"]["role"][role]
    Chef::Log.info("For role: #{role} found folllowing recipies:  #{recipies}")
    node["cloudbuilder"]["recipies"]["role"][role].each do |recipe|
      include_recipe(recipe)
    end
  end
end
