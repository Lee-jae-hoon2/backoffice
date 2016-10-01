<!DOCTYPE html>
<html lang="en">

<head>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
    <meta charset=utf-8 />
    <title>Morris.js Line Chart Example</title>
  
</head>
<body>
  <script>
        jQuery(document).ready(function($) {
            Morris.Line({
                element: 'line-example',
                data: [
                    { y: '2006', a: 100, b: 90 },
                    { y: '2007', a: 75,  b: 65 },
                    { y: '2008', a: 50,  b: 40 },
                    { y: '2009', a: 75,  b: 65 },
                    { y: '2010', a: 50,  b: 40 },
                    { y: '2011', a: 75,  b: 65 },
                    { y: '2012', a: 100, b: 90 }
                ],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Series A', 'Series B']
            });
        });
    </script>
<div style="width: 600px; height: 300px;"  id="line-example"></div>
</body>


</html>
