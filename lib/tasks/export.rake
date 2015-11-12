namespace :export  do
	desc "Prints Cliente.all in a seeds.rb way."
	task :seeds_format => :environment do
		Cliente.order(:id).all.each do |cliente|
			puts "Cliente.create(#{cliente.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
		end
	end
end