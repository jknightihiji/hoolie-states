{% set workingminion = pillar.get('minionid', '') %}


{% set siteip = salt['mine.get'](tgt=workingminion, fun='weburl', expr_form='glob') %}


"Check deployed site":
  http.query:
    - name: 'http://{{ siteip[workingminion][0] }}'
    - status: 200