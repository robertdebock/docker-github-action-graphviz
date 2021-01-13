#!/bin/sh

this_role=$(cat meta/main.yml | shyaml get-value galaxy_info.role_name)
output_file=requirements.dot

cat << EOF > "${output_file}"
digraph PhiloDilemma {
  label = "Robert de Bock" ;
  overlap=false
  {
    "${this_role}" [fillcolor=yellow style=filled penwidth=3]
EOF

cat requirements.yml | shyaml get-value roles | while read dash name role rest ; do
    echo "    \"${role}\" [fillcolor=green style=filled]" >> "${output_file}"
done

echo "  }" >> "${output_file}"

cat requirements.yml | shyaml get-value roles | while read dash name role rest ; do
  echo "  \"${this_role}\" -> \"${role}\"" >> "${output_file}"
done

echo "}" >> "${output_file}"
