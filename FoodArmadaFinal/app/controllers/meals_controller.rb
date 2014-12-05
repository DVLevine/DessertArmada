class MealsController < ApplicationController
  # Actions
  def new
    puts "!!!!!!!!!!!!!! NEW !!!!!!!!!!!!!!!!"
    @meal = Meal.new
  end
  
  def create
    puts "!!!!!!!!!!!!!! CREATE !!!!!!!!!!!!!!!!"
    @meal = Meal.new(meal_params)
    if @meal.save
      if meal_params[:image].present?
        render :crop
      else
        @meal.user_id = session[:user_id]
        @meal.save
        redirect_to url_for(:controller=>:meals,:action=>:show)
        #redirect_to root_url, notice: "Thank you for uploading!"
      end
    else
      render "new"
    end
  end
    

  def destroy
    puts "!!!!!!!!!!!!!! DESTROY !!!!!!!!!!!!!!!!"
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to url_for(:controller=>:meals,:action=>show)
  end


 # def update
 #   @meal = Meal.find(params[:id])
 #   if @meal.update_attributes(meal_params)
 #     if meal_params[:image].present?
 #       render :crop
 #       Meal.update_crop()
 #     else
 #       redirect_to url_for(:controller=>:meals,:action=>:show)
 #     end
 #   else
 #     render :new
 #   end
 # end

  def update
    puts "!!!!!!!!!!!!!! UPDATE !!!!!!!!!!!!!!!!"
    # PLAN: UPDATE SETS GLOBAL MODEL QUALITIES
    # MODEL QUALITIES USED FOR CROP

    @meal = Meal.find(params[:id])
    puts "PROCEED"
    if @meal.update_attributes(meal_params)
      puts "%%%%%%%%%%%%%%%%% BIG CLAUSE 1 %%%%%%%%%%%%%%%%"
      if meal_params[:image].present?
        puts "%%%%%%%%%%%%%%% MINICLAUSE 1 %%%%%%%%%%%%%%%%%%%"

        render :crop
        @meal.crop()
        #(meal_params[:crop_x].to_i, meal_params[:crop_y].to_i, meal_params[:crop_h].to_i, meal_params[:crop_w].to_i)
        puts "WATCH YOU ALLLLS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts meal_params[:crop_y].to_i
        puts meal_params[:crop_x].to_i
        puts ("*****FFFFFIIIIGGGGAAAARRROOOOOOOFIGAROFIGAROFIGAROFIGARO******")
      else
        puts "%%%%%%%%%%%%%%% MINICLAUSE 2 %%%%%%%%%%%%%%%%%%%"
        @meal.user_id = session[:user_id]

        #######
        puts(" BEDA BOOOM BEDA BOOM BEDA BOOM ")

    #source = Magick::Image.read(image.current_path).last
    #source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)

    imageo = Magick::ImageList.new(@meal.image.current_path)



  #   #x = 200
  #   #y = 200
  #   #h = 200
  #   #w = 200
     size = FastImage.size(@meal.image.current_path)

     width = size[0]#imageo.columns
     height = size[1]#imageo.rows
  # #  puts "WIDTHEO"
  # #  puts width
  # #  puts "HEIGHTEO"
  # #  puts height

  #   #size = FastImage.size(image.current_path)
     puts(size)

     picRatio = Float(width)/Float(height)

     if width > height
        factorH = Float(height)/@meal.crop_h.to_i
        factorW = Float(width)/((@meal.crop_w.to_i)*picRatio)
      else
        factorW = Float(width)/@meal.crop_w.to_i
        factorH = Float(height)/((@meal.crop_h.to_i)*(1.0/picRatio))

      end
    # factorW = Float(width)/@meal.crop_w.to_i
    # factorH = Float(height)/@meal.crop_h.to_i

     puts "FACTOR_W"
     puts factorW

     puts "FACTOR_H"
     puts factorH
    
     if size[0] > 600 and size[1] <= 600
       x = ((@meal.crop_x.to_i))*Float(factorW).to_i
       w = ((@meal.crop_w.to_i))*Float(factorW).to_i
       y = ((@meal.crop_y.to_i))
       h = ((@meal.crop_h.to_i))

       puts ("dingo")
     elsif size[1] > 600 and size[0] <= 600
       y = ((@meal.crop_y.to_i))*Float(factorH).to_i
       h = ((@meal.crop_h.to_i))*Float(factorH).to_i
       x = ((@meal.crop_x.to_i))
       w = ((@meal.crop_w.to_i))

       puts ("ringo")
     else
       x = ((@meal.crop_x.to_i))
       y = ((@meal.crop_y.to_i))
       w = ((@meal.crop_w.to_i))
       h = ((@meal.crop_h.to_i))
       puts ("bingcroz")
     end

    x = ((@meal.crop_x.to_i))*Float(factorW).to_i
    w = ((@meal.crop_w.to_i))*Float(factorW).to_i
    y = ((@meal.crop_y.to_i))*Float(factorH).to_i
    h = ((@meal.crop_h.to_i))*Float(factorH).to_i

 
     puts "X Position"
     puts x
     puts "Y Position"
     puts y
     puts "Width"
     puts w
     puts "Height"
     puts h
    

     cropped_image = imageo.crop(x, y, w, h)
     cropped_image.write(@meal.image.current_path)
  #   #imageo.crop!(x,y,w,h)

      @meal.image.recreate_versions!

        #######

        @meal.save
        redirect_to url_for(:controller=>:meals,:action=>:show)
      end
       else
        puts "%%%%%%%%%%%%% BIG CLAUSE 2 %%%%%%%%%%%%%%%"
      render :new
    end
  end


  def show
    puts "!!!!!!!!!!!!!! SHOW !!!!!!!!!!!!!!!!"
    puts session[:user_id]
    @user=User.find_by(id: session[:user_id])
  end
  
    private
    
  def meal_params
    params.require(:meal).permit(:user_id,:image,:crop_x, :crop_y, :crop_w, :crop_h)
  end
  
end
