module Jekyll
    class WithincategoriesPostNavigation < Generator
      def generate(site)
        site.categories.each_pair do |categories, posts|
          posts.sort! { |a,b| b <=> a}
          posts.each do |post|
            index = posts.index post
            next_in_categories = nil
            previous_in_categories = nil
            if index
              if index < posts.length - 1
                next_in_categories = posts[index + 1]
              end
                if index > 0
                previous_in_categories = posts[index - 1]
              end
            end
            post.data["next_in_categories"] = next_in_categories unless next_in_categories.nil?
            post.data["previous_in_categories"] = previous_in_categories unless previous_in_categories.nil?
          end
        end
      end
    end
  end