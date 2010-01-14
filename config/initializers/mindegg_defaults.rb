# Be sure to restart your server when you modify this file.

# These settings change the default Rails behaviours to better suit the MindEgg
# environment.

# Don't dasherize XML. (Dash is not a valid character for a Flex identifier.)
# See Flex on Rails p12, bottom of page.
# Update: Unfortunately, this doesn't seem to work. Not sure why but possibly a Rails bug / change. There is a long discussed bug on lighthouse covering the issue.
#         Dasherize will need to be set to false in each to_xml call
#ActiveSupport.dasherize_xml = false
