include_recipe "openssl"

packages = Array.new

case node[:lsb][:codename]
when "lucid", "precise"
  packages |= %w/
    ca-certificates
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
