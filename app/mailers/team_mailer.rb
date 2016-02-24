class TeamMailer < ApplicationMailer
  # Send Invitation Email on associate user as a Teammate from a Pitch
  def invitation_email(teammate, nested_obj)
    @user = teammate.user
    @nested_obj = nested_obj
    nested_class_name = nested_obj.class.to_s.downcase.singularize

    @url  = send("#{nested_class_name}_teammate_confirm_invitation_url", nested_obj, teammate)
    @confirm_url = "#{@url}?confirm=accept"
    @decline_url = "#{@url}?confirm=decline"

    mail(to: @user.email, subject: "Você foi Convidado para o Time: #{nested_obj.name}")
  end

  # Send a DisassociationEmail Notification
  def disassociation_email(teammate, nested_obj)
    @user = teammate.user
    @nested_obj = nested_obj
    mail(to: @user.email, subject: "Você foi desassociado do Time: #{nested_obj.name}")
  end
end