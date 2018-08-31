REPODIR=/root/ocamlbench-scripts

make_html () {
  echo "<html><head><title>bench index</title></head><body><ul>
    $(ls -dt 201* latest | sed 's%\(.*\)%<li><a href="\1/build.html">\1</a></li>%')
  </ul></body></html>" >build.html

  echo "<html><head><title>bench index</title></head><body>
    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js\"> </script>
    <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css\">
    <style type=\"text/css\" class=\"init\">

    </style>
    <script type=\"text/javascript\" language=\"javascript\" src=\"https://code.jquery.com/jquery-3.3.1.js\"></script>
    <script type=\"text/javascript\" language=\"javascript\" src=\"https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js\"></script>

    <script src=\"compare.js\"></script>
    <script type=\"text/javascript\" class=\"init\">
      \$(document).ready(function() {
        \$('#example').DataTable();
      } );
    </script>
    <div id=\"container\" style=\"width: 90%;\"> <canvas id=\"chart\"></canvas> </div>
    <div> <input type=\"button\" value=\"compare\" id=\"compareButton\" onclick=\"plot()\"> </div>
    </br>" > index.html
  python $REPODIR/build_index.py >> index.html
  echo "</body></html>" >> index.html
}

make_html
