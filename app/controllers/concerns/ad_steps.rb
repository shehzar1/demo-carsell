module AdSteps
  extend ActiveSupport::Concern

  def phone_step(ad, ad_params)
    return redirect_to @ad if @ad.update(ad_params)

    flash[:alert] = @ad.errors.full_messages.to_sentence
    render_wizard(@ad, {}, ad_id: @ad)
  end

  def image_step(ad, ad_images_params)
    if @ad.images.attach(ad_images_params[:images])
      render_wizard(@ad, {}, ad_id: @ad)
    else
      redirect_to ad_steps_path(:image_step, ad_id: @ad.id), alert: @ad.errors.full_messages.to_sentence
    end
  end
end
