
{% set workingminion = pillar.get('minionid', '') %}
{% set funtype = pillar.get('funtype', '') %}


{% set status = salt['mine.get'](tgt=workingminion, fun=funtype, expr_form='glob') %}

{% if status[workingminion]['status'] is defined %}
{% set mymessage = "The webpage status is " + status[workingminion]['status'] %}

{% else %}
{% set mymessage = "The webpage status is " + status[workingminion] %}

{% endif %}

"Send status message of app":
  slack.post_message:
    - name: slack-message
    - channel: '#{{ pillar['slack']['channel'] }}'
    - from_name: {{ pillar['slack']['from_name'] }}
    - api_key: {{ pillar['slack']['api_key'] }}
    - message: "{{ mymessage }}"