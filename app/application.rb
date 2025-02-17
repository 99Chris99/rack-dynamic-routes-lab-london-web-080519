class Application
 
    # @@songs = [Song.new("Sorry", "Justin Bieber"),
    #           Song.new("Hello","Adele")]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
  
        item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry/
        item = @@items.find{|item| item.name == item_title}
         if item != nil
        resp.write item.price
         else
        resp.status = 400
        resp.write "Item not found" 
        end
    else
        resp.status = 404
        resp.write "Route not found"
      end
  
      resp.finish
    end
  end