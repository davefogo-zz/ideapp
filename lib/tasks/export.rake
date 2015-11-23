namespace :export  do
	desc "Prints Colaboradore.all in a seeds.rb way."
	task :seeds_format => :environment do
		Colaboradore.order(:id).all.each do |colaboradore|
			puts "Colaboradore.create(#{colaboradore.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
		end
	end
end