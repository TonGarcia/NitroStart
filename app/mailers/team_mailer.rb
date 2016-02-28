class TeamMailer < ApplicationMailer
  # Send Invitation Email on associate user as a Teammate from a Pitch
  def invitation_email(teammate, pitch)
    @pitch = pitch
    @user = teammate.user
    nested_class_name = pitch.class.to_s.downcase.singularize

    @url  = pitch_teammate_confirm_invitation_url(pitch, teammate)
    @confirm_url = "#{@url}?confirm=accept"
    @decline_url = "#{@url}?confirm=decline"

    mail(to: @user.email, subject: "Você foi Convidado para o Time: #{pitch.name}")
  end

  # Send a DisassociationEmail Notification
  def disassociation_email(teammate, pitch)
    @user = teammate.user
    @pitch = pitch
    mail(to: @user.email, subject: "Você foi desassociado do Time: #{pitch.name}")
  end
end