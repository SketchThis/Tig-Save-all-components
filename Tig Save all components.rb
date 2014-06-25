module TIG
   def TIG.save_all_components()
      m=Sketchup.active_model
      p=m.path.tr("\\","/")
      unless p.empty? # i.e. NOT Untitled/unsaved
        f=File.join(File.dirname(p), "#{m.title}_Components")
        begin
         Dir.mkdir(f)
        rescue
        end
        ns={}
        m.definitions.each{|d|
         next if d.group? || d.image?
         n=d.name.gsub(/[\<\>\{\}\/\\\:\?\"]/, '_0')
         while ns[n]==true
           n.next!
         end
         if d.hidden?
           d.instances.each{|i|
              s=File.join(f, i.parent.name.gsub(/[\<\>\{\}\/\\\:\?\"]/, '_0'))
              begin
               Dir.mkdir(s)
              rescue
              end
              c=File.join(s, n)
              begin
              d.save_as(c)
              ns[n]=true
              puts "Saved #{c}"
            rescue
              ns[n]=false
              puts "Failed to save #{c}"
            end
           }
         else # in model
            c=File.join(f, n)
            begin
              d.save_as(c)
              ns[n]=true
              puts "Saved #{c}"
            rescue
              ns[n]=false
              puts "Failed to save #{c}"
            end
         end
         
        }
      end#if
      return
   end
end