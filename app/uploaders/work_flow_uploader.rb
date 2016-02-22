# encoding: utf-8

class WorkFlowUploader < ImageUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    'defaults/how_works_flow.png'
  end
end