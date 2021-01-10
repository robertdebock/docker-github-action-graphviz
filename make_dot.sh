#!/bin/sh

this_role=$(cat meta/main.yml | shyaml get-value galaxy_info.role_name)
cat requirements.yml | shyaml get-value roles | while read dash name role rest ; do cat << EOF
digraph PhiloDilemma {
  label = "Robert de Bock" ;
  overlap=false
  {
    "${this_role}" [fillcolor=yellow style=filled penwidth=3]
    "${role}" [fillcolor=green style=filled]
  }
  "${this_role}" -> "${role}"
}
EOF
done > requirements.dot
