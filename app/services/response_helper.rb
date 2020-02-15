module ResponseHelper

  private
  def save_and_render model, model_params = nil
    raise '找不到该记录' if model.blank?
    if model_params.present? ? model.update(model_params) : model.save
      model
    else
      raise (user.errors.full_messages.first  rescue '未知错误')
    end
  end
  
end