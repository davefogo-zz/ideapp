namespace :export  do
	desc "Prints SubcuentaPuc.all in a seeds.rb way."
	task :seeds_format => :environment do
		SubcuentaPuc.order(:id).all.each do |subcuenta_puc|
			puts "SubcuentaPuc.create(#{subcuenta_puc.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
		end
	end
end