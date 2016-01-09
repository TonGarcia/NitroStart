enum = {}
enum = enum.merge YAML.load_file(Rails.root.join('config/enums', 'locale_icon.yml'))
enum = enum.merge YAML.load_file(Rails.root.join('config/enums', 'social_networks.yml'))

enum = enum.deep_symbolize_keys
ENUM = enum