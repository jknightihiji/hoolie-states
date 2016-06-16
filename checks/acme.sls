{% set workingminion = pillar.get('minionid', '') %}


{% set siteip = salt['mine.get'](tgt=workingminion, fun='weburl', expr_form='glob')[0] %}


"Check deployed site":
  http.query:
    - name: 'http://{{ siteip }}'
    - status: 200