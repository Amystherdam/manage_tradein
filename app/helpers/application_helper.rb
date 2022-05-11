module ApplicationHelper
  def set_img(object)
    default_img = '/assets/avatar-default.png'

    case object.class.to_s
    when 'Customer'
      object.avatar.attached? ? object.avatar : default_img
    when 'Product'
      object.packaging.attached? ? object.packaging : default_img
    when 'Sale'
      outgoing_invoice = object.outgoing_invoice
      outgoing_invoice.attached? ? outgoing_invoice : default_img
    when 'User'
      picture = object.user_profile.picture
      picture.attached? ? picture : default_img
    else
      default_img
    end
  end
end
